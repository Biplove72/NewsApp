import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/screen/firstPage.dart';

void main(){


runApp(ProviderScope(child: Home()));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:FirstPage(),
      debugShowCheckedModeBanner: false,
    );

  }
}

