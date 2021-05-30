import 'package:flutter/foundation.dart';

class TrackItem {
  final String? albumCover;
  final String? trackName;
  final String? authorName;
  final String? albumName;

  const TrackItem({
    required this.albumCover,
    required this.trackName,
    required this.authorName,
    required this.albumName,
  }) : assert(albumCover != null),
        assert(trackName != null),
        assert(authorName != null),
        assert(albumName != null);
}