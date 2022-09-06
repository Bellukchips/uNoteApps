import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import 'package:u_note_apps/features/u_note_apps/data/datasources/datasources.dart';

import '../../../../../core/errors/errors.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(
    this._authImpl,
  ) : super(const AuthenticationState());

  final UNoteDataSourceRemoteFirebaseAuthImpl _authImpl;

  Future<void> logInWithGoogle() async {
    emit(state.copyWith(
        status: FormzStatus.submissionInProgress, errorMessage: 'Loading'));
    try {
      await _authImpl.authWithGoogle();
      emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          errorMessage: 'Authentication Success'));
    } on LogInWithGoogleFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: FormzStatus.submissionFailure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, errorMessage: 'Failure'));
    }
  }
}
