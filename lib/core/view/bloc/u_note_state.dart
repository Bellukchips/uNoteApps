part of 'u_note_bloc.dart';

class UNoteState extends Equatable {
  final AppStatus appStatus;
  final UNoteAuthenticationEntities uNoteAuthenticationModel;
  const UNoteState._({
    required this.appStatus,
    this.uNoteAuthenticationModel = UNoteAuthenticationModel.empty,
  });

  const UNoteState.authenticated(UNoteAuthenticationEntities model)
      : this._(
            appStatus: AppStatus.authenticated,
            uNoteAuthenticationModel: model);
  const UNoteState.loading() : this._(appStatus: AppStatus.loading);
  const UNoteState.initial() : this._(appStatus: AppStatus.initial);
  const UNoteState.unauthenticated()
      : this._(appStatus: AppStatus.unauthenticated);
  @override
  List<Object> get props => [appStatus, uNoteAuthenticationModel];
}
