# CarAds app with Flutter and Firebase

Mobile app like a car market place

## Features
- **Simple onboarding page**
- **Full authentication flow** (using email & password)

## Folder Structure

lib/├── features/
    │    ├── feature1
    │        ├── data/
    │        │   ├── models/
    │        │   └── data sources/
    │        ├── domain/
    │        │   ├── provider/
    │        │   └── repositories/
    │        └── presentation/
    │            ├── screens/
    │            └── widgets/
    │
    ├── core/
        ├── localization/
        ├── router/
        ├── utils/
        └── theme/

- **Data Layer:** Handles data retrieval and storage.
- **Domain Layer:** Contains business logic and use cases.
- **Presentation Layer:** Manages UI and user interaction.

## Packages in use

These are the main packages used in the app:

- [Flutter Riverpod](https://pub.dev/packages/flutter_riverpod) for data caching, dependency injection, and more
