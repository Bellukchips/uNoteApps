import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:u_note_apps/core/usecase/i_usecases.dart';
import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';
import 'package:mockito/annotations.dart';
import 'package:u_note_apps/features/u_note_apps/domain/entities/authentication/u_note_apps_authentication.dart';
import 'package:u_note_apps/features/u_note_apps/domain/repositories/authentication/u_note_apps_authentication_repository.dart';
import 'package:u_note_apps/features/u_note_apps/domain/usecases/usecases.dart';
//mocks
import 'auth_with_google_account_test.mocks.dart';

@GenerateMocks([UNoteAppsAuthenticationRepository])
void main() {
  late AuthWithGoogleAccountUseCase usecase;
  late MockGoogleSignIn googleSignIn;
  late UNoteAppsAuthenticationRepository mockRepository;
  late UNoteAppsAuthenticationEntities mockData =
      const UNoteAppsAuthenticationEntities(email: 'mock-email', id: 'mock-id');
  setUp(() {
    mockRepository = MockUNoteAppsAuthenticationRepository();
    usecase = AuthWithGoogleAccountUseCase(repository: mockRepository);
    googleSignIn = MockGoogleSignIn();
  });
  test('should return idToken and accessToken when authenticating', () async {
    final signInAccount = await googleSignIn.signIn();
    final signInAuthentication = await signInAccount!.authentication;
    expect(signInAuthentication, isNotNull);
    expect(googleSignIn.currentUser, isNotNull);
    expect(signInAuthentication.accessToken, isNotNull);
    expect(signInAuthentication.idToken, isNotNull);
  });

  test('should return null when google login is cancelled by the user',
      () async {
    googleSignIn.setIsCancelled(true);
    final signInAccount = await googleSignIn.signIn();
    expect(signInAccount, isNull);
  });
  test(
      'testing google login twice, once cancelled, once not cancelled at the same test.',
      () async {
    googleSignIn.setIsCancelled(true);
    final signInAccount = await googleSignIn.signIn();
    expect(signInAccount, isNull);
    googleSignIn.setIsCancelled(false);
    final signInAccountSecondAttempt = await googleSignIn.signIn();
    expect(signInAccountSecondAttempt, isNotNull);
  });

  test('should auth with google repository ', () async {
    //!arrange
    when(mockRepository.authWithGoogleAccount())
        .thenAnswer((_) async => Right(mockData));
    //!act
    final result = await usecase(NoParams());
    //!assert
    expect(result, equals(Right(mockData)));
    verify(mockRepository.authWithGoogleAccount());
    verifyNoMoreInteractions(mockRepository);
  });
}
