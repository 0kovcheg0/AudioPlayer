import 'package:flutter/material.dart';
import 'package:flutter_laba_1/resources/app_strings.dart';

class SideMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
        Container(
          height: 50,
          child: DrawerHeader(
            child: Text(AppStrings.sortBy)
          ),
        ),
          ListTile(
            leading: Icon(Icons.import_export),
            title: Text(AppStrings.sortAuthor),
          ),
          ListTile(
            leading: Icon(Icons.import_export),
            title: Text(AppStrings.sortTrackName),
          ),
      ],
      ),
    );
  }
  

}