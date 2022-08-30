import 'package:dartz/dartz.dart';

import 'package:u_note_apps/core/network/network.dart';
import 'package:u_note_apps/features/u_note_apps/domain/entities/authentication/u_note_authentication_entities.dart';
import 'package:u_note_apps/features/u_note_apps/domain/repositories/authentication/u_note_authentication_repository.dart';

import '../../../../../core/errors/errors.dart';
import '../../datasources/remote/remote.dart';

class UNoteAuthenticationRepositoryImpl extends UNoteAuthenticationRepository {
  final INetworkInfo network;
  final UNoteDataSourceRemoteFirebaseAuth remoteFirebaseAuth;
  UNoteAuthenticationRepositoryImpl({
    required this.network,
    required this.remoteFirebaseAuth,
  });
  @override
  Future<Either<Failures, UNoteAuthenticationEntities>>
      authWithGoogleAccount() async {
    if (await network.isConnected) {
      try {
        final auth = await remoteFirebaseAuth.authWithGoogle();
        return Right(auth);
      } on ServerException {
        return Left(ServerFailures());
      }
    } else {
      return Left(ServerFailures());
    }
  }

  @override
  UNoteAuthenticationEntities get currentUser {
    return remoteFirebaseAuth.currentUser;
  }

  @override
  Future<Either<Failures, UNoteAuthenticationEntities>> logOut() async {
    if (await network.isConnected) {
      try {
        final signOut = await remoteFirebaseAuth.logOut();
        return Right(signOut);
      } on ServerException {
        return Left(ServerFailures());
      }
    } else {
      return Left(ServerFailures());
    }
  }

  @override
  Stream<UNoteAuthenticationEntities> get user {
    return remoteFirebaseAuth.user;
  }
}
