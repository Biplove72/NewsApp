
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/provider/searchNewsProvider.dart';

import 'package:newsapp/tabbar%20widget.dart';

class FirstPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // // final width = MediaQuery.of(context).size.width;
    // final tabbar =MediaQuery.of(context).padding.top;
    // final appBar=AppBar();
    // //double height1 = appBar.preferredSize.height+ tabbar;
    // final actualHeight=height-tabbar;
    // print(actualHeight);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset:false,

        appBar: AppBar(
          toolbarHeight: 10,


          bottom: TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.red,
              tabs: [
                Tab(
                  text: 'hollywood',
                ),
                Tab(
                  text: 'Gaming',
                ),
              ]),
        )
        ,
        body: Column(
          children: [
            Container(
              height: 260,

              margin: EdgeInsets.only(top: 10),
              child: TabBarView(children: [
               TabBarWidget('hollywood'),
                TabBarWidget('gaming'),
              ]
              ),

            ),
            Expanded(

              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Consumer(
                      builder: (context,ref,child){
                  return TextFormField(
                    onFieldSubmitted:(val){
                       ref.read(searchNewsProvider.notifier).getQuery(val);

                    },

                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)
                        ),
                        hintText: 'search'
                    ),
                  );

                      },
                    ),
                  ),
                  Expanded(
                    child: Container(


                        child:Consumer(
                            builder:(context,ref,child) {
                              final newsData =ref.watch(searchNewsProvider);
                               print(newsData);
                              if(newsData.isEmpty){
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.deepPurpleAccent,
                                  ),
                                );}
                              else {
                                return newsData[0].title=='sorry guys news xoina hoi'?Container(
                                  child: Center(
                                    child: Text('No matches for your search.'),

                                  ),
                                ):ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: newsData.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(left: 10, right: 10),
                                        child: Container(
                                          width: double.infinity,
                                          height: 200,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                  borderRadius: BorderRadius.circular(10),
                                                  child: CachedNetworkImage(
                                                    height: 150,
                                                    width: 120,
                                                    errorWidget:(context,url,error) {
                                                      return Image.asset('assets/images/newslogo.png');

                                                    },
                                                    imageUrl: newsData[index].media ,fit: BoxFit.cover,)),
                                              SizedBox(width:2,),
                                              Expanded(

                                                child: Column(
                                                  children: [
                                                    Text(newsData[index].title),
                                                    SizedBox(width: 2,),
                                                    Text(newsData[index].published_date),
                                                  ],
                                                ),
                                              )

                                            ],
                                          ),

                                        ),
                                      );
                                    }

                                );

                              };
                            }
                        )


                    ),
                  )
                ],



              ),
            )
          ],
        ),





      ),
    );
  }
}
