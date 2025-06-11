import 'package:dartz/dartz.dart';
import 'package:untitled1/core/constants/user-parameters.dart';
import 'package:untitled1/features/authentication/data/model/register_model.dart';
import 'package:untitled1/features/authentication/domain/repositories/auth_repositories.dart';

import '../../../../core/errors/failures.dart';
import '../entities/user.dart';

class RegisterUesCase {
  final AuthRepositories authRepositories;

  RegisterUesCase({required this.authRepositories});


  Future<Either<Failure,RegisterModel>> call(RegisterParams params) async{
    return await authRepositories.register(params: params);
  }
}