import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/views/home.dart';
import 'package:real_estate_app/views/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _prefs;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String? getData(String key) {
    return _prefs?.getString(key);
  }

  static Future<void> saveData(String key, String data) async {
    await _prefs?.setString(key, data);
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const
          // Home()
          Splash(),
    );
  }
}
