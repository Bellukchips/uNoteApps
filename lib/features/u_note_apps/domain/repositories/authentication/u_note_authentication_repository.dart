import 'package:dartz/dartz.dart';
import 'package:u_note_apps/core/errors/errors.dart';

import '../../entities/entities.dart';

abstract class UNoteAuthenticationRepository {
  Future<Either<Failures, UNoteAuthenticationEntities>> authWithGoogleAccount();
  Stream<UNoteAuthenticationEntities> get user;
  UNoteAuthenticationEntities get currentUser;
  Future<Either<Failures, UNoteAuthenticationEntities>> logOut();
}
