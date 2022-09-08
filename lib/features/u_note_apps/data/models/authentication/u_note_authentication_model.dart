import 'package:u_note_apps/features/u_note_apps/domain/entities/authentication/u_note_authentication_entities.dart';

class UNoteAuthenticationModel extends UNoteAuthenticationEntities {
  const UNoteAuthenticationModel(
      {String? id, String? email, String? name, String? photo})
      : super(email: email, id: id, photo: photo, name: name);

  ///empty user which represents an unauthenticated user
  static const empty =
      UNoteAuthenticationModel(id: '', email: '', name: '', photo: '');

  /// checking current user is empty
  @override
  bool get isEmpty => this == UNoteAuthenticationModel.empty;

  /// checking current user is not empty
  @override
  bool get isNotEmpty => this != UNoteAuthenticationModel.empty;

  UNoteAuthenticationModel copyWith({
    String? email,
    String? id,
    String? name,
    String? photo,
  }) {
    return UNoteAuthenticationModel(
      email: email ?? this.email,
      id: id ?? this.id,
      name: name ?? this.name,
      photo: photo ?? this.photo,
    );
  }
}
