import 'package:u_note_apps/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:u_note_apps/core/usecase/usecase.dart';
import 'package:u_note_apps/features/u_note_apps/domain/entities/entities.dart';
import 'package:u_note_apps/features/u_note_apps/domain/repositories/repositories.dart';

class LogoutGoogleAccountUseCase
    implements IUseCase<UNoteAuthenticationEntities, NoParams> {
  final UNoteAuthenticationRepository repository;

  LogoutGoogleAccountUseCase(this.repository);

  @override
  Future<Either<Failures, UNoteAuthenticationEntities>> call(
      NoParams params) async {
    return await repository.logOut();
  }
}
