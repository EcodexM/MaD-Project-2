import 'package:ffirebaseapp/Themes/Theme_provider.dart';
import 'package:ffirebaseapp/Models/restaurant.dart';
import 'package:ffirebaseapp/services/auth/auth_gate.dart';
import 'package:ffirebaseapp/services/auth/login_or_register.dart';
import 'package:ffirebaseapp/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      //theme provider
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),
      //Restaurant
      ChangeNotifierProvider(
        create: (context) => Restaurant(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign-in/Register',
      home: Authgate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
