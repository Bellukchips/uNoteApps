import 'package:flutter/material.dart';
import 'package:u_note_apps/core/view/bloc/u_note_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
  static Page<void> page() => const MaterialPage<void>(child: HomePage());
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user =
        context.select((UNoteBloc bloc) => bloc.state.uNoteAuthenticationModel);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                user.email ?? '',
                textAlign: TextAlign.center,
              ),
              MaterialButton(
                onPressed: () {
                  context.read<UNoteBloc>().add(UNoteLogoutRequested());
                },
                child: Text('Logout'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
