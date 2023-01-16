import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newsapp/screen/Breaking.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue,
      child: ListView(
        children: [

          DrawerHeader(child: Text('Binod News',)),

          ListTile(
            title: Text('Breaking News'),

            onTap: (){
           Get.to(BreakingNews('Breaking'));

            },


          ),
          ListTile(
            title: Text('Business'),

            onTap: (){
              Get.to(BreakingNews('Business'));

            },


          ),
          ListTile(
            title: Text('Sports'),

            onTap: (){
              Get.to(BreakingNews('Sports'));

            },


          ),
          ListTile(
            title: Text('Technology'),

            onTap: (){
              Get.to(BreakingNews('Technology'));

            },


          )
        ],

        
      )
    );
  }
}
