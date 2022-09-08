import 'package:flutter/material.dart';
import 'package:u_note_apps/core/view/bloc/u_note_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: HomePage());
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
