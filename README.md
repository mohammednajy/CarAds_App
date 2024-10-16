# CarAds app with Flutter and Firebase

Mobile app like a car market place

## Features
- **Dark and light theme**
- **Arabic and English Language**
- **Simple onboarding page**
- **Full authentication flow** (using email & password)

## Folder Structure
```
lib
│   ├── core
│   │   ├── localization
│   │   ├── router
│   │   ├── theme
│   │   └── utils
│   ├── features
│   │   ├── auth
│   │   │   ├── data
│   │   │   │   ├── dats_source
│   │   │   │   └── models
│   │   │   ├── domain
│   │   │   │   ├── providers
│   │   │   │   └── repository
│   │   │   └── presentation
│   │   │       ├── screens
│   │   │       └── widgets
│   │   └── home
│   └── main.dart
```

- **Data Layer:** Handles data retrieval and storage.
- **Domain Layer:** Contains business logic and use cases.
- **Presentation Layer:** Manages UI and user interaction.

## Packages in use

These are the main packages used in the app:

- [Flutter Riverpod](https://pub.dev/packages/flutter_riverpod) for data caching, dependency injection, and more
- [easy localization](https://pub.dev/packages/easy_localization) for internationalizing and localization. 

## App Instructions

### localization instructions:
If you add new text to json folder run these command two command:
- This is for update codegen_loader.g.dart
```
flutter pub run easy_localization:generate -S "assets/translations/" -O "lib/core/localization"
```
- This is for update locale.keys.g.dart
```
flutter pub run easy_localization:generate -S "assets/translations/" -O "lib/core/localization" -o "locale_keys.g.dart" -f keys
```