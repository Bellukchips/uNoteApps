import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:u_note_apps/core/network/network.dart';
import 'package:u_note_apps/core/view/bloc/u_note_bloc.dart';
import 'package:u_note_apps/features/u_note_apps/data/datasources/datasources.dart';
import 'package:u_note_apps/features/u_note_apps/data/repository/repository.dart';
import 'package:u_note_apps/features/u_note_apps/domain/repositories/repositories.dart';
import 'package:u_note_apps/features/u_note_apps/presentation/cubits/cubits.dart';

import 'features/u_note_apps/domain/usecases/usecases.dart';

GetIt sl = GetIt.instance;

class InjectionContainer {
  static init() async {
    //!core -> view -> bloc
    sl.registerFactory(() => UNoteBloc(
        uNoteDataSourceRemoteFirebaseAuthImpl: sl(),
        authWithGoogleAccountUseCase: sl(),
        logoutGoogleAccountUseCase: sl()));
    //!Cubits
    sl.registerFactory(() => AuthenticationCubit(sl()));
    //!domain -> usecase
    sl.registerLazySingleton(
        () => AuthWithGoogleAccountUseCase(repository: sl()));
    sl.registerLazySingleton(() => LogoutGoogleAccountUseCase(sl()));
    //!domain -> repository
    sl.registerLazySingleton<UNoteAuthenticationRepository>(() =>
        UNoteAuthenticationRepositoryImpl(
            network: sl(), remoteFirebaseAuth: sl()));
    //!datasource
    sl.registerLazySingleton<UNoteDataSourceRemoteFirebaseAuth>(() =>
        UNoteDataSourceRemoteFirebaseAuthImpl(
            cache: sl(), firebaseAuth: sl(), googleSignIn: sl()));
    sl.registerLazySingleton(() => UNoteDataSourceRemoteFirebaseAuthImpl(
        cache: sl(), firebaseAuth: sl(), googleSignIn: sl()));
    //!core -> network
    sl.registerLazySingleton<INetworkInfo>(
        () => NetworkInfoImpl(connectionChecker: sl()));
    //!external
    sl.registerLazySingleton(() => InternetConnectionChecker());
    sl.registerLazySingleton(() => CacheClient());
    sl.registerLazySingleton(() => FirebaseAuth.instance);
    sl.registerLazySingleton(() => GoogleSignIn());
  }
}
