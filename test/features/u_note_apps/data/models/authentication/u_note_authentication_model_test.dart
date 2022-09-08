import 'package:flutter_test/flutter_test.dart';
import 'package:u_note_apps/features/u_note_apps/data/models/authentication/u_note_authentication_model.dart';

void main() {
  group('authentication model test', () {
    const id = 'mock-id';
    const email = 'mock-email';
    const name = 'mock-name';
    const photo = 'mock-photo';
    //test if users empty
    test('isEmpty returns true for empty user', () {
      expect(UNoteAuthenticationModel.empty.isEmpty, isTrue);
    });

    // test if user not empty
    test('isEmpty returns false for non-empty user', () {
      const user = UNoteAuthenticationModel(
          email: email, id: id, name: name, photo: photo);
      expect(user.isEmpty, isFalse);
    });

    // test return false for empty user
    test('isNotEmpty returns false for empty user', () {
      expect(UNoteAuthenticationModel.empty.isNotEmpty, isFalse);
    });

    // return true for nom-empty user
    test('isNotEmpty returns true for non-empty user', () {
      const user = UNoteAuthenticationModel(
          email: email, id: id, name: name, photo: photo);
      expect(user.isNotEmpty, isTrue);
    });
  });
}
