import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TheDrawer extends StatefulWidget {
  @override
  _TheDrawerState createState() => _TheDrawerState();
}

class _TheDrawerState extends State<TheDrawer> {
  // File _image;

  // Future getImage() {
  //   final image = await ImagePicker.pickImage(source: ImageSource.camera);
  //   setState(() {
  //     _image = image;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Center(
            child: UserAccountsDrawerHeader(
              accountName: Text("Wongani Kaunda"),
              accountEmail: Text("wonganikaunda2@gmail.com"),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/fixed.jpg")),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Wongani Kaunda"),
            subtitle: Text("Accountant, Economist, Programmer"),
            trailing: Icon(Icons.edit),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text("Email"),
            subtitle: Text("wonganikaunda2@gmail.com"),
            trailing: Icon(Icons.edit),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

//child: _image == null ? Text("image is not loaded") : image.field(_image)

//onPressed: getImage,
