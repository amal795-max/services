import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled1/core/constants/failure_success_message.dart';
import 'package:untitled1/core/constants/user-parameters.dart';
import 'package:untitled1/features/authentication/domain/use_cases/register_use_case.dart';

import '../../../../core/errors/failures.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUesCase registerUesCase;


  AuthBloc({required this.registerUesCase}) : super(AuthInitial()) {

    on<AuthEvent>((event, emit) async {
      if(event is RegisterEvent){
        emit(RegisterLoading());
        final registerUser=await registerUesCase(event.registerParams);
        registerUser.fold(
          (failure)=>emit( RegisterFailure(message:mapFailureToMessage(failure))),
            (success)=>emit((RegisterSuccess(message: REGISTER_SUCCESS_MESSAGE))));

      }
    });
  }
  String mapFailureToMessage(Failure failure){
    switch(failure.runtimeType){
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
        case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;

      default :
        return "UnExpected Error . Please try again later";

    }
  }
}
