Merge the current branch's PR and switch local to the develop branch.

Steps:
1. Check current branch: `git branch --show-current`
2. View the PR for current branch: `gh pr view`
3. Verify all CI checks pass: `gh pr checks`
4. Merge the PR: `gh pr merge --squash --delete-branch`
5. Switch to develop: `git checkout develop`
6. Pull remote changes: `git pull origin develop`
7. Verify merge completed: `git log --oneline -3`

Notes:
- Do not merge if CI is failing
- If review is required, inform the user
- The local branch will be deleted after merge
