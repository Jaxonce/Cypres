# Project Naming Conventions

In this Swift project, we follow a set of naming conventions to maintain consistency and readability throughout the codebase. Adhering to these conventions will make it easier for developers to understand and collaborate on the project.

_(N.B. The code variables, functions name, etc... are named in English, but the views are displayed in French. They will be translated into different languages in the future.)_

## Folder and File Naming

### 1. Folders

- **Use PascalCase**: Folder names should use PascalCase, where each word is capitalized, and no spaces are allowed. For example: `ViewController`, `Models`, `Utilities`.

### 2. Files

- **Use PascalCase**: File names should also use PascalCase, reflecting the primary class or functionality contained within the file. For example: `LoginViewController.swift`, `UserProfileModel.swift`.

- **Avoid Special Characters**: Do not use special characters, spaces, or emojis in file names.

## Class Naming

- **Use PascalCase**: Class names should use PascalCase, starting with an uppercase letter, and capitalize the first letter of each word without spaces. For example: `UserManager`, `NetworkService`.

- **Descriptive and Meaningful**: Class names should be descriptive and convey their purpose clearly.

## Variable Naming

- **Use camelCase**: Variable names should use camelCase, starting with a lowercase letter, and capitalize the first letter of each subsequent word. For example: `userName`, `isLoggedIn`, `selectedItems`.

- **Descriptive**: Variable names should be meaningful and reflect the data they hold or the purpose they serve.

- **Avoid Abbreviations**: Avoid excessive abbreviations in variable names. Use full words to make the code more readable. For example, prefer `numberOfItems` over `numItems`.

## Constant Naming

- **Use UPPERCASE_SNAKE_CASE**: Constants should use uppercase letters and separate words with underscores. For example: `API_KEY`, `MAX_RETRY_COUNT`.

## Enum Naming

- **Use PascalCase**: Enum names should use PascalCase, similar to class names. For example: `Direction`, `ColorTheme`.

- **Enum Case Naming**: Enum cases should also use camelCase, starting with a lowercase letter. For example: `.north`, `.redTheme`.

## Function and Method Naming

- **Use camelCase**: Function and method names should use camelCase, similar to variable names. For example: `calculateTotalPrice()`, `fetchUserData()`.

- **Descriptive Names**: Use descriptive names that indicate the function's purpose or action.

## Comments and Documentation

- **Use inline comments**: Add inline comments to explain complex or non-obvious code sections.

- **Document Public APIs**: Document public classes, functions, and methods with appropriate comments, including parameters, return values, and usage examples.

By following these naming conventions, we aim to create a consistent and maintainable Swift project that is easy to understand and collaborate on.
