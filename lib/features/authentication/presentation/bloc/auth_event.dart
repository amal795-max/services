part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];}

class RegisterEvent extends AuthEvent{
  final RegisterParams registerParams;

  const RegisterEvent({required this.registerParams});

  @override
  // TODO: implement props
  List<Object?> get props => [registerParams];
}