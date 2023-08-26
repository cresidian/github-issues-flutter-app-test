# Flutter GitHub Issues Viewer

This Flutter project fetches and displays GitHub issues from the Flutter repository using the GitHub Issues public API. The app is built with a focus on clean architecture and utilizes the BloC pattern for state management. Network requests are made using Retrofit and Dio.

## Features

- View a list of GitHub issues from the Flutter repository.
- Display detailed information about each issue, including title, description, labels, and status.
- Navigate through the list of issues and view details.
- Pull to refresh the issue list for the latest data.

## Screenshots

*(You can add screenshots of your app here)*

## Getting Started

To get started with this project, follow these steps:

1. **Clone the repository:**

   ```
   git clone https://github.com/your-username/flutter-github-issues.git
   cd flutter-github-issues
   ```

2. **Install dependencies:**

   Run the following command to install all the required dependencies:

   ```
   flutter pub get
   ```

3. **Run the app:**

   Connect your device or start an emulator, then run:

   ```
   flutter run
   ```

## Architecture

The project adheres to Clean Architecture principles, keeping a clear separation between different layers: presentation, domain, and data. The BloC pattern is employed for state management, ensuring a decoupled UI and business logic.

- **Presentation Layer:** Comprises UI components such as widgets and screens. This layer communicates with BloCs to retrieve and display data.

- **Domain Layer:** Houses the application's business logic, including entities, use cases, and interfaces for repositories and interactors. It remains independent of the presentation and data layers.

- **Data Layer:** Handles interaction with external sources, such as APIs or databases. The GitHub Issues API is accessed through Retrofit and Dio in this project. Repositories in this layer implement the interfaces defined in the domain layer.

## Libraries Used

- [Bloc](https://pub.dev/packages/flutter_bloc): A state management library for Flutter applications.
- [Retrofit](https://pub.dev/packages/retrofit): A type-safe HTTP client for Dart that uses Retrofit annotations.
- [Dio](https://pub.dev/packages/dio): A powerful HTTP client for Dart that supports interceptors, FormData, and more.

## Contributions

Contributions to this project are welcome! If you encounter issues or have suggestions for enhancements, feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
