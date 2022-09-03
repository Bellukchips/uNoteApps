import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:logger/logger.dart';

import 'package:u_note_apps/features/u_note_apps/data/datasources/datasources.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(
    this._authImpl,
  ) : super(const AuthenticationState());

  final UNoteDataSourceRemoteFirebaseAuthImpl _authImpl;
  var logger = Logger();

  Future<void> logInWithGoogle() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _authImpl.authWithGoogle();
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on Exception catch (e) {
      logger.d(e.toString());
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    } on NoSuchMethodError catch (e) {
      logger.d(e.toString());
      emit(state.copyWith(status: FormzStatus.pure));
    }
  }
}
