import 'package:flutter/material.dart';
import 'package:pixabay_gallery_mobile/app/app.dart';
import 'package:pixabay_gallery_mobile/service_locator.dart';

Future<void> main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const App(),
  );
}
