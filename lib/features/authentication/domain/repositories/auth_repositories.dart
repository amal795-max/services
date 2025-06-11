import 'package:dartz/dartz.dart';
import 'package:untitled1/core/constants/user-parameters.dart';
import 'package:untitled1/core/errors/failures.dart';
import 'package:untitled1/features/authentication/data/model/register_model.dart';

import '../entities/user.dart';

abstract class AuthRepositories{
  Future<Either<Failure,RegisterModel>>register({ required RegisterParams params});
}