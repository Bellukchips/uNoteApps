import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:u_note_apps/core/errors/errors.dart';

abstract class IUseCase<Type, Params> {
  Future<Either<Failures, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class Params extends Equatable {
  final int number;
  const Params({
    required this.number,
  });
  @override
  List<Object?> get props => [number];
}
