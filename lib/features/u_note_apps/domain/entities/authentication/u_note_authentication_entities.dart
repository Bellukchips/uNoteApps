import 'package:equatable/equatable.dart';

class UNoteAuthenticationEntities extends Equatable {
  /// get email user
  final String? email;

  /// get id user
  final String? id;

  /// get name user
  final String? name;

  /// get photo url user
  final String? photo;

  const UNoteAuthenticationEntities({
    this.email,
    this.id,
    this.name,
    this.photo,
  });
  @override
  List<Object?> get props => [email, id, name, photo];
}
