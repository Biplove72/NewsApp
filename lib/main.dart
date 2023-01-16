import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
//import 'package:newsapp/screen/firstPage.dart';
import 'package:newsapp/splashScreen.dart';

void main(){


runApp(ProviderScope(child: Home()));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home:SplashScreen(),
      debugShowCheckedModeBanner: false,
    );

  }
}

