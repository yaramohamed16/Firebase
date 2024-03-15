//register cubit

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user_model/UserData.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void register({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      create(name: name, phone: phone, email: email, uId: value.user!.uid);
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
    });
  }

  // RegisterCubit
  void create({
    required String name,
    required String phone,
    required String email,
    required String uId,
  }) {
    UserData userData = UserData(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
    );
    FirebaseFirestore.instance
        .collection("users")
        .doc(uId)
        .set(userData.toMap())
        .then((value) {
      emit(RegisterCreateSuccessState()); // Pass the loginModel here
    }).catchError((error) {
      emit(RegisterCreateErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(RegisterChangeVisibilityState());
  }

  bool isConfirmPassword = true;
  IconData confirmSuffix = Icons.visibility_off_outlined;

  void changeConfirmPasswordVisibility() {
    isConfirmPassword = !isConfirmPassword;
    confirmSuffix = isConfirmPassword
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(RegisterConfirmChangeVisibilityState());
  }
}
