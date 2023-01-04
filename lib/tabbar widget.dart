
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/provider/newsProvider.dart';


class TabBarWidget extends StatelessWidget {
  final String query;
  const TabBarWidget(this.query) ;

  @override
  Widget build(BuildContext context) {
    return  Consumer(
      builder:(context,ref,child) {
        final newsData =ref.watch(newsProvider(query));
        //print(newsData);
        if(newsData.isEmpty){
        return Center(
          child: CircularProgressIndicator(
            color: Colors.deepPurpleAccent,
          ),
        );}
        else {
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: newsData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  width: 200,
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 150,
                          child: CachedNetworkImage(
                            errorWidget:(context,url,error) {
                              return Image.asset('assets/images/newslogo.png');

                            },
                            imageUrl: newsData[index].media ,fit: BoxFit.cover,))),
                      SizedBox(height: 5,),
                      Text(newsData[index].title),
                      SizedBox(height: 5,),
                      Text(newsData[index].published_date),
              ],
                  ),

                ),
              );
            }

        );

        };
      }
    );


  }
}
