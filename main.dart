import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:xyz/pages/analyze/analyze_page.dart';
import 'package:xyz/pages/edit/zuser.dart';
// import 'package:xyz/pages/greet/greet_page.dart';
// import 'package:xyz/pages/home/home_page.dart';
// import 'package:xyz/pages/login/login_page.dart';
// import 'package:xyz/pages/settings/settings_page.dart';
// import 'package:xyz/pages/signup/signup_page.dart';
import 'package:xyz/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onga Activity Manager',
      // home: Constants.prefs.getBool("isLoggedIn") == true
      //     ? HomePage()
      //     : LoginPage(),
      home: UserPage(title: "Onga Activity Manager"),
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // routes: {
      //   AnalyzePage.routeName: (context) => AnalyzePage(),
      //   SettingsPage.routeName: (context) => SettingsPage(),
      //   GreetPage.routeName: (context) => GreetPage(),
      //   LoginPage.routeName: (context) => LoginPage(),
      //   // UserPage.routeName: (context) => UserPage(),
      //   SignupPage.routeName: (context) => SignupPage(),
      //   HomePage.routeName: (context) => HomePage(),
      // },
    );
  }
}
