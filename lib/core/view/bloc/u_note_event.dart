part of 'u_note_bloc.dart';

abstract class UNoteEvent extends Equatable {
  const UNoteEvent();

  @override
  List<Object> get props => [];
}

class UNoteLogoutRequested extends UNoteEvent {}

class UNoteUserChanged extends UNoteEvent {
  @visibleForTesting
  const UNoteUserChanged(this.user);

  final UNoteAuthenticationModel user;

  @override
  List<Object> get props => [user];
}
