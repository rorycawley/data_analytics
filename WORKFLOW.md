# Git Workflow Guide

This document outlines our standard Git workflow. Direct commits to the main branch are disabled - all changes must go through feature branches and pull requests.

## Starting New Work

Always begin by ensuring your main branch is up to date:

```bash
git checkout main
git pull origin main
```

## Creating Feature Branches

Create a new branch for your work using the appropriate naming convention:

```bash
# For new features
git checkout -b feature/my-new-feature

# For critical fixes
git checkout -b hotfix/issue-description
```

## Development Workflow

Check status and make commits:

```bash
git status                          # Check working directory status
git add .                          # Stage all changes
git commit -m "Descriptive message" # Commit changes
```

If main has been updated while you're working, incorporate those changes:

```bash
git checkout feature/my-new-feature
git merge main
```

## Pushing Changes

Push your branch to GitHub, setting up tracking:

```bash
git push -u origin feature/my-new-feature
```

For subsequent pushes, you can simply use:

```bash
git push
```

## Pull Request Process

1. Go to GitHub repository
2. Click "Compare & pull request" for your branch
3. Fill in pull request details
4. Submit the pull request
5. Address any review feedback

## After Pull Request Approval

Once your pull request is approved, merge your changes locally:

```bash
git checkout main
git pull origin main
git merge feature/my-new-feature
git push origin main
```

## Cleanup

Delete your feature branch both locally and on GitHub:

```bash
git branch -d feature/my-new-feature
git push origin --delete feature/my-new-feature
```

## Common Issues and Solutions

### Accidental Changes on Main

If you've made changes while on the main branch:

```bash
# Option 1: Move changes to a new branch using stash
git stash save "description of changes"
git checkout -b feature/your-feature-name
git stash pop

# Option 2: Discard unwanted changes
git checkout -- .                  # Discard all changes
git checkout -- <filename>         # Discard specific file

# Option 3: If changes are committed to main
git branch feature/your-feature-name   # Create branch with changes
git reset --hard origin/main          # Reset main
git checkout feature/your-feature-name # Switch to new branch
```

### Sensitive File Management

If you accidentally commit sensitive files:

```bash
git rm --cached .env  # Remove from git without deleting local file
git commit -m "Remove sensitive file from git tracking"
```

### Best Practices

1. Never commit directly to main - all changes must go through feature branches
2. Keep feature branches focused and short-lived
3. Write clear, descriptive commit messages
4. Regularly sync with main to avoid large merge conflicts
5. Delete feature branches after they're merged

## Branch Naming Conventions

- Feature branches: `feature/descriptive-name`
- Hotfix branches: `hotfix/issue-description`

## Getting Help

For workflow issues or questions, contact the repository administrator or lead developer.