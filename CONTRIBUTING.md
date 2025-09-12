# Contributing to Flink-HBase Test Environment

Thank you for your interest in contributing to this project! This document provides guidelines for contributing to the Flink-HBase test environment.

## Getting Started

1. **Fork the repository** and clone your fork locally
2. **Set up the development environment** by following the README instructions
3. **Test the setup** by running `make build && make up`

## Development Workflow

### Prerequisites
- Docker (version 20.10 or later)
- Docker Compose (version 2.0 or later)
- Make

### Making Changes

1. **Create a feature branch** from `main`
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make your changes** following our coding standards:
   - Keep changes minimal and focused
   - Add comments where necessary
   - Update documentation if needed
   - Test your changes thoroughly

3. **Test your changes**:
   ```bash
   make clean
   make build
   make up
   make load-hbase-data
   ```

4. **Commit your changes** with clear, descriptive commit messages:
   ```bash
   git add .
   git commit -m "feat: add new feature description"
   ```

## Code Standards

### Docker
- Use specific version tags for base images when possible
- Add comments for complex RUN commands
- Minimize layers and image size
- Use environment variables for version management

### Documentation
- Update README.md for any user-facing changes
- Use clear, concise language
- Include code examples where helpful
- Keep documentation up to date

### Scripts
- Add error handling where appropriate
- Use meaningful variable names
- Include comments for complex logic

## Testing

Before submitting a pull request:

1. **Build test**: Ensure `make build` succeeds
2. **Integration test**: Verify `make up` starts all services
3. **Data loading test**: Confirm `make load-hbase-data` works
4. **Connectivity test**: Test Flink-HBase integration via SQL client

## Submitting Changes

1. **Push your branch** to your fork
2. **Create a pull request** with:
   - Clear title describing the change
   - Detailed description of what was changed and why
   - Steps to test the changes
   - Any breaking changes noted

3. **Respond to feedback** promptly and make requested changes

## Issues and Bug Reports

When reporting issues:

- Use the provided issue templates
- Include steps to reproduce
- Provide Docker and system version information
- Include relevant logs and error messages

## Questions

If you have questions about contributing, feel free to:
- Open an issue for discussion
- Check existing issues for similar questions

Thank you for contributing! 🎉