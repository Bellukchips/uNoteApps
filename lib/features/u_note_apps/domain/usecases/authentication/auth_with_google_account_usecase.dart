import 'package:dartz/dartz.dart';
import 'package:u_note_apps/core/errors/errors.dart';
import 'package:u_note_apps/features/u_note_apps/domain/entities/authentication/u_note_authentication_entities.dart';
import 'package:u_note_apps/features/u_note_apps/domain/repositories/repositories.dart';

import '../../../../../core/usecase/i_usecases.dart';

class AuthWithGoogleAccountUseCase
    implements IUseCase<UNoteAuthenticationEntities, NoParams> {
  final UNoteAuthenticationRepository repository;
  AuthWithGoogleAccountUseCase({
    required this.repository,
  });

  //! call interface class from [UNoteAppsAuthenticationRepository]

  @override
  Future<Either<Failures, UNoteAuthenticationEntities>> call(NoParams params) async{
    return await repository.authWithGoogleAccount();
  }

  UNoteAuthenticationEntities get currentUser {
    return repository.currentUser;
  }

  Stream<UNoteAuthenticationEntities> get user {
    return repository.user;
  }
}
