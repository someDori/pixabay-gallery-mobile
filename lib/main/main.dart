import 'package:flutter/material.dart';
import 'package:pixabay_gallery_mobile/app/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const App(),
  );
}
