

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class TrackItem extends Equatable{
  String? albumCover;
  String? trackName;
  String? authorName;
  String? id;
  int? duration;
  String? audioFile;

  TrackItem({
    required this.albumCover,
    required this.trackName,
    required this.authorName,
    required this.id,
    required this.duration,
    required this.audioFile,
  });

  TrackItem.fromJson(Map<String, dynamic> json) {
    albumCover = json['artworkUrlPath'];
    trackName = json['title'];
    authorName = json['artist'];
    id = json['id'];
    duration = json['duration'];
    audioFile = json['audioFileUrlPath'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['artworkUrlPath'] = this.albumCover;
    data['title'] = this.trackName;
    data['artist'] = this.authorName;
    data['id'] = this.id;
    data['duration'] = this.duration;
    data['audioFileUrlPath'] = this.audioFile;
    return data;
  }

  @override
  List<Object?> get props => [id, trackName, audioFile, albumCover, duration, authorName];
}