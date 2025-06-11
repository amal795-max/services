import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/core/constants/snackBar_message.dart';
import 'package:untitled1/core/constants/user-parameters.dart';
import 'package:untitled1/features/authentication/presentation/bloc/auth_bloc.dart';

import '../../../../core/constants/loading_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  void _registerUser() {
    if (_formKey.currentState!.validate()) {
      final RegisterParams registerParams = RegisterParams(_nameController.text, _emailController.text,
         "111111111",  "111111111", "Client");
      

      BlocProvider.of<AuthBloc>(context).add(RegisterEvent(registerParams:registerParams ));

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Register')),
    body:
    BlocConsumer<AuthBloc, AuthState>(
      listenWhen: _listenWhen,
      listener: _listener,
      buildWhen: _buildWhen,
      builder:_builder
));
  }



  Widget _builder(BuildContext context, AuthState state) {
      if (state is RegisterLoading) {
        return LoadingWidget();
      }  return  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value!.isEmpty ? 'Enter a valid name' : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value!.isEmpty ? 'Enter a valid email' : null,
              ),


              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _registerUser,
                child: const Text('Register'),
              ),
            ],
          ),
        ),

      );

  }
}

bool _listenWhen(previous,current) {
  return current is RegisterSuccess || current is RegisterFailure;
}

_listener(BuildContext context ,state){
  if(state is RegisterSuccess){
    SnackBarMessage().showSuccessSnackBar(message: state.message, context: context);
  }  if(state is RegisterFailure){
    SnackBarMessage().showErrorSnackBar(message: state.message, context: context);
  }
}

bool _buildWhen(previous,current) {
  return current is RegisterLoading;
}