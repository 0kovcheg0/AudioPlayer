import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_laba_1/api/mocks/track_mock.dart';
import 'package:flutter_laba_1/api/models/track_item.dart';

class trackItemsRepository {
  final TrackMock trackMock;
  UnmodifiableListView<TrackItem> _trackItems;

  trackItemsRepository({required this.trackMock}) : assert(trackMock != null);

  Future<UnmodifiableListView<TrackItem>> fetch() async {
    if( _trackItems == null) {
      _trackItems = UnmodifialbeListView(await trackMock.fetchTrackItems());
    }
    return _trackItems;
  }
}