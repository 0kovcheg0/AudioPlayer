import 'package:flutter/material.dart';
import 'package:flutter_laba_1/api/models/track_item.dart';

class TrackDetailView extends StatelessWidget {
  final TrackItem trackItem;

  const TrackDetailView({
    Key? key,
    required this.trackItem,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        child: Expanded(
          child: Column(
            children: [
              SizedBox(width: 400),
              Hero(
                tag: 'Hero',
                child: Image.network(
                  trackItem.albumCover.toString(),
                  height: 300.0,
                  width: 300.0,
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.center,
                ),
              ),
              Text(
                "Author: " +
                    trackItem.authorName! +
                    "\n" +
                    "Song: " +
                    trackItem.trackName! +
                    "\n" +
                    Duration(milliseconds: trackItem.duration!).toString(),
                style: TextStyle(fontSize: 20, height: 2.0),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
