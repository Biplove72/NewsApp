

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newsapp/screen/firstPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>FirstPage()));
      
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(

      child: Center(child: Image.asset("assets/images/newslogo.png")
      
      ),
    ));
  }
}
