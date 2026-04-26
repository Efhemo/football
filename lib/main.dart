import 'package:flutter/material.dart';
import 'package:football/config/config.dart';
import 'package:football/config/theme.dart';
import 'package:football/data/hive/hive.dart';
import 'package:football/model/league.dart';
import 'package:football/model/news.dart';
import 'package:football/screens/news/news_details.dart';
import 'package:football/utils/storage_util.dart';
import 'package:football/viewmodel/provider.dart';
import 'package:hive/hive.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'screens/screen.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';
import 'injection_container.dart' as di;
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  await HiveSetup.init();

  Widget defaultHome = OnBoardingScreen();
  final hasBeenBoarded = await StorageUtil.getBoolean(StorageUtil.HAS_BOARDED);
  if (hasBeenBoarded) { defaultHome = HomeScreen(); }

  _setUpLogging();

  runApp(MyApp(launcher: defaultHome));
}

void _setUpLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print("${rec.level.name}: ${rec.time}");
  });
}

class MyApp extends StatelessWidget {
  final Widget launcher;

  const MyApp({Key? key, required this.launcher}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => di.injector<NewsProvider>()),
        ChangeNotifierProvider(create: (context) => di.injector<FootballProvider>())
      ],
      child: ThemeModeHandler(
        manager: AppTheme(),
        builder: (ThemeMode themeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Football',
            darkTheme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: Palette.backgroundColorDark,
              appBarTheme: Styles.appBarTheme,
              colorScheme: const ColorScheme.dark(secondary: Colors.blueAccent),
              cardColor: Palette.darkGrey,
              hoverColor: Palette.darkGrey,
              highlightColor: Colors.white54,
            ),
            theme: ThemeData.light().copyWith(
              primaryColor: Colors.blue,
              scaffoldBackgroundColor: Palette.backgroundColor,
              appBarTheme: Styles.appBarTheme,
              colorScheme: const ColorScheme.light(secondary: Colors.blueAccent),
              cardColor: Colors.white,
              hoverColor: Palette.lightWhite,
              highlightColor: Colors.black54,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: launcher,
            themeMode: ThemeMode.light,
            onGenerateRoute: (RouteSettings settings) {
              final routes = <String, WidgetBuilder>{
                '/footballDetails': (context) => FootballDetailsScreen(settings.arguments as League),
                '/newsDetails': (context) => NewsDetailsScreen(settings.arguments as News),
              };
              final builder = routes[settings.name];
              if (builder == null) return null;
              return MaterialPageRoute(builder: (ctx) => builder(ctx));
            },
            routes: {
              '/home': (context) => HomeScreen(),
              '/search': (context) => SearchScreen(),
              '/table': (context) => TableScreen(),
            },
          );
        },
      ),
    );
  }
}
