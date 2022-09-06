import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:u_note_apps/core/view/bloc/u_note_bloc.dart';
import 'package:u_note_apps/features/u_note_apps/data/models/models.dart';

import 'u_note_state_test.mocks.dart';

@GenerateMocks([UNoteAuthenticationModel])
void main() {
  group('UNoteEvent', () {
    group('UNoteUserChanged', () {
      final user = MockUNoteAuthenticationModel();
      test('should supports value comparions', () {
        //!arrange

        //!act

        //!assert
        expect(UNoteUserChanged(user), UNoteUserChanged(user));
      });
    });
    group('UNoteLogoutRequest', () {
      test('should support value comparions', () {
        //!arrange

        //!act

        //!assert
        expect(UNoteLogoutRequested(), UNoteLogoutRequested());
      });
    });
  });
}
