import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'core/helper/helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Bloc observer
  Bloc.observer = AppBlocObserver();
  // set status bar color
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFFFBD13),
        statusBarBrightness: Brightness.light),
  );

  runApp(const App());
}
