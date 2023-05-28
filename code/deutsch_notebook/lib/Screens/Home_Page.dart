import 'package:deutsch_notebook/Utils/myColors.dart';
import 'package:deutsch_notebook/Database/Notebook_Database.dart';
import 'package:flutter/material.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {

  final TextEditingController _notebookName = TextEditingController();
  String? valueText;
  String? codeDialog;

  //////////////////////////////////////// Dialog ////////////////////////////////////////

  Future<void> _inputDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Notebook Name"
          ),
          content: TextField(
            onChanged: (value){
              setState(() {
                valueText = value;
              });
            },
            controller: _notebookName,
            decoration: InputDecoration(),
          ),
          actions: <Widget>[
            MaterialButton(
              color: myColors.White,
              textColor: myColors.Gray,
              child: Text("Cancel"),
              onPressed: (){
                setState(() {
                  Navigator.pop(context);
                });
              },
            ),

            MaterialButton(
              color: myColors.Yellow,
              textColor: myColors.Gray,
              child: Text("Add"),
              onPressed: (){
                setState(() {
                  codeDialog = valueText;

                  Navigator.pop(context);
                  print(valueText);
                });
              },
            )
          ],
        );
      }
    );
  }

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
          _inputDialog(context);
        },
        child: Icon(Icons.add, color: myColors.White,),
      ),

    );
  }
}
