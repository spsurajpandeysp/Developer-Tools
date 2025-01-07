
import 'package:flutter/material.dart';
import 'package:tools/screens/SplashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
 // Initialize Firebase
  // WidgetsFlutterBinding.ensureInitialized();
  // await SharedPreferences.getInstance(); // Initialize shared preferences
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
