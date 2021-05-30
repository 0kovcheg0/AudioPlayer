import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_laba_1/api/mocks/track_mock.dart';
import 'package:flutter_laba_1/api/models/track_item.dart';
import 'package:flutter_laba_1/resources/app_strings.dart';
import 'package:flutter_laba_1/ui/pages/side_menu.dart';
import 'package:flutter_laba_1/ui/pages/track_detail.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        title: Text(AppStrings.homeTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: TrackMock.trackItems.map(_buildTrackList).toList()),
      ),
    );
  }

  Widget _buildTrackList(TrackItem item) {
    return Container(
        width: double.infinity,
        height: 50.0,
        color: Colors.white,
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TrackDetail(
                            item: item,
                            title: '',
                          )));
            },
            child: Row(
              children: [
                Expanded(
                    child: _buildTrackItem(
                        item.trackName, item.authorName, item.albumCover))
              ],
            )));
  }

  Widget _buildTrackItem(
      String trackName, String authorName, String albumCover) {
    return Row(
      children: [
        Hero(
            tag: 'imageHero',
            child: Image.asset(albumCover, height: 50.0, fit: BoxFit.cover)),
        Text(authorName + " - " + trackName, style: TextStyle(fontSize: 15)),
      ],
    );
  }
}
