import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
// import 'package:u_note_apps/core/errors/errors.dart';
import 'package:u_note_apps/features/u_note_apps/data/datasources/datasources.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';

class MockCacheClient extends Mock implements CacheClient {}

class MockFirebaseAuth extends Mock implements firebase_auth.FirebaseAuth {}

class MockFirebaseUser extends Mock implements firebase_auth.User {}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}

class MockGoogleSignInAuthentication extends Mock
    implements GoogleSignInAuthentication {}

class MockUserCredential extends Mock implements firebase_auth.UserCredential {}

class FakeAuthCredential extends Fake implements firebase_auth.AuthCredential {}

class FakeAuthProvider extends Fake
    implements firebase_auth.GoogleAuthProvider {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late CacheClient cache;
  late firebase_auth.FirebaseAuth firebaseAuth;
  late GoogleSignIn googleSignIn;
  late UNoteDataSourceRemoteFirebaseAuthImpl
      uNoteDataSourceRemoteFirebaseAuthImpl;

  setUp(() {
    //
    googleSignIn = MockGoogleSignIn();
    firebaseAuth = MockFirebaseAuth();
    cache = MockCacheClient();
    uNoteDataSourceRemoteFirebaseAuthImpl =
        UNoteDataSourceRemoteFirebaseAuthImpl(
            firebaseAuth: firebaseAuth,
            cache: cache,
            googleSignIn: googleSignIn);
  });

  group('authWithGoogleAccount', () {
    // mock test
    const accessToken = 'mock-accessToken';
    const idToken = 'mock-idToken';
    setUp(() {
      final googleSignInAuthentication = MockGoogleSignInAuthentication();
      final googleSignInAccount = MockGoogleSignInAccount();
      when(googleSignInAuthentication.accessToken).thenReturn(accessToken);
      when(googleSignInAuthentication.idToken).thenReturn(idToken);
      when(googleSignInAccount.authentication)
          .thenAnswer((_) async => googleSignInAuthentication);
      when(googleSignIn.signIn()).thenAnswer((_) async => googleSignInAccount);
      when(firebaseAuth.signInWithCredential(FakeAuthCredential()))
          .thenAnswer((_) => Future.value(MockUserCredential()));
      when(firebaseAuth.signInWithPopup(FakeAuthProvider()))
          .thenAnswer((_) => Future.value(MockUserCredential()));
    });

    test('should test with auth google account', () async {
      //!arrange
      await uNoteDataSourceRemoteFirebaseAuthImpl.authWithGoogle();
      //!act
      //!assert
      verify(googleSignIn.signIn()).called(1);
      verify(firebaseAuth.signInWithCredential(FakeAuthCredential())).called(1);
    });

    // test(
    //     'throws LogInWithGoogleFailure and calls signIn authentication, and '
    //     'signInWithPopup when authCredential is null and kIsWeb is true',
    //     () async {
    //   uNoteDataSourceRemoteFirebaseAuthImpl.isWeb = true;
    //   await expectLater(
    //     () => uNoteDataSourceRemoteFirebaseAuthImpl.authWithGoogle(),
    //     throwsA(isA<LogInWithGoogleFailure>()),
    //   );
    //   verifyNever(() => mockGoogleSignIn.signIn());
    //   verify(() => mockFirebaseAuth.signInWithPopup(MockGoogleAuthProvider()))
    //       .called(1);
    // });

    // test(
    //     'successfully calls signIn authentication, and '
    //     'signInWithPopup when authCredential is not null and kIsWeb is true',
    //     () async {
    //   final credential = MockUserCredential();
    //   when(() => mockFirebaseAuth.signInWithPopup(MockGoogleAuthProvider()))
    //       .thenAnswer((_) async => credential);
    //   when(() => credential.credential).thenReturn(FakeAuthCredential());
    //   authenticationRepository.isWeb = true;
    //   await expectLater(
    //     authenticationRepository.logInWithGoogle(),
    //     completes,
    //   );
    //   verifyNever(() => googleSignIn.signIn());
    //   verify(() => firebaseAuth.signInWithPopup(any())).called(1);
    // });

    // test('succeeds when signIn succeeds', () {
    //   expect(uNoteDataSourceRemoteFirebaseAuthImpl.authWithGoogle(), completes);
    // });

    // test('throws LogInWithGoogleFailure when exception occurs', () async {
    //   when(() => mockFirebaseAuth.signInWithCredential(MockAuthCredential()))
    //       .thenThrow(Exception());
    //   expect(
    //     uNoteDataSourceRemoteFirebaseAuthImpl.authWithGoogle(),
    //     throwsA(isA<LogInWithGoogleFailure>()),
    //   );
    // });
  });
  group('logOut', () {});
}
