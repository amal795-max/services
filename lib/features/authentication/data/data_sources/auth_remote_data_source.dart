import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled1/core/constants/user-parameters.dart';
import 'package:untitled1/features/authentication/data/model/register_model.dart';
import 'package:untitled1/features/authentication/domain/entities/user.dart';

import '../../../../core/errors/exceptions.dart';

abstract class AuthRemoteDataSource{
  Future<RegisterModel> register(RegisterParams postModel);


}
const BASE_URL="http://192.168.1.103:8000/api/auth/register";

 class  AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
   final http.Client client;

   AuthRemoteDataSourceImpl({required this.client});
   @override

  Future<RegisterModel> register(RegisterParams params) async {
     final body = {
       "name": params.name,
       "email": params.email,
       "password": params.password,
       "password_confirmation": params.password_confirmation,
       "role": params.role,
     };
    
     final response = await client.post(Uri.parse(BASE_URL), headers: {"Content-Type": "application/json"},
         body: json.encode(body)
    );
    

    if (response.statusCode == 201) {
      final decodedJson = json.decode(response.body);
      print(decodedJson);
      RegisterModel registerModel = RegisterModel.fromJson(decodedJson);
      return registerModel;
    } else {
      print("Error ${response.statusCode}: ${response.body}");
      throw ServerException();
    }
  }

 }