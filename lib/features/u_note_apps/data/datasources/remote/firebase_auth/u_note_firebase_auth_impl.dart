import 'package:u_note_apps/core/errors/errors.dart';
import 'package:u_note_apps/features/u_note_apps/data/models/models.dart';

import '../../local/local.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:u_note_apps/features/u_note_apps/data/datasources/datasources.dart';
part 'u_note_data_source_firebase_auth_remote.dart';

class UNoteFirebaseAuthImpl implements UNoteDataSourceRemoteFirebaseAuth {
  final CacheClient _cacheClient;
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  UNoteFirebaseAuthImpl({
    CacheClient? cache,
    firebase_auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : _cacheClient = cache ?? CacheClient(),
        _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard();

  //? User cache key
  @visibleForTesting
  static const userCacheKey = '__user_cache_key__';

  //! default t kisWeb
  @visibleForTesting
  bool isWeb = kIsWeb;

  @override
  Future<UNoteAuthenticationModel> authWithGoogle() async {
    try {
      late final firebase_auth.AuthCredential credential;
      if (isWeb) {
        final googleProvider = firebase_auth.GoogleAuthProvider();
        final userCredential = await _firebaseAuth.signInWithPopup(
          googleProvider,
        );
        credential = userCredential.credential!;
      } else {
        final googleUser = await _googleSignIn.signIn();
        final googleAuth = await googleUser!.authentication;
        credential = firebase_auth.GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
      }

      final signIn = await _firebaseAuth.signInWithCredential(credential);
      return UNoteAuthenticationModel(
          email: signIn.user?.email,
          id: signIn.user?.uid,
          name: signIn.user?.displayName,
          photo: signIn.user?.photoURL);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithGoogleFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithGoogleFailure();
    }
  }

  @override
  UNoteAuthenticationModel get currentUser {
    return _cacheClient.read(key: userCacheKey) ??
        UNoteAuthenticationModel.empty;
  }

  @override
  Future<UNoteAuthenticationModel> logOut() async {
    try {
      await Future.wait([_firebaseAuth.signOut(), _googleSignIn.signOut()]);
      return const UNoteAuthenticationModel(
          email: '', id: '', name: '', photo: '');
    } catch (_) {
      throw ServerFailures();
    }
  }

  @override
  Stream<UNoteAuthenticationModel> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null
          ? UNoteAuthenticationModel.empty
          : firebaseUser.toUser;
      _cacheClient.write(key: userCacheKey, value: user);
      return user;
    });
  }
}

extension on firebase_auth.User {
  UNoteAuthenticationModel get toUser {
    return UNoteAuthenticationModel(
        id: uid, email: email, name: displayName, photo: photoURL);
  }
}
