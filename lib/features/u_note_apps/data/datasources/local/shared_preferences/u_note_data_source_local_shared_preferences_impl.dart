import 'package:u_note_apps/features/u_note_apps/data/models/models.dart';
part 'u_note_data_source_local_shared_preferences.dart';

const CACHE_CURRENT_USER = 'CACHED_CURRENT_USER';

class UNoteDataSourceLocalSharedPreferenceImpl
    implements UNoteDataSourceLocalSharedPreference {
  @override
  Future<UNoteAuthenticationModel> saveCurrentUser() {
    throw UnimplementedError();
  }
}
