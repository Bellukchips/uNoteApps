part of 'u_note_firebase_auth_impl.dart';

abstract class UNoteDataSourceRemoteFirebaseAuth {
  //! Interface class for firebase authentication
  Future<UNoteAuthenticationModel> authWithGoogle();
  Future<UNoteAuthenticationModel> logOut();
  Stream<UNoteAuthenticationModel> get user;
  UNoteAuthenticationModel get currentUser;
}
