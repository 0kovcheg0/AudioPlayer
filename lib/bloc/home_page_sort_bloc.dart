import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laba_1/api/models/track_item.dart';

class HomePageSortBloc extends BlocBase{
  HomePageSortBloc(state) : super(state);

  final _trackStreamController = StreamController<TrackItem>();

  Stream<TrackItem> get trackStream => _trackStreamController.stream;

  void dispose(){
    _trackStreamController.close();
    super.dispose();
  }
}
