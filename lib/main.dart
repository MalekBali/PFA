import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pfa/authentification/login.page.dart';
import 'package:pfa/pages/home.page.dart';
import 'package:pfa/pages/scan.page.dart';
import 'package:pfa/pages/uploadPDF.page.dart';
import 'package:pfa/splash.dart';
import 'authentification/login.page.dart';
import 'authentification/signup.page.dart';
import 'firebase_options.dart';
import 'pages/home.page.dart';
import 'pages/scan.page.dart';
import 'pages/uploadPDF.page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routes = {
      '/login': (context) => LoginPage(),
      '/signup': (context) => SignupPage(),
      '/home': (context) => Homepage(),
      '/scan': (context) => ScanPage(),
      '/upload': (context) => UploadPage(),
    };

    return MaterialApp(
      routes: routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Color(0xFF2F3285),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFFAECB35),
          textTheme: ButtonTextTheme.primary,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFAECB35),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xFFAECB35)), // Background color
            foregroundColor: MaterialStateProperty.all(Colors.white), // Text color
          ),
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(color: Color(0xFF2F3285)),
          bodyLarge: TextStyle(color: Color(0xFF2F3285)),
          bodyMedium: TextStyle(color: Color(0xFF2F3285)),
        ),
        iconTheme: IconThemeData(
          color: Color(0xFF2F3285),
        ),
        colorScheme: ColorScheme.light(
          primary: Color(0xFF2F3285),
          secondary: Color(0xFFAECB35),
        ),
      ),
      home: Splash(),
    );
  }
}
