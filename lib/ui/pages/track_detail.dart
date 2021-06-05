import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laba_1/api/models/track_item.dart';
import 'package:flutter_laba_1/cubit/track_cubit.dart';
import 'package:flutter_laba_1/resources/app_strings.dart';
import 'package:flutter_laba_1/ui/views/track_detail_view.dart';

class TrackDetail extends StatelessWidget{

  final String title;
  final TrackItem trackItem;

  const TrackDetail({
    required Key key,
    required this.title,
    required this.trackItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(AppStrings.trackDetail),
          automaticallyImplyLeading: true
      ),
      body: TrackDetailView(trackItem: trackItem),

    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
