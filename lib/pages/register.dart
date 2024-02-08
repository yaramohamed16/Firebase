//register
import 'package:firebase/pages/Home.dart';
import '../cubit/register_cubit/register_cubit.dart';
import 'login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constant.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterCreateSuccessState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.grey[200],
            body: Padding(
              padding: const EdgeInsets.only(top: 120, right: 20, left: 20),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: nameController,
                        decoration: InputDecoration(
                          fillColor: Colors.grey[100],
                          filled: true,
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Name',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: phoneController,
                        decoration: InputDecoration(
                          fillColor: Colors.grey[100],
                          filled: true,
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.phone),
                          labelText: 'Phone',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Phone';
                          }
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                          fillColor: Colors.grey[100],
                          filled: true,
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email_outlined),
                          labelText: 'Email',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Email';
                          }
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        obscureText:
                            BlocProvider.of<RegisterCubit>(context).isPassword,
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                                BlocProvider.of<RegisterCubit>(context).suffix),
                            onPressed: () {
                              BlocProvider.of<RegisterCubit>(context)
                                  .changePasswordVisibility();
                            },
                          ),
                          fillColor: Colors.grey[100],
                          filled: true,
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock_outline),
                          labelText: 'Passward',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Password';
                          }
                        },
                      ),
                      SizedBox(
                        height: 55,
                      ),
                      state is! RegisterLoadingState
                          ? Container(
                              width: double.infinity,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: mainColor,
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    RegisterCubit.get(context).register(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                child: Text(
                                  'REGISTER',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          : Center(child: CircularProgressIndicator()),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account ?'),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ));
                              },
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                  color: mainColor,
                                ),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
