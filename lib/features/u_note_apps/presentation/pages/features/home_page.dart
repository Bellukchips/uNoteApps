import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
  static Page<void> page() => const MaterialPage<void>(child: HomePage());
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              'email user',
              textAlign: TextAlign.center,
            ),
            MaterialButton(
              onPressed: () {},
              child: Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
