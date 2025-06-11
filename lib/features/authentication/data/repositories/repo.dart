
import 'package:dartz/dartz.dart';
import 'package:untitled1/core/constants/user-parameters.dart';
import 'package:untitled1/core/errors/failures.dart';
import 'package:untitled1/features/authentication/data/data_sources/auth_local_data_source.dart';
import 'package:untitled1/features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:untitled1/features/authentication/data/model/register_model.dart';
import 'package:untitled1/features/authentication/domain/entities/user.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/auth_repositories.dart';

class AuthRepositoriesImpl implements AuthRepositories{
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoriesImpl({required this.authRemoteDataSource, required this.authLocalDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, RegisterModel>> register({required RegisterParams params}) async{
   if(await networkInfo.isConnected){
     final RegisterParams registerParams=RegisterParams(params.name, params.email,
         params.password, params.password_confirmation, params.role);

     try{
       final remoteRegister = await authRemoteDataSource.register(registerParams);
       authLocalDataSource.cacheUser( remoteRegister);
      return Right(remoteRegister);

     }on ServerException{
       return Left(ServerFailure());
     }
   }
   else {
       return Left(OfflineFailure());
   }}}
