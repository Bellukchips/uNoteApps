import 'package:equatable/equatable.dart';

class Failures extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ServerFailures extends Failures {}

class CacheFailures extends Failures {}
