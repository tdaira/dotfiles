Create a new branch from the current git diff and open a pull request.

Steps:
1. Check changes with `git status` and `git diff`
2. Analyze changes and determine an appropriate branch name
   - feat/feature-name: New feature
   - fix/fix-description: Bug fix
   - refactor/target: Refactoring
3. Create a new branch: `git checkout -b <branch-name>`
4. Stage all changes: `git add -A`
5. Create a commit in Conventional Commits format (in English)
6. Push to remote: `git push -u origin <branch-name>`
7. Create PR: `gh pr create --base develop --title "..." --body "..."`

PR title and body must be written in Japanese.
Display the PR URL when complete.
