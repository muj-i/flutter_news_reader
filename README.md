# News Reader

## Description 

A simple News app that allows you to browse and read the latest news articles. This app leverages the [News API](https://newsapi.org) for fetching news data, [Riverpod](https://riverpod.dev/) for state management, and [Hive](https://docs.hivedb.dev/#/) for local database storage.

Wanna use the application? [Download it here](https://github.com/muj-i/flutter_news_reader/releases/download/v1.1/News.Reader.apk)

## Responsibilities

- Read breaking news and all news from a variety of sources
- Save news for offline reading
- Simple and user-friendly interface

## Design Decisions:

<!-- - **Bottom Navigation:** The app utilizes a bottom navigation bar with two tabs - "Home" and "Offline." It allows users to switch between online and offline content easily. -->

- **AppBar TabBar:** The AppBar with a TabBar that contains two tabs - "Breaking News" and "All News." This design decision was made to provide users with quick access to both categories of news articles.

- **Connectivity Check:** The app checks for internet connectivity using the connectivity_plus package. If the user is online, they can access the "Breaking News" and "All News" tabs. If offline, they can access the "Offline" screen & they can access the cached "Breaking News" and "All News".

## Challenges Faced:

- **Efficient API Calls with State Management:** One of the primary challenges was to manage API calls efficiently while maintaining a responsive and smooth user experience. To address this challenge, Riverpod, a state management library, was used to handle the state of the app's data. It ensured that API calls were made only when necessary, reducing unnecessary network requests and improving app performance.

- **Data Caching with Hive:** Caching data to local storage is essential for providing an offline experience and reducing network usage. Implementing data caching with Hive posed its own set of challenges, such as ensuring data consistency and handling updates. Hive is a lightweight and efficient NoSQL database, but managing data updates and syncing them with remote data can be complex.

## How Challenges Were Overcome:

- **Efficient API Calls with Riverpod:** Riverpod provided a structured and efficient way to manage app state and data. By creating providers for data sources and using `flutter_riverpod`, API calls were made only when the data was needed or when the user explicitly requested it. This approach reduced the number of unnecessary API calls and improved the app's responsiveness.

- **Data Caching with Hive:** To overcome the challenges of data caching with `hive_flutter`, a robust caching strategy was implemented. When new data was fetched from the API, it was stored in the Hive box. To ensure data consistency, updates were synchronized with the remote data source. When the app was offline, it retrieved data from the local Hive storage, providing users with access to cached content and minimizing network usage.


## News Reader UI
### Video demonstration of News Reader

[![Video](https://img.youtube.com/vi/RU99I7mKFFU/hqdefault.jpg)](https://www.youtube.com/watch?v=RU99I7mKFFU)



### Online Screen
<div style="display: flex; flex-wrap: wrap;">
    <img src="https://github.com/muj-i/flutter_news_reader/blob/main/screenshots/ss1.png" width="250" />
    <img src="https://github.com/muj-i/flutter_news_reader/blob/main/screenshots/ss2.png" width="250" />
    <img src="https://github.com/muj-i/flutter_news_reader/blob/main/screenshots/ss3.png" width="250" />
    <img src="https://github.com/muj-i/flutter_news_reader/blob/main/screenshots/ss4.png" width="250" />
</div>

### Offline Screen
<div style="display: flex; flex-wrap: wrap;">
    <img src="https://github.com/muj-i/flutter_news_reader/blob/main/screenshots/ss5.png" width="250" />
    <img src="https://github.com/muj-i/flutter_news_reader/blob/main/screenshots/ss6.png" width="250" />
    <img src="https://github.com/muj-i/flutter_news_reader/blob/main/screenshots/ss7.png" width="250" />
    <img src="https://github.com/muj-i/flutter_news_reader/blob/main/screenshots/ss8.png" width="250" />
</div>

## Getting Started

### Prerequisites

Ensure Flutter is installed on your machine. For installation instructions, refer to the official [Flutter website](https://flutter.dev/docs/get-started/install).

### Installation

Follow these steps to run the News Reader Application:

1. Clone this repository to your local machine:

```bash
git clone https://github.com/muj-i/flutter_news_reader.git
```

2. Navigate to the project folder:

```bash
cd flutter_news_reader
```

3. Install dependencies:

```bash
flutter pub get
```

### How to Run

Connect your device or emulator and run the app using the following command:

```bash
flutter run --release
```
## Used Packages

News Reader integrates the following packages to enhance functionality:
- `http: ^1.1.0:` Allows you to perform HTTP requests and interact with APIs.
- `shimmer: ^3.0.0:` Provides a shimmer effect for your UI to indicate loading or progress.
- `font_awesome_flutter: ^10.5.0:` Gives you access to a wide range of Font Awesome icons for stylish visuals in your app.
- `flutter_launcher_icons:` ^0.13.1: Simplifies the generation of launcher icons on various platforms, making it easier to customize your app's icons.
- `flutter_riverpod: ^2.4.1:` A Flutter state management library that is easy to use and provides a robust solution for managing your app's state.
- `connectivity_plus: ^4.0.2:` Helps you monitor and access network connectivity information in your Flutter app.
- `cached_network_image: ^3.3.0:` Cached Network Image is a Flutter package that enables efficient caching of network images, improving performance by reducing unnecessary network requests and speeding up image loading.
- `url_launcher: ^6.1.10:` Flutter package for launching external web URLs, emails, phone calls, and other deep links from your app.
- `hive: ^2.2.3:` A lightweight, fast, and efficient NoSQL database for Flutter.
- `hive_flutter: ^1.1.0`: Integrates Hive with Flutter, allowing you to use Hive seamlessly in your Flutter app.
- `hive_generator:` ^2.0.1: A code generator for Hive, making it easier to work with Hive in your Flutter project.
- `build_runner:` ^2.4.6: A tool that helps you generate code, including serialization and more, in your Flutter app during the build process.
  
## Project Directory Structure

The News Reader directory structure is organized as follows:

```
  flutter_news_reader/
  ├─ assets/
  │  ├─ logo/
  │  │  ├─ logo.png
  ├──lib/
  │   ├── data/
  │   │   ├── models/
  │   │   │   └── news_article_model.dart
  │   │   ├── services/
  │   │   │   └── api_service.dart
  │   │   └── utils/
  │   │       ├── allnews_local_data_storage.dart
  │   │       ├── breakingnews_local_data_storage.dart
  │   │       ├── hive_data_adapter.dart
  │   │       └── utls.dart
  │   ├── state_holder/
  │   │   └── data_provider.dart
  │   ├── view/
  │   │   ├── screens/
  │   │   │   ├── offline_screens/
  │   │   │   │   ├── offline_allnews_screen.dart
  │   │   │   │   ├── offline_appbar_tabbar_screen.dart
  │   │   │   │   └── offline_breakingnews_screen.dart
  │   │   │   ├── online_screens/
  │   │   │   │   ├── allnews_screen.dart
  │   │   │   │   ├── appbar_tabbar_screen.dart
  │   │   │   │   └── breakingnews_screen.dart
  │   │   │   ├── conectivity_checker_screen.dart
  │   │   │   ├── news_details_screen.dart
  │   │   │   └── splash_screen.dart
  │   │   ├── utils/
  │   │   │   └── place_holder.dart
  │   │   └── widgets/
  │   │       ├── icon_with_collapsing_text.dart
  │   │       ├── news_list_tile.dart
  │   │       └── shimmer_list_item.dart
  │   ├── app.dart
  └── └── main.dart
```

## Contributors

- [Mujahedul Islam](https://github.com/muj-i)

## Special Thanks

A heartfelt thanks to [Moniruzzaman](https://github.com/moniruzzaman76) & [Md Alhaz Mondal Hredhay](https://github.com/hredhayxz) to share their knowledges with me & help me complete the project.

## License

This project is licensed under the MIT License. Refer to the [LICENSE](https://opensource.org/license/mit/) file for details.
