import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_laba_1/api/models/track_item.dart';
import 'package:flutter_laba_1/resources/app_image_assets.dart';
import 'package:flutter_laba_1/resources/app_strings.dart';

class TrackDetail extends StatefulWidget{

  TrackDetail({Key? key, required this.title, required this.item}) : super(key: key);

  final String title;
  final TrackItem item;

  @override
  _TrackDetailState createState() => _TrackDetailState();

}

class _TrackDetailState extends State<TrackDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.trackDetail),
          automaticallyImplyLeading: true
      ),
      body:
      Column(
        children: [
          SizedBox(width: 400),
          Expanded(child: _buildTrackItem(widget.item.trackName, widget.item.authorName, widget.item.albumName, widget.item.albumCover))
        ],
      ),
    );
  }
  Widget _buildTrackItem(String trackName, String authorName, String albumName, albumCover){
    return Column(
      children: [Hero(tag: 'imageHero', child: Image.asset(
        albumCover,
        height: 300.0,
        fit: BoxFit.cover,
        alignment: Alignment.center,)),
        Text(
            "Author: " + authorName + "\n" + "Song: "+ trackName + "\n" + "Album: " + albumName,
            style: TextStyle(fontSize: 20, height: 2.0 ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
