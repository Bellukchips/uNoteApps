import 'package:equatable/equatable.dart';

class UNoteAppsAuthenticationEntities extends Equatable {
  /// get email user
  final String? email;

  /// get id user
  final String? id;

  /// get name user
  final String? name;

  /// get photo url user
  final String? photo;

  ///empty user which represents an unauthenticated user
  static const empty = UNoteAppsAuthenticationEntities(id: '');

  /// checking current user is empty
  bool get isEmpty => this == UNoteAppsAuthenticationEntities.empty;

  /// checking current user is not empty
  bool get isNotEmpty => this != UNoteAppsAuthenticationEntities.empty;

  const UNoteAppsAuthenticationEntities({
    this.email,
    this.id,
    this.name,
    this.photo,
  });
  @override
  List<Object?> get props => [email, id, name, photo];
}
