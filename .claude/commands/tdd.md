Perform Test-Driven Development (TDD) cycle: Red-Green-Refactor.

Usage:
/tdd [implementation description]

Example:
/tdd add user authentication feature
/tdd add validation to email input

Steps:
1. **Red Phase**: Write a failing test
   - Ask user what functionality to test if unclear
   - Create or update test file
   - Run tests to confirm it fails
   - Verify the test fails for the right reason

2. **Green Phase**: Write minimal code to pass the test
   - Implement the simplest solution that makes the test pass
   - Avoid over-engineering or adding extra features
   - Run tests to confirm they pass

3. **Refactor Phase**: Improve code while keeping tests green
   - Clean up code duplication
   - Improve naming and structure
   - Run tests after each refactor to ensure they still pass

4. **Iterate**: Repeat the cycle for the next piece of functionality

Guidelines:
- Write tests first, implementation second
- Keep each cycle small and focused
- Run tests frequently to get immediate feedback
- Commit after each successful Red-Green-Refactor cycle
- Each test should test one specific behavior
- Detect project language and test framework automatically
- Use appropriate test commands for the detected environment
