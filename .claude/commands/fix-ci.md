Check GitHub Actions errors and fix them.

Steps:
1. Check recent CI runs: `gh run list --limit 5`
2. If there are failures, check error logs: `gh run view <run-id> --log-failed`
3. Analyze the error and identify the root cause
4. Make necessary fixes
5. Commit and push the fixes
6. Repeat until CI passes

Common errors:
- TypeScript type errors: Pre-check with `npm run typecheck`
- Test failures: Pre-check with `npm test`
- Lint errors: Pre-check with `npm run lint`

Always run `npm run typecheck && npm test` locally before pushing.
