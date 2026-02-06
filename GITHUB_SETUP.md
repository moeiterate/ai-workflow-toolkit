# GitHub Setup Instructions

## Create Repo on GitHub

1. Go to https://github.com/new
2. Name: `ai-workflow-toolkit`
3. Description: `Prompts and templates for building production software with AI`
4. Public (to share with Ahmad)
5. Don't initialize with README (we already have one)
6. Click "Create repository"

## Push to GitHub

```bash
cd /Users/moazelhag/Desktop/VSCode/ai-workflow-toolkit

# Add GitHub remote (replace YOUR_USERNAME)
git remote add origin https://github.com/YOUR_USERNAME/ai-workflow-toolkit.git

# Rename branch to main (optional, GitHub prefers 'main')
git branch -M main

# Push
git push -u origin main
```

## Share with Ahmad

After pushing, share the repo URL:
```
https://github.com/YOUR_USERNAME/ai-workflow-toolkit
```

## Making Changes

After any edits:
```bash
git add .
git commit -m "Description of changes"
git push
```

## Archive Old Internal Page

The PromptLibrary page in ReThread can be archived since this is now the source of truth.

Location: `/Users/moazelhag/Desktop/VSCode/ReThread/src/pages/PromptLibrary.tsx`

You can either:
- Delete it
- Move to archive folder
- Keep as reference but link to GitHub repo
