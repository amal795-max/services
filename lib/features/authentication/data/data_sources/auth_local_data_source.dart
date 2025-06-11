import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/features/authentication/data/model/register_model.dart';

import '../../../../core/errors/exceptions.dart';

abstract class AuthLocalDataSource{
  Future<RegisterModel> getCachedUser();
  Future<Unit> cacheUser(RegisterModel registerModel);
}
class AuthLocalDataSourceImpl implements AuthLocalDataSource{
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cacheUser(RegisterModel registerModel) {
    final jsonString = json.encode(registerModel.toJson());
    sharedPreferences.setString("CacheUser", jsonString);
    return Future.value(unit);

  }
  @override
  Future<RegisterModel> getCachedUser() {
    final jsonString = sharedPreferences.getString("CacheUser");
    if (jsonString != null) {
      final jsonMap = json.decode(jsonString);

      return Future.value(RegisterModel.fromJson(jsonMap));
    } else {
      throw EmptyCacheException();
    }
  }
}