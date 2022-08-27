import 'package:flutter_test/flutter_test.dart';
import 'package:u_note_apps/features/u_note_apps/domain/entities/authentication/u_note_apps_authentication.dart';

void main() {
  group('authentication entities test', () {
    const id = 'mock-id';
    const email = 'mock-email';
    test('should uses value equality', () {
      //!arrange

      //!act

      //!assert
      expect(const UNoteAppsAuthenticationEntities(email: email, id: id),
          equals(const UNoteAppsAuthenticationEntities(email: email, id: id)));
    });
    //test if users empty
    test('isEmpty returns true for empty user', () {
      expect(UNoteAppsAuthenticationEntities.empty.isEmpty, isTrue);
    });

    // test if user not empty
    test('isEmpty returns false for non-empty user', () {
      const user = UNoteAppsAuthenticationEntities(email: email, id: id);
      expect(user.isEmpty, isFalse);
    });

    // test return false for empty user
    test('isNotEmpty returns false for empty user', () {
      expect(UNoteAppsAuthenticationEntities.empty.isNotEmpty, isFalse);
    });

    // return true for nom-empty user
    test('isNotEmpty returns true for non-empty user', () {
      const user = UNoteAppsAuthenticationEntities(email: email, id: id);
      expect(user.isNotEmpty, isTrue);
    });
  });
}
