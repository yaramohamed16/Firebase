import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
body:SafeArea(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('have an account ',style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold,),),
  
    ],
  ),
)
    );
  }
}
