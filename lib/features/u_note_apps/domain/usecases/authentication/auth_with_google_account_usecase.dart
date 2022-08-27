import 'package:dartz/dartz.dart';
import 'package:u_note_apps/core/errors/errors.dart';
import 'package:u_note_apps/features/u_note_apps/domain/entities/entities.dart';
import 'package:u_note_apps/features/u_note_apps/domain/repositories/repositories.dart';

import '../../../../../core/usecase/i_usecases.dart';

class AuthWithGoogleAccountUseCase
    implements IUseCase<UNoteAppsAuthenticationEntities, NoParams> {
  final UNoteAppsAuthenticationRepository repository;
  AuthWithGoogleAccountUseCase({
    required this.repository,
  });

  //! call interface class from [UNoteAppsAuthenticationRepository]
  @override
  Future<Either<Failures, UNoteAppsAuthenticationEntities>> call(
      NoParams params) async {
    return repository.authWithGoogleAccount();
  }
}
