Delete local branches that no longer exist on the remote repository.

Usage:
/clean-branches

Steps:
1. Update remote tracking information: `git fetch --prune`
2. Identify local branches that track deleted remote branches
3. Show the list of branches to be deleted
4. Ask user for confirmation before deletion
5. Delete confirmed branches: `git branch -d <branch>` or `git branch -D <branch>` if needed
6. Display summary of deleted branches

Safety:
- Never delete the current branch
- Never delete main/master/develop branches
- Always show the list before deletion
- Ask for user confirmation before proceeding
- Use `-d` flag first (safe delete), only use `-D` if necessary and confirmed

Notes:
- This command is useful after PRs have been merged and remote branches deleted
- Keeps your local repository clean and organized
- Does not affect remote repository
