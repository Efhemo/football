import 'package:flutter/material.dart';
import 'package:football/config/config.dart';
import 'package:football/config/theme.dart';
import 'package:football/utils/storage_util.dart';
import 'screens/screen.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';

void main() async {
//  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//      systemNavigationBarColor: Colors.blue,
//      statusBarColor: Colors.white
//  ));
  WidgetsFlutterBinding.ensureInitialized();

  // Set default home.
  Widget _defaultHome = new OnBoardingScreen();
  final hasBeenBoarded = await StorageUtil.getBoolean(StorageUtil.HAS_BOARDED);
  if(hasBeenBoarded){_defaultHome = HomeScreen();}

  runApp(MyApp(launcher: _defaultHome));
}

class MyApp extends StatelessWidget {
  final Widget launcher;

  const MyApp({Key key, this.launcher}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeModeHandler(
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
            highlightColor: Colors.black45,
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
    );
  }
}
