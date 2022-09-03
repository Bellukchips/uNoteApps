part of 'u_note_data_source_local_shared_preferences_impl.dart';

abstract class UNoteDataSourceLocalSharedPreference {
  Future<UNoteAuthenticationModel> saveCurrentUser();
}
