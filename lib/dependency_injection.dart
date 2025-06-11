import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/core/database/api_consumer.dart';
import 'package:untitled1/core/database/dio_consumer.dart';
import 'package:untitled1/core/network/network_info.dart';
import 'package:untitled1/features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:untitled1/features/authentication/data/repositories/repo.dart';
import 'package:untitled1/features/authentication/domain/repositories/auth_repositories.dart';
import 'package:untitled1/features/authentication/domain/use_cases/register_use_case.dart';
import 'package:untitled1/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:untitled1/features/posts/data/datasources/post_local_data_source.dart';
import 'package:untitled1/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:untitled1/features/posts/data/repositories/post_repositories_impl.dart';
import 'package:untitled1/features/posts/domain/repositories/post_repositories.dart';
import 'package:untitled1/features/posts/domain/usecases/add_post.dart';
import 'package:untitled1/features/posts/domain/usecases/delete_post.dart';
import 'package:untitled1/features/posts/domain/usecases/get_all_post.dart';
import 'package:untitled1/features/posts/domain/usecases/update_post.dart';
import 'package:untitled1/features/posts/presentation/bloc/posts_bloc.dart';

import 'features/authentication/data/data_sources/auth_local_data_source.dart';

final sl= GetIt.instance;


 Future<void> init() async{
  sl.registerFactory(()=> PostsBloc(getAllPostsUseCases: sl(), addPostUseCases: sl(), deletePostUseCases: sl(), updatePostUseCases: sl()));

  sl.registerLazySingleton(()=>GetAllPostsUseCases( postRepositories: sl()));
  sl.registerLazySingleton(()=>AddPostUseCases(postRepositories: sl()));
  sl.registerLazySingleton(()=>DeletePostUseCases(postRepositories: sl()));
  sl.registerLazySingleton(()=>UpdatePostUseCases(postRepositories: sl()));
  
  
  sl.registerLazySingleton<PostRepositories>(()=>PostRepositoriesImpl(postRemoteDataSource: sl(), postLocalDataSource: sl(), networkInfo:sl()));

  sl.registerLazySingleton<PostRemoteDataSource>(()=>PostRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<PostLocalDataSource>(()=>PostLocalDataSourceImpl(sharedPreferences: sl()));


  sl.registerLazySingleton<NetworkInfo>(()=>NetworkInfoImpl(internetConnectionChecker: sl()));

 final sharedPreferences= await SharedPreferences.getInstance();
 sl.registerLazySingleton(()=> sharedPreferences);

  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton<ApiConsumer>(()=>DioConsumer(dio: sl()));

 sl.registerLazySingleton(()=>InternetConnectionChecker.createInstance());



 //auth
  sl.registerFactory(()=>AuthBloc(registerUesCase:sl()));
  sl.registerLazySingleton(()=>RegisterUesCase(authRepositories: sl()));
  sl.registerLazySingleton<AuthRepositories>(()=>AuthRepositoriesImpl(authRemoteDataSource: sl(), authLocalDataSource: sl(), networkInfo: sl()));
sl.registerLazySingleton<AuthLocalDataSource>(()=> AuthLocalDataSourceImpl(sharedPreferences: sl()));
sl.registerLazySingleton<AuthRemoteDataSource>(()=>AuthRemoteDataSourceImpl(client: sl()));
 }