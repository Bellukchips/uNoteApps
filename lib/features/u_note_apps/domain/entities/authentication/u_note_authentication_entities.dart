import 'package:equatable/equatable.dart';
import 'package:u_note_apps/features/u_note_apps/data/models/models.dart';

class UNoteAuthenticationEntities extends Equatable {
  /// get email user
  final String? email;

  /// get id user
  final String? id;

  /// get name user
  final String? name;

  /// get photo url user
  final String? photo;

  /// checking current user is empty
  bool get isEmpty => this == UNoteAuthenticationModel.empty;

  /// checking current user is not empty
  bool get isNotEmpty => this != UNoteAuthenticationModel.empty;

  const UNoteAuthenticationEntities({
    this.email,
    this.id,
    this.name,
    this.photo,
  });
  @override
  List<Object?> get props => [email, id, name, photo];
}
