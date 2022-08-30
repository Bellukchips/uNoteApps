import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:u_note_apps/core/errors/errors.dart';
import 'package:u_note_apps/core/network/network.dart';
import 'package:u_note_apps/features/u_note_apps/data/datasources/datasources.dart';
import 'package:u_note_apps/features/u_note_apps/data/models/authentication/u_note_authentication_model.dart';
import 'package:u_note_apps/features/u_note_apps/data/repository/repository.dart';
//mocks
import 'u_note_authentication_repository_impl_test.mocks.dart';

@GenerateMocks([UNoteDataSourceRemoteFirebaseAuth])
@GenerateMocks([INetworkInfo])
void main() {
  late UNoteDataSourceRemoteFirebaseAuth mockUNoteDataSourceRemoteFirebaseAuth;
  late INetworkInfo mockINetworkInfo;
  late UNoteAuthenticationRepositoryImpl repositoryImpl;
  const UNoteAuthenticationModel uNoteAuthenticationModel =
      UNoteAuthenticationModel(
          email: 'mock-email',
          id: 'mock-id',
          name: 'mock-name',
          photo: 'mock-photo');
  setUp(() {
    mockUNoteDataSourceRemoteFirebaseAuth =
        MockUNoteDataSourceRemoteFirebaseAuth();
    mockINetworkInfo = MockINetworkInfo();
    repositoryImpl = UNoteAuthenticationRepositoryImpl(
        network: mockINetworkInfo,
        remoteFirebaseAuth: mockUNoteDataSourceRemoteFirebaseAuth);
    when(mockUNoteDataSourceRemoteFirebaseAuth.authWithGoogle())
        .thenAnswer((_) async => uNoteAuthenticationModel);
  });

  void runTestOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockINetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockINetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  // run testing
  group('authWithGoogle', () {
    test('should check if device is online', () async {
      //!arrange
      when(mockINetworkInfo.isConnected).thenAnswer((_) async => true);
      //!act
      await repositoryImpl.authWithGoogleAccount();
      //!assert
      verify(mockINetworkInfo.isConnected);
    });

    runTestOnline(() {
      test('should auth with google is successfull', () async {
        //!arrange
        when(mockUNoteDataSourceRemoteFirebaseAuth.authWithGoogle())
            .thenAnswer((_) async => uNoteAuthenticationModel);
        //!act
        final result = await repositoryImpl.authWithGoogleAccount();
        //!assert
        verify(mockUNoteDataSourceRemoteFirebaseAuth.authWithGoogle());
        expect(result, equals(const Right(uNoteAuthenticationModel)));
      });
      test('should return failure when auth with google is unsuccessfully',
          () async {
        //!arrange
        when(mockUNoteDataSourceRemoteFirebaseAuth.authWithGoogle())
            .thenThrow(ServerException());
        //!act
        final result = await repositoryImpl.authWithGoogleAccount();
        //!assert
        verify(mockUNoteDataSourceRemoteFirebaseAuth.authWithGoogle());
        expect(result, equals(Left(ServerFailures())));
      });
    });
    // _runTestOffline(() {});
  });

  // group('get Current User', () {
  //   test('should check if device is online', () async {
  //     //!arrange
  //     when(mockINetworkInfo.isConnected).thenAnswer((_) async => true);
  //     //!act
  //     await repositoryImpl.authWithGoogleAccount();
  //     //!assert
  //     verify(mockINetworkInfo.isConnected);
  //   });

  //   // _runTestOffline(() {});
  // });
  // group('stream User', () {
  //   test('should check if device is online', () async {
  //     //!arrange
  //     when(mockINetworkInfo.isConnected).thenAnswer((_) async => true);
  //     //!act
  //     await repositoryImpl.authWithGoogleAccount();
  //     //!assert
  //     verify(mockINetworkInfo.isConnected);
  //   });

  //   // _runTestOffline(() {});
  // });
  // group('logOut', () {
  //   test('should check if device is online', () async {
  //     //!arrange
  //     when(mockINetworkInfo.isConnected).thenAnswer((_) async => true);
  //     //!act
  //     await repositoryImpl.authWithGoogleAccount();
  //     //!assert
  //     verify(mockINetworkInfo.isConnected);
  //   });

  //   // _runTestOffline(() {});
  // });
}
