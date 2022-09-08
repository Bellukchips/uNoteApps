part of 'authentication_cubit.dart';

class AuthenticationState extends Equatable {
  final FormzStatus status;
  final String errorMessage;
  const AuthenticationState({
    this.status = FormzStatus.pure,
    this.errorMessage = "Loading",
  });

  @override
  List<Object> get props => [status, errorMessage];

  AuthenticationState copyWith({
    FormzStatus? status,
    String? errorMessage,
  }) {
    return AuthenticationState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
