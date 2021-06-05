import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laba_1/api/models/track_item.dart';
import 'package:flutter_laba_1/cubit/track_cubit.dart';
import 'package:flutter_laba_1/resources/app_strings.dart';
import 'package:flutter_laba_1/ui/pages/home_page.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final trackCubit = context.read<TrackCubit>();
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            color: Colors.red,
            height: 55,
            child: DrawerHeader(child: Text(AppStrings.sortBy)),
          ),
          InkWell(
            child: ListTile(
              onTap: () {
                final track = trackCubit.sortTrackName() as List<TrackItem>;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(
                      trackItem: track,
                    ),
                  ),
                );
              },
              leading: Icon(Icons.import_export),
              title: Text(AppStrings.sortTrackName),
            ),
          ),
          InkWell(
            child: ListTile(
              onTap: () {
                final track = trackCubit.sortAuthorName() as List<TrackItem>;
                MaterialPageRoute(
                    builder: (context) => HomePage(
                      trackItem: track,
                    ),
                  );
                Navigator.pop(context);
              },
              leading: Icon(Icons.import_export),
              title: Text(AppStrings.sortAuthor),
            ),
          ),
        ],
      ),
    );
  }

}
