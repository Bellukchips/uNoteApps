import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Bloc observer
  // Bloc.observer = AppBlocObserver();
  // set orientation vertical
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFFFBD13),
        statusBarBrightness: Brightness.light),
  );

  runApp(const App());
}
