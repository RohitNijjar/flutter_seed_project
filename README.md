# Flutter Clean Architecture Seed 🚀

A scalable Flutter starter template using **Riverpod** and **Clean Architecture**. Built for developers who value maintainability, testability, and separation of concerns. Batteries included for state management, routing, networking, and local storage.

---

## 🚀 Quick Start

1.  **Clone the repository:**

    ```bash
    git clone <repository_url>
    ```

2.  **Navigate to the project directory:**

    ```bash
    cd <project_name>
    ```

3.  **Install dependencies:**

    ```bash
    flutter pub get
    ```

4.  **Run the code generator:**

    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

5.  **Run the app:**

    ```bash
    flutter run
    ```

## Why Riverpod + Clean Architecture?

- **Riverpod:**

  - **Improved Developer Experience:** Simplifies state management with less boilerplate compared to other solutions like Provider or BLoC.
  - **Compile-Time Safety:** Catches errors during development, reducing runtime issues.
  - **Flexibility:** Supports various types of providers for different state management needs (simple values, asynchronous operations, etc.).
  - **Performance:** Optimized to rebuild only necessary widgets, improving efficiency.
  - **Testability:** Makes it easy to test your logic by overriding providers in tests.
  - **Auto-dispose feature:** Helps in preventing memory leaks and also improves performance.

- **Clean Architecture:**
  - **Separation of Concerns:** Divides the application into distinct layers with specific responsibilities (UI, business logic, data access).
  - **Maintainability:** Makes the codebase easier to understand, modify, and maintain over time.
  - **Testability:** Each layer can be tested independently, leading to more robust code.
  - **Scalability:** Facilitates adding new features without disrupting existing code.
  - **Technology Agnostic:** The core business logic is independent of external frameworks, allowing for easier adaptation to changes.

**Layer Communication:**

- **Presentation Layer:** Depends on the Domain Layer. It interacts with `StateNotifierProviders` (or other state management solutions) which in turn call use cases from the Domain Layer.
- **Domain Layer:** Independent of other layers. It defines the core business logic and rules using entities, repositories (interfaces), and use cases.
- **Data Layer:** Depends on the Domain Layer. It implements the repository interfaces defined in the Domain Layer and handles data from various sources (remote APIs, local databases, etc.).

**Example (Counter Feature):**

1.  **Presentation (CounterScreen):** A button triggers an event.
2.  **Provider (CounterNotifier):** `increment()` method of `CounterNotifier` is called.
3.  **Usecase (IncrementCounter):** `CounterNotifier` calls the `IncrementCounter` use case.
4.  **Repository (CounterRepository - Interface):** `IncrementCounter` calls the `incrementCounter()` method of the `CounterRepository` interface.
5.  **Repository Implementation (CounterRepositoryImpl):** This class implements the actual logic to update the counter (e.g., saving to SharedPreferences).
6.  **Data Source (CounterLocalDataSource):** `CounterRepositoryImpl` interacts with the `CounterLocalDataSource` to persist data.
7.  **Provider (CounterNotifier):** After data update, `CounterNotifier` updates its state using `StateNotifierProvider`.
8.  **Presentation (CounterScreen):** `CounterScreen` rebuilds, reflecting the updated counter value, thanks to `ref.watch`.

## Best Flutter/Dart Practices

**Naming Conventions:**

- **Variables:** `camelCase` (e.g., `userName`, `productCount`)
- **Classes:** `PascalCase` (e.g., `ProductDetails`, `ShoppingCartService`)
- **Interfaces:** `PascalCase` with "I" prefix or "Abstract" suffix (e.g., `ICounterRepository`, `CounterRepositoryAbstract`)
- **Private members:** Start with an underscore `_` (e.g., `_apiClient`, `_counterValue`)
- **Constants:** `k` followed by `PascalCase` or `UPPER_SNAKE_CASE` (e.g. `kApiBaseUrl`, `DATABASE_VERSION`)
- **Enums:** `PascalCase` (e.g., `OrderStatus`, `PaymentMethod`)
- **Methods/Functions:** `camelCase` (e.g., `getProductDetails()`, `calculateTotalPrice()`)
- **Files:** `snake_case.dart` (e.g., `product_details_screen.dart`, `shopping_cart_service.dart`)

**File Naming (Screens and Widgets):**

- **Screens:** `[feature_name]_screen.dart` (e.g., `product_list_screen.dart`, `settings_screen.dart`)
- **Widgets:** `[widget_name].dart` or `[feature_name]_[widget_name].dart` (e.g., `primary_button.dart`, `product_list_item.dart`)

**Other Important Practices:**

- **Use `const` constructors whenever possible for improved performance.**
- **Prefer composition over inheritance.**
- **Keep functions and methods short and focused on a single responsibility.**
- **Handle errors gracefully using `try-catch` blocks and appropriate error handling mechanisms.**
- **Use a linter to enforce consistent code style.**
- **Write unit, widget, and integration tests to ensure code quality and prevent regressions.**

## Packages Used

- **State management:**
  - `flutter_riverpod`: Simplifies dependency injection, improves performance, and offers better testing capabilities compared to `provider`.
    - Alternatives: `provider`, `bloc/cubit`, `getx`
- **Dependency injection:**
  - `get_it`: Manages and provides access to service objects throughout the application.
    - Alternatives: `kiwi`
  - `injectable`: Automates and simplifies the setup of dependency injection for `get_it`.
    - Alternatives: Manual DI setup
- **HTTP client:**
  - `dio`: Feature-rich and easy to use; supports interceptors, FormData, and request cancellation.
    - Alternatives: `http`
- **JSON serialization:**
  - `json_annotation`: Facilitates code generation for converting Dart objects to/from JSON.
    - Alternatives: Manual JSON handling, `built_value`
- **Local storage:**
  - `shared_preferences`: Stores simple key-value data persistently on the device.
    - Alternatives: `hive`, `sqflite`, `sembast`
- **Navigation:**
  - `go_router`: A declarative routing package that simplifies navigation and deep linking.
    - Alternatives: `auto_route`, `beamer`
- **Secure storage:**
  - `flutter_secure_storage`: Encrypts and securely stores sensitive data like API tokens.
    - Alternatives: `encrypted_shared_preferences`
- **Image caching:**
  - `cached_network_image`: Downloads, caches, and displays images from the network efficiently.
    - Alternatives: `flutter_advanced_networkimage`
- **Image selection:**
  - `image_picker`: Allows users to pick images from the gallery or take photos with the camera.
    - Alternatives: `file_picker`
- **Functional programming:**
  - `dartz`: Provides useful constructs like `Either` for handling errors in a functional way.
    - Alternatives: N/A (can implement similar logic manually)
- **Value equality:**
  - `equatable`: Helps in comparing objects based on their values instead of their references.
    - Alternatives: Manual `==` and `hashCode` overrides
- **Code generation:**
  - `build_runner`: A build system for Dart that runs code generators.
    - Alternatives: N/A
  - `json_serializable`: Works with `json_annotation` to automatically generate JSON serialization code.
    - Alternatives: N/A
  - `freezed`: Creates immutable data classes with useful methods (like `copyWith`) and supports unions.
    - Alternatives: `built_value`

## Common Flutter/Dart Commands

- `flutter create <project_name>`: Creates a new Flutter project.
- `flutter run`: Runs the app on a connected device or emulator/simulator.
- `flutter build apk`: Builds an Android APK release.
- `flutter build ios`: Builds an iOS release (requires macOS and Xcode).
- `flutter doctor`: Checks your Flutter development environment and shows the status of installed tools.
- `flutter pub get`: Fetches the dependencies listed in `pubspec.yaml`.
- `flutter pub upgrade`: Updates the dependencies to their latest versions.
- `flutter clean`: Deletes the `build/` directory (useful when facing build issues).
- `dart format .`: Formats all Dart code in the project.
- `dart analyze`: Analyzes the Dart code for errors and warnings based on the enabled lints.
- `flutter test`: Runs tests.
- `flutter build web`: Builds the web version of your app (if you've enabled web support).
- `flutter packages pub run build_runner watch`: Watch the files' system for edits and rebuild as necessary,
- `flutter pub run build_runner build --delete-conflicting-outputs`: Run code generation for `json_serializable`, `freezed`.
