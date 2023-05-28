import 'package:deutsch_notebook/Utils/myColors.dart';
import 'package:flutter/material.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //////////////////////////////////////// App Bar ////////////////////////////////////////

      appBar: AppBar(
        backgroundColor: myColors.Yellow,
        title: Text(
          "Deutsch Notebook",
          style: TextStyle(
            color: myColors.Gray
          ),
        ),
      ),

      //////////////////////////////////////// Drawer ////////////////////////////////////////

      drawer: Drawer(
        backgroundColor: myColors.White,
        child: ListView(
          children: [
            ListTile(
              title: Text("Settings"),
              trailing: Icon(Icons.settings, color: myColors.Red,),
              onTap: (){
                print("settings");
              },
            ),
            ListTile(
              title: Text("About Us"),
              trailing: Icon(Icons.info, color: myColors.Red,),
              onTap: (){
                print("info");
              },
            ),
            ListTile(
              title: Text("Help"),
              trailing: Icon(Icons.help, color: myColors.Red,),
              onTap: (){
                print("help");
              },
            )
          ],
        ),
      ),

      //////////////////////////////////////// Background ////////////////////////////////////////

      backgroundColor: myColors.White,

      //////////////////////////////////////// Body ////////////////////////////////////////

      body: Container(
        
      ),

      //////////////////////////////////////// Floating Action Button ////////////////////////////////////////

      floatingActionButton: FloatingActionButton(
        backgroundColor: myColors.Yellow,
        onPressed: (){
          print("add list");
        },
        child: Icon(Icons.add, color: myColors.White,),
      ),

    );
  }
}
