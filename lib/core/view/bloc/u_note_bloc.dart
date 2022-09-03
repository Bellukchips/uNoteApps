import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:u_note_apps/core/enum/enum.dart';
import 'package:u_note_apps/core/usecase/usecase.dart';
import 'package:u_note_apps/features/u_note_apps/data/datasources/datasources.dart';
import 'package:u_note_apps/features/u_note_apps/data/models/authentication/u_note_authentication_model.dart';
import 'package:u_note_apps/features/u_note_apps/domain/entities/entities.dart';
import 'package:u_note_apps/features/u_note_apps/domain/usecases/usecases.dart';

part 'u_note_event.dart';
part 'u_note_state.dart';

class UNoteBloc extends Bloc<UNoteEvent, UNoteState> {
  UNoteBloc(
      {required AuthWithGoogleAccountUseCase authWithGoogleAccountUseCase,
      required LogoutGoogleAccountUseCase logoutGoogleAccountUseCase,
      required UNoteDataSourceRemoteFirebaseAuthImpl
          uNoteDataSourceRemoteFirebaseAuthImpl})
      : _authWithGoogleAccountUseCase = authWithGoogleAccountUseCase,
        _dataSourceRemoteFirebaseAuthImpl =
            uNoteDataSourceRemoteFirebaseAuthImpl,
        _logoutGoogleAccountUseCase = logoutGoogleAccountUseCase,
        super(authWithGoogleAccountUseCase.currentUser.isNotEmpty
            ? UNoteState.authenticated(authWithGoogleAccountUseCase.currentUser)
            : const UNoteState.unauthenticated()) {
    on<UNoteEvent>((event, emit) {
      on<UNoteUserChanged>(_onUserChanged);
      on<UNoteLogoutRequested>(_onLogoutRequested);
      _streamSubscription =
          _dataSourceRemoteFirebaseAuthImpl.user.listen((event) {
        return add(UNoteUserChanged(event));
      });
    });
  }

  final AuthWithGoogleAccountUseCase _authWithGoogleAccountUseCase;
  final LogoutGoogleAccountUseCase _logoutGoogleAccountUseCase;
  final UNoteDataSourceRemoteFirebaseAuthImpl _dataSourceRemoteFirebaseAuthImpl;
  late final StreamSubscription<UNoteAuthenticationModel> _streamSubscription;

  void _onUserChanged(UNoteUserChanged event, Emitter<UNoteState> emit) {
    emit(event.user.isNotEmpty
        ? UNoteState.authenticated(event.user)
        : const UNoteState.unauthenticated());
  }

  void _onLogoutRequested(
      UNoteLogoutRequested event, Emitter<UNoteState> emit) {
    unawaited(_logoutGoogleAccountUseCase(NoParams()));
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
