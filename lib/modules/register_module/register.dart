//register
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_module/Home.dart';
import '../../cubit/register_cubit/register_cubit.dart';
import '../login_module/login.dart';
import '../../shared/constants/constant.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.only(top: 100, right: 20, left: 20),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Material(
                          elevation: 6, // Adjust the elevation value as needed
                          shape: const CircleBorder(),
                          clipBehavior: Clip.antiAlias,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.transparent,
                            child: ClipOval(
                              child: Image.asset(
                                'assets/2.png',
                                fit: BoxFit.cover,
                                width: 100,
                                height: 100,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: nameController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          prefixIcon: const Icon(Icons.person),
                          labelText: 'Name',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 16),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: phoneController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          prefixIcon: const Icon(Icons.phone),
                          labelText: 'Phone',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 16),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Phone';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          prefixIcon: const Icon(Icons.email_outlined),
                          labelText: 'Email',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 16),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 25,
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
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          prefixIcon: const Icon(Icons.lock_outline),
                          labelText: 'Password',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 16),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        obscureText: BlocProvider.of<RegisterCubit>(context)
                            .isConfirmPassword,
                        keyboardType: TextInputType.visiblePassword,
                        controller: confirmPasswordController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(BlocProvider.of<RegisterCubit>(context)
                                .confirmSuffix),
                            onPressed: () {
                              BlocProvider.of<RegisterCubit>(context)
                                  .changeConfirmPasswordVisibility();
                            },
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          prefixIcon: const Icon(Icons.password_outlined),
                          labelText: 'Confirm Password',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 16),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Confirm Password';
                          } else if (value != passwordController.text) {
                            return 'The Confirm Password is not Equal the Password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 35,
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
                                child: const Text(
                                  'REGISTER',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          : const Center(child: CircularProgressIndicator()),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an account ?'),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
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
