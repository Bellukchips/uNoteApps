import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:u_note_apps/core/enum/enum.dart';
import 'package:u_note_apps/core/view/bloc/u_note_bloc.dart';
import 'package:u_note_apps/routes/router_generator.dart';

class AppView extends StatelessWidget {
  const AppView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "UNote | Create & Saving Your'e Note",
      debugShowCheckedModeBanner: false,
      home: FlowBuilder<AppStatus>(
        state: context.select((UNoteBloc bloc) => bloc.state.appStatus),
        onGeneratePages: ((state, pages) {
          return onGenerateAppViewPages(state, pages);
        }),
      ),
    );
  }
}
