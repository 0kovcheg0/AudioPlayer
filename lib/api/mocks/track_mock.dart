import 'package:flutter_laba_1/api/models/track_item.dart';
import 'package:flutter_laba_1/resources/app_image_assets.dart';
import 'package:flutter_laba_1/resources/app_strings.dart';

class TrackMock{

  Future<List<TrackItem>> fetchTrackItems() async {
    await Future.delayed(Duration(seconds: 1));
    return[
    TrackItem(
        albumCover: AppImageAssets.mobbDeep,
        trackName: "Survival Of The Fittest",
        authorName: AppStrings.mobbDeep,
        albumName: AppStrings.album
    ),
    TrackItem(
        albumCover: AppImageAssets.mobbDeep,
        trackName: AppStrings.trackShookOnes,
        authorName: AppStrings.mobbDeep,
        albumName: AppStrings.album
    ),
    TrackItem(
        albumCover: AppImageAssets.mobbDeep,
        trackName: "Trife Life",
        authorName: AppStrings.mobbDeep,
        albumName: AppStrings.album
    ),
    TrackItem(
        albumCover: AppImageAssets.hellOnEarth,
        trackName: "Hell On Earth",
        authorName: AppStrings.mobbDeep,
        albumName: "Hell on Earth"
    ),
    TrackItem(
        albumCover: AppImageAssets.longLiveAsap,
        trackName: "1Train",
        authorName: "ASAP Rocky",
        albumName: "LONG.LIVE.ASAP"
    )
  ];
  }
}