import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:last_minute/firebase_options.dart';
import 'package:last_minute/helper/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}
