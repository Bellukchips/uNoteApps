import 'package:flutter_test/flutter_test.dart';
import 'package:u_note_apps/features/u_note_apps/domain/entities/authentication/u_note_authentication_entities.dart';

void main() {
  group('authentication entities test', () {
    const id = 'mock-id';
    const email = 'mock-email';
    test('should uses value equality', () {
      //!arrange

      //!act

      //!assert
      expect(const UNoteAuthenticationEntities(email: email, id: id),
          equals(const UNoteAuthenticationEntities(email: email, id: id)));
    });
    //test if users empty
  });
}
