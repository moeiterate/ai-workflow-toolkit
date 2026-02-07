SELECT 
    section,
    table_schema,
    table_name,
    detail_name,
    detail_type,
    detail_value,
    additional_info
FROM (
    -- Tables and Columns
    SELECT 
        'COLUMN' as section,
        t.table_schema,
        t.table_name,
        c.column_name as detail_name,
        c.data_type as detail_type,
        COALESCE(c.character_maximum_length::text, '') as detail_value,
        'nullable: ' || c.is_nullable || 
        CASE WHEN c.column_default IS NOT NULL THEN ' | default: ' || c.column_default ELSE '' END ||
        CASE WHEN pk.column_name IS NOT NULL THEN ' | PRIMARY KEY' ELSE '' END as additional_info
    FROM information_schema.tables t
    JOIN information_schema.columns c 
        ON t.table_name = c.table_name 
        AND t.table_schema = c.table_schema
    LEFT JOIN (
        SELECT ku.table_schema, ku.table_name, ku.column_name
        FROM information_schema.table_constraints tc
        JOIN information_schema.key_column_usage ku
            ON tc.constraint_name = ku.constraint_name
            AND tc.table_schema = ku.table_schema
        WHERE tc.constraint_type = 'PRIMARY KEY'
    ) pk ON c.table_schema = pk.table_schema 
        AND c.table_name = pk.table_name 
        AND c.column_name = pk.column_name
    WHERE t.table_schema = 'public'
        AND t.table_type = 'BASE TABLE'

    UNION ALL

    -- Foreign Key Relationships
    SELECT 
        'FOREIGN_KEY' as section,
        tc.table_schema,
        tc.table_name,
        kcu.column_name as detail_name,
        'REFERENCES' as detail_type,
        ccu.table_name || '.' || ccu.column_name as detail_value,
        'ON UPDATE: ' || rc.update_rule || ' | ON DELETE: ' || rc.delete_rule as additional_info
    FROM information_schema.table_constraints tc
    JOIN information_schema.key_column_usage kcu
        ON tc.constraint_name = kcu.constraint_name
        AND tc.table_schema = kcu.table_schema
    JOIN information_schema.constraint_column_usage ccu
        ON ccu.constraint_name = tc.constraint_name
        AND ccu.table_schema = tc.table_schema
    JOIN information_schema.referential_constraints rc
        ON tc.constraint_name = rc.constraint_name
    WHERE tc.constraint_type = 'FOREIGN KEY'
        AND tc.table_schema = 'public'

    UNION ALL

    -- RLS Policies
    SELECT 
        'RLS_POLICY' as section,
        schemaname as table_schema,
        tablename as table_name,
        policyname as detail_name,
        cmd as detail_type,
        'ROLES: ' || roles::text as detail_value,
        'USING: ' || COALESCE(qual, 'none') || 
        CASE WHEN with_check IS NOT NULL THEN ' | WITH CHECK: ' || with_check ELSE '' END as additional_info
    FROM pg_policies
    WHERE schemaname = 'public'

    UNION ALL

    -- RLS Status
    SELECT 
        'RLS_STATUS' as section,
        schemaname as table_schema,
        tablename as table_name,
        'Row Level Security' as detail_name,
        CASE WHEN rowsecurity THEN 'ENABLED' ELSE 'DISABLED' END as detail_type,
        '' as detail_value,
        '' as additional_info
    FROM pg_tables
    WHERE schemaname = 'public'
) inventory
ORDER BY 
    table_name,
    CASE section 
        WHEN 'RLS_STATUS' THEN 1
        WHEN 'COLUMN' THEN 2
        WHEN 'FOREIGN_KEY' THEN 3
        WHEN 'RLS_POLICY' THEN 4
    END,
    detail_name;
