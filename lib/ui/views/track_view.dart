import 'package:flutter/material.dart';
import 'package:flutter_laba_1/api/models/track_item.dart';

class TrackView extends StatelessWidget {
  final TrackItem trackItem;

  const TrackView({
    Key? key,
    required this.trackItem,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        child: Expanded(
          child: Row(
            children: [
              Hero(
                tag: 'Hero',
                child: Image.network(trackItem.albumCover.toString(),
                    height: 50.0, width: 50, fit: BoxFit.fitWidth),
              ),
              Text(trackItem.authorName! + " - " + trackItem.trackName!,
                  style: TextStyle(fontSize: 15)),
            ],
          ),
        ),
      ),
    );
  }
}
