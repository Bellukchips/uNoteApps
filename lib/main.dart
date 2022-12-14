import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_note_apps/features/u_note_apps/data/datasources/datasources.dart';
import 'package:u_note_apps/features/u_note_apps/presentation/cubits/cubits.dart';
import 'app.dart';
import 'core/helper/helper.dart';
import 'core/view/bloc/u_note_bloc.dart';
import 'inject_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // di
  await InjectionContainer.init();
  // setup firebase
  await Firebase.initializeApp();

  // Bloc observer
  Bloc.observer = AppBlocObserver();
  // set status bar color
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 255, 255, 255),
        statusBarBrightness: Brightness.light),
  );
  // data source
  final unoteDataSource = UNoteDataSourceRemoteFirebaseAuthImpl();
  await unoteDataSource.user.first;
  runApp(RepositoryProvider.value(
    value: unoteDataSource,
    child: MultiBlocProvider(providers: [
      BlocProvider(
        create: ((context) => sl<UNoteBloc>()),
      ),
      BlocProvider(
        create: (context) => sl<AuthenticationCubit>(),
      )
    ], child: const App()),
  ));
}
