part of 'network_info_impl.dart';

abstract class INetworkInfo {
  Future<bool> get isConnected;
}
