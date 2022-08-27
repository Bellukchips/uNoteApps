import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:u_note_apps/core/network/network_info_impl.dart';
import 'package:mockito/mockito.dart';
//mocks
import 'network_info_test.mocks.dart';

@GenerateMocks([InternetConnectionChecker])
void main() {
  late NetworkInfoImpl network;
  late InternetConnectionChecker mockInternetChecker;

  setUp(() {
    mockInternetChecker = MockInternetConnectionChecker();
    network = NetworkInfoImpl(connectionChecker: mockInternetChecker);
  });

  group('isConnected', () {
    test('should test [InternetConnectionChecker] has internet or not',
        () async {
      //!arrange
      final tHasConnection = Future.value(true);
      when(mockInternetChecker.hasConnection).thenAnswer((_) => tHasConnection);
      //!act
      final result = network.isConnected;
      //!assert
      verify(mockInternetChecker.hasConnection);
      expect(result, tHasConnection);
    });
  });
}
