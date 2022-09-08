import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:u_note_apps/core/enum/app_state.dart';
import 'package:u_note_apps/core/view/bloc/u_note_bloc.dart';
import 'package:u_note_apps/features/u_note_apps/data/models/authentication/u_note_authentication_model.dart';
import 'u_note_state_test.mocks.dart';

@GenerateMocks([UNoteAuthenticationModel])
void main() {
  group('UNoteState', () {
    group('authenticated', () {
      test('should has correct status', () {
        //!arrange
        final state = UNoteState.unauthenticated();
        //!act

        //!assert
        expect(state.appStatus, AppStatus.unauthenticated);
        expect(state.uNoteAuthenticationModel, UNoteAuthenticationModel.empty);
      });
    });

    group('unauthenticated', () {
      test('should has correct status', () {
        //!arrange
        final user = MockUNoteAuthenticationModel();
        final state = UNoteState.authenticated(user);
        //!act

        //!assert
        expect(state.appStatus, AppStatus.authenticated);
        expect(state.uNoteAuthenticationModel, user);
      });
    });
  });
}
