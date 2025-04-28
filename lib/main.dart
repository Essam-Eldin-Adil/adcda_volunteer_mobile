import 'package:adcda_volunteers_mobile/app.dart';
import 'package:flutter/material.dart';
import 'core/utils/Preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.initPref();
  runApp(const MyApp());
}
