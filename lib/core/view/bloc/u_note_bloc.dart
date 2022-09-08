import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
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
      {required LogoutGoogleAccountUseCase logoutGoogleAccountUseCase,
      required UNoteDataSourceRemoteFirebaseAuthImpl
          uNoteDataSourceRemoteFirebaseAuthImpl})
      : _dataSourceRemoteFirebaseAuthImpl =
            uNoteDataSourceRemoteFirebaseAuthImpl,
        _logoutGoogleAccountUseCase = logoutGoogleAccountUseCase,
        super(uNoteDataSourceRemoteFirebaseAuthImpl.currentUser.isNotEmpty
            ? UNoteState.authenticated(
                uNoteDataSourceRemoteFirebaseAuthImpl.currentUser)
            : const UNoteState.unauthenticated()) {
    on<UNoteUserChanged>(_onUserChanged);
    on<UNoteLogoutRequested>(_onLogoutRequested);
    _streamSubscription =
        _dataSourceRemoteFirebaseAuthImpl.user.listen((user) async {
      logger.d(user);
      return add(UNoteUserChanged(user));
    });
  }

  final LogoutGoogleAccountUseCase _logoutGoogleAccountUseCase;
  final UNoteDataSourceRemoteFirebaseAuthImpl _dataSourceRemoteFirebaseAuthImpl;
  late final StreamSubscription<UNoteAuthenticationModel> _streamSubscription;
  var logger = Logger();
  void _onUserChanged(UNoteUserChanged event, Emitter<UNoteState> emit) {
    logger.d(event.user);
    emit(const UNoteState.loading());
    return event.user.isNotEmpty
        ? emit(UNoteState.authenticated(event.user))
        : const UNoteState.unauthenticated();
  }

  void _onLogoutRequested(
      UNoteLogoutRequested event, Emitter<UNoteState> emit) {
    emit(const UNoteState.loading());
    unawaited(_logoutGoogleAccountUseCase(NoParams()));
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
