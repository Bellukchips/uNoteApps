import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:u_note_apps/core/view/app_view.dart';
import 'features/u_note_apps/data/datasources/remote/remote.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // set orientation vertical

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    super.dispose();
  }

  // init data source remote firebase impl
  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}
