# Flutter Weather Forecast App

A simple Weather Forecast app built with Flutter that fetches weather data from a public API and displays it to the user. The app supports displaying the current weather condition, temperature, and a brief description of the weather for selected cities. It also provides a 5-day weather forecast for each city and allows users to add their favorite cities for quick access to weather data.

## Features

- Display current weather condition, temperature, and description for selected cities.
- View a 5-day weather forecast with daily weather conditions and temperatures.
- Toggle between different cities to see weather data.
- Add favorite cities to a list for quick access.
- Auto-suggest location search for city selection.
- Retrieve weather data based on the user's current location.
- User-friendly interface with icons and loading animations.

## Getting Started

### Prerequisites

- Flutter and Dart should be installed on your machine.
- Obtain an API key from a weather API provider (e.g., OpenWeatherMap).

### Installation

1. Clone the repository:

   ```sh
   git clone https://github.com/sjdpk/dailyforecast.git
   cd dailyforecast
   ```

### Setup
##### Create an environment file and update api key:
Add your API key as follows (as: `env example` folder):
    - eg, `./src/core/env example/dev_env.dart`
    `API_KEY=your-api-key`

#### Adding Packages
`flutter pub get`
#### Running the App
`flutter run`


### Bug Reports and Feature Requests

If you encounter a bug or have a feature request, please open an issue on the [Issue Tracker](https://github.com/sjdpk/dailyforecast/issues). Be sure to provide detailed information about the problem you encountered or the feature you'd like to see.


### Thank You!