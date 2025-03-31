# One Cask

## Description
One Cask is a Flutter application designed for whisky enthusiasts. It provides an intuitive interface to explore whisky collections, scan bottles, and manage personal whisky collections. The app features a sleek design with custom icons, animations, and a splash screen for a refined user experience.

## Features
- User authentication (Sign In screen)
- Whisky collection browsing and management
- SVG-based custom icons
- Smooth animations using `flutter_animate`
- Network connectivity detection
- Custom splash screen and launcher icons

## Tech Stack
- **Framework:** Flutter
- **State Management:** BLoC (`flutter_bloc`)
- **Networking & Connectivity:** `connectivity_plus`
- **UI Enhancements:** `flutter_animate`, `flutter_svg`
- **Build Tools:** `build_runner`

## Dependencies Overview

### 1. **Flutter & Core Dependencies**
- `flutter`: The core Flutter SDK.
- `flutter_test`: Used for writing unit and widget tests.
- `flutter_lints`: Provides linting rules to ensure clean and efficient code.

### 2. **State Management**
- `flutter_bloc`: A predictable state management library based on the BLoC pattern. It helps manage the application’s state efficiently.

### 3. **UI Enhancements**
- `flutter_animate`: Provides smooth and flexible animations for UI elements.
- `flutter_svg`: Enables the use of SVG images in the app for scalable and high-quality vector graphics.

### 4. **Splash Screen & Icons**
- `flutter_native_splash`: Used to create a custom splash screen with a background color and logo.
- `flutter_launcher_icons`: Customizes the app's launcher icon for both Android and iOS platforms.

### 5. **Network Connectivity**
- `connectivity_plus`: Detects network connectivity status and handles offline scenarios.

### 6. **Build & Development Tools**
- `build_runner`: A tool to generate code for Flutter projects, often used with `flutter_bloc` and other libraries that require code generation.

## Setup Instructions

1. **Clone the Repository:**
   ```sh
   git clone https://github.com/your-repository/one_cask.git
   cd one_cask
   ```

2. **Install Dependencies:**
   ```sh
   flutter pub get
   ```

3. **Run the App:**
   ```sh
   flutter run
   ```

4. **Generate Icons and Splash Screen (Optional):**
   ```sh
   flutter pub run flutter_launcher_icons:main
   flutter pub run flutter_native_splash:create
   ```

## Assets
The app includes various assets like images and fonts:
- **Images:** `assets/splash_bg.png`, `assets/ic_logo.png`, etc.
- **SVG Icons:** `assets/ic_bottle.svg`, `assets/ic_collection.svg`, etc.
- **Fonts:** `EB Garamond`, `Lato`

## Contribution Guidelines
If you’d like to contribute:
1. Fork the repository.
2. Create a feature branch (`git checkout -b feature-name`).
3. Commit your changes (`git commit -m 'Add new feature'`).
4. Push to your branch (`git push origin feature-name`).
5. Open a pull request.

## License
This project is licensed under the MIT License. Feel free to use and modify it as needed.

---
Developed with ❤️ using Flutter.

