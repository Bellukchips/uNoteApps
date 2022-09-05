import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:u_note_apps/core/enum/enum.dart';
import 'package:u_note_apps/core/view/bloc/u_note_bloc.dart';
import 'package:u_note_apps/features/u_note_apps/data/datasources/remote/remote.dart';
import 'package:u_note_apps/routes/router_generator.dart';

class AppView extends StatelessWidget {
  const AppView({
    Key? key,
    required UNoteDataSourceRemoteFirebaseAuthImpl authenticationRepositoryImpl,
  })  : _authenticationRepositoryImpl = authenticationRepositoryImpl,
        super(key: key);
  final UNoteDataSourceRemoteFirebaseAuthImpl _authenticationRepositoryImpl;
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepositoryImpl,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FlowBuilder<AppStatus>(
          state: context.select((UNoteBloc bloc) => bloc.state.appStatus),
          onGeneratePages: onGenerateAppViewPages,
        ),
      ),
    );
  }
}
