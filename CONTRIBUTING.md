# Contributing to Bash Setups

Thank you for your interest in contributing! This document provides guidelines for contributing to this project.

## How to Contribute

### Reporting Issues

- Check if the issue already exists
- Provide detailed information about your environment (OS, shell version, etc.)
- Include steps to reproduce the issue
- Share relevant error messages or screenshots

### Suggesting Enhancements

- Open an issue describing your enhancement idea
- Explain the use case and benefits
- If possible, provide examples of how it would work

### Submitting Changes

1. **Fork the repository**

   ```bash
   # Fork on GitHub, then clone your fork
   git clone https://github.com/YOUR-USERNAME/bash-setups.git
   cd bash-setups
   ```

2. **Create a feature branch**

   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make your changes**

   - Test your changes thoroughly
   - Follow the existing code style
   - Add comments for complex logic
   - Update README.md if adding new features

4. **Test the profile**

   ```bash
   # Backup your current profile
   ./backup.sh

   # Install and test
   ./install.sh

   # Test all new functions/aliases
   ```

5. **Commit your changes**

   ```bash
   git add .
   git commit -m "Add feature: description of your changes"
   ```

6. **Push and create a pull request**
   ```bash
   git push origin feature/your-feature-name
   ```
   Then create a pull request on GitHub.

## Code Style Guidelines

### Shell Script Conventions

- Use `[[ ]]` for conditionals instead of `[ ]`
- Quote variables: `"$variable"` not `$variable`
- Use meaningful function and variable names
- Add comments for non-obvious code
- Use `#!/bin/bash` shebang for scripts

### Function Guidelines

```bash
# Good function example
my_function() {
  if [[ -z "$1" ]]; then
    printf "${RED}Error:${WHITE} Please provide an argument\n"
    return 1
  fi

  local my_var="$1"
  # Do something with my_var
  printf "${GREEN}Success:${WHITE} Did something\n"
}
```

### Color Usage

- Use defined color variables: `${GREEN}`, `${RED}`, etc.
- Always reset with `${WHITE}` at the end of colored text
- Use colors consistently:
  - `GREEN` for success messages
  - `RED` for errors
  - `YELLOW` for warnings or important values
  - `CYAN` for informational text
  - `PURPLE` for section headers

### Alias Guidelines

- Keep aliases short and memorable
- Document what they do
- Group related aliases together
- Avoid overriding common system commands without good reason

## Adding New File Icons

To add icons for new file types in `ls_fancy`:

```bash
else if (name ~ /\.yourext$/) {
  $NF = "🎯 " raw
}
```

Place new patterns in logical order (more specific patterns first).

## Testing Checklist

Before submitting a PR, verify:

- [ ] All existing functions still work
- [ ] New features are documented in README.md
- [ ] Colors display correctly
- [ ] Icons display correctly (if applicable)
- [ ] No bash errors on profile load
- [ ] Works in Git Bash on Windows
- [ ] History and shell options work as expected
- [ ] Install script works correctly
- [ ] Backup script works correctly

## Documentation

When adding new features, update:

1. **README.md** - Add to appropriate section
2. **list_commands()** function - Add to help output
3. **Code comments** - Explain complex logic

## Questions?

Feel free to open an issue for questions or discussions about contributing!

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
