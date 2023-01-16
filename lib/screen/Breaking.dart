import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/newsProvider.dart';



class BreakingNews extends StatelessWidget {

  String query;
 BreakingNews( this.query);


  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder:(context,ref,child) {
          final newsData =ref.watch(newsProvider(query));
         return ListView.builder(
           scrollDirection: Axis.vertical,
              itemCount:newsData.length,
              itemBuilder: (context, index) {


                return SafeArea(
                  
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(

                          child: Container(
                            height: 250,
                            color:Colors.blue,
                       child: Container(child: Image.network(newsData[index].media,fit:BoxFit.cover,)),

                          ),
                        )

                      ],
                    ),
                  ),
                );

              }
          );}
    );
  }
}
