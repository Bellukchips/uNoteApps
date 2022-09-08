import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:u_note_apps/features/u_note_apps/data/models/authentication/u_note_authentication_model.dart';
import 'package:u_note_apps/features/u_note_apps/data/repository/authentication/u_note_authentication_repository_impl.dart';
import 'u_note_bloc_test.mocks.dart';

@GenerateMocks([UNoteAuthenticationRepositoryImpl])
@GenerateMocks([UNoteAuthenticationModel])
void main() {
  final user = MockUNoteAuthenticationModel();
  late UNoteAuthenticationRepositoryImpl repositories;

  setUp(() {
    repositories = MockUNoteAuthenticationRepositoryImpl();
    when(repositories.user).thenAnswer((_) => const Stream.empty());
    when(repositories.currentUser).thenReturn(UNoteAuthenticationModel.empty);
  });

  // test('should initial state is unauthenticated when user is empty', () {
  //   //!arrange

  //   //!act

  //   //!assert
  // });
}
