# 🌤 Weather App

A Flutter weather app that fetches real-time weather data using the OpenWeatherMap API.

## Features
- Search weather by city name
- Displays temperature, feels like, humidity, wind speed
- Clean dark gradient UI
- Loading and error states handled gracefully

## Tech Stack
- **Flutter** & **Dart**
- **Provider** — state management
- **http** — REST API calls
- **OpenWeatherMap API** — weather data

## Getting Started

1. Clone the repo
2. Get a free API key at [openweathermap.org](https://openweathermap.org/api)
3. Replace `YOUR_OPENWEATHERMAP_API_KEY` in `lib/services/weather_service.dart`
4. Run `flutter pub get`
5. Run `flutter run`

## Project Structure
```
lib/
├── main.dart
├── models/
│   └── weather_model.dart
├── providers/
│   └── weather_provider.dart
├── screens/
│   └── home_screen.dart
├── services/
│   └── weather_service.dart
└── widgets/
    ├── weather_card.dart
    └── search_bar_widget.dart
```

## Screenshots
> Add screenshots here
