part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];}

final class AuthInitial extends AuthState {}
final class RegisterSuccess extends AuthState {
  final String message;

  const RegisterSuccess({required this.message});
}
final class RegisterFailure extends AuthState {
  final String message;
  const RegisterFailure({required this.message});

}
final class RegisterLoading extends AuthState {}
