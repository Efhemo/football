import 'package:flutter/material.dart';
import 'package:football/config/config.dart';
import 'package:football/config/theme.dart';
import 'package:football/data/hive/hive.dart';
import 'package:football/utils/storage_util.dart';
import 'package:football/viewmodel/provider.dart';
import 'package:hive/hive.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'domain/model/articles_local.dart';
import 'screens/screen.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';
import 'injection_container.dart' as di;
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
//  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//      systemNavigationBarColor: Colors.blue,
//      statusBarColor: Colors.white
//  ));
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  //hive
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(ArticleLocalAdapter(), 0);
  await Hive.openBox<ArticleLocal>(HiveSetup.Article);

  // Set default home.
  Widget _defaultHome = new OnBoardingScreen();
  final hasBeenBoarded = await StorageUtil.getBoolean(StorageUtil.HAS_BOARDED);
  if(hasBeenBoarded){_defaultHome = HomeScreen();}

  _setUpLogging();

  runApp(MyApp(launcher: _defaultHome));
}

void _setUpLogging(){
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print("${rec.level.name}: ${rec.time}");
  });
}

class MyApp extends StatelessWidget {
  final Widget launcher;

  const MyApp({Key key, this.launcher}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => di.injector<NewsProvider>())
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
              accentColor: Colors.blueAccent,
              cardColor: Palette.darkGrey,
              hoverColor: Palette.darkGrey,
              highlightColor: Colors.white54,
            ),
            theme: ThemeData.light().copyWith(
              primaryColor: Colors.blue,
              scaffoldBackgroundColor: Palette.backgroundColor,
              appBarTheme: Styles.appBarTheme,
              accentColor: Colors.blueAccent,
              cardColor: Colors.white,
              hoverColor: Palette.lightWhite,
              highlightColor: Colors.black54,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: launcher,
            themeMode: themeMode,
            routes: {
              '/home': (context) => HomeScreen(),
              '/search': (context) => SearchScreen(),
              '/footballDetails': (context) => FootballDetailsScreen(),
              '/table': (context) => TableScreen(),
            },
          );
        },
      ),
    );
  }
}
