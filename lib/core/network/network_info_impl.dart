import 'package:internet_connection_checker/internet_connection_checker.dart';
part 'i_network_info.dart';

class NetworkInfoImpl implements INetworkInfo {
  final InternetConnectionChecker connectionChecker;
  NetworkInfoImpl({
    required this.connectionChecker,
  });
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
