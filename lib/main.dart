import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/core/theme/apptheme.dart';
import 'package:untitled1/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:untitled1/features/authentication/presentation/pages/register.dart';
import 'package:untitled1/test.dart';
import 'features/posts/presentation/bloc/posts_bloc.dart';
import 'dependency_injection.dart'as di;
import 'firebase_options.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // final _firebaseMessaging = FirebaseMessaging.instance;
  // await _firebaseMessaging.requestPermission();
  // String? deviceToken = await _firebaseMessaging.getToken();
  // print("===================Device FirebaseMessaging Token====================");
  // print(deviceToken);

  await di.init();
 runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return  MultiBlocProvider(
      providers: [
      BlocProvider(create: (_)=>di.sl<PostsBloc>()..add(GetAllPostsEvent())),
      BlocProvider(create: (_)=> di.sl<AuthBloc>())
      ],
      child:  MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: appTheme,
      home: Register()
    ));
  }


}
