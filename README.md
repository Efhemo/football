# Football

Football is an attempt to build a full featured flutter app that shows favourite league tables, teams, standings, live scores and generally sport news.
The focus of this project is to use different widgets available on flutter and especially on demonstrating how to structure your code, design your architecture,
and the eventual impact of adopting these patterns on testing and maintaining your app.

## Getting Started

Clone the repository. The app make use of [football-data](https://www.football-data.org/) and [New](https://newsapi.org/) API. click the link to get your api key if you dont have.
- Create a file at the root of your project call it `secrets.json`
- Copy and paste below json into the file.

```
{
  "news_api_key": "your-news-api-key",
  "football_api_key": "your-football_api_key"
}
```

## UI
UI inspired by [here](https://www.uplabs.com/posts/profile-light-mode-and-dark-mode) and [here](https://www.uplabs.com/posts/sport-news-app-564029c3-8787-4417-87b8-9047a58b29b4)

![alt text](https://github.com/Efhemo/football/tree/feature/games/screenshots)

## Libraries

- [Retrofit For Dart](https://pub.dev/packages/retrofit) for easy CRUD request
- [dio](https://github.com/flutterchina/dio/) A powerful Http client for Dart, which supports Interceptors, Global configuration, FormData, Request Cancellation, File downloading, Timeout etc.
- [get it](https://pub.dev/packages/get_it) Service Locator for Dart and Flutter projects
- [dartz](https://pub.dev/packages/dartz) Functional programming in Dart
- [hive](https://docs.hivedb.dev/#/README) Super fast database written in pure Dart

## Todo

The app in this project aims to be simple enough that you can understand it quickly, but complex enough to showcase difficult design decisions and testing scenarios.

There are some improvement i intend to make
- Using BLOC for better state management
- Building setting screen
- Integrate firebase (chat, room or group) for user interaction on the app
- Animations
- Test
