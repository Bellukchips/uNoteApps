import 'package:dartz/dartz.dart';
import 'package:u_note_apps/core/errors/errors.dart';
import 'package:u_note_apps/features/u_note_apps/domain/entities/entities.dart';

abstract class UNoteAppsAuthenticationRepository {
  Future<Either<Failures, UNoteAppsAuthenticationEntities>>
      authWithGoogleAccount();
}
