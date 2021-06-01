import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laba_1/api/models/track_item.dart';
import 'package:flutter_laba_1/cubit/track_cubit.dart';
import 'package:flutter_laba_1/resources/app_strings.dart';
import 'package:flutter_laba_1/ui/pages/side_menu.dart';
import 'package:flutter_laba_1/ui/pages/track_detail.dart';

class HomePage extends StatefulWidget {
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
        body: BlocConsumer<TrackCubit, TrackState>(
          listener: (context, state) {
            if (state.status == TrackStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          builder: (context, state) {
            switch (state.status) {
              case TrackStatus.loading:
                return buildLoading();

              case TrackStatus.initial:
                return buildButtonLoad(context);
              case TrackStatus.loaded:
                final track = state.trackItem;
                if (track != null) {
                  return buildTrackList(track);
                } else {
                  return Text("Track not found");
                }
              default:
                return buildLoading();
            }
          },
        ));
  }

  Widget buildTrackList(TrackItem trackItem) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          width: double.infinity,
          height: 50.0,
          color: Colors.white,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrackDetail(
                    trackItem: trackItem,
                    title: '', key: ,
                  ),
                ),
              );
            },
            child: Row(
              children: [Expanded(child: _buildTrackItem(trackItem))],
            ),
          ),
        ),
      ],
    ));
  }

  Widget _buildTrackItem(TrackItem trackItem) {
    return Container(
      child: Row(
        children: [
          Hero(
              tag: 'imageHero',
              child: Image.asset(trackItem.albumCover.toString(),
                  height: 50.0, fit: BoxFit.cover)),
          Text(trackItem.authorName! + " - " + trackItem.trackName!,
              style: TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}

Widget buildButtonLoad(BuildContext context) {
  final trackCubit = context.read<TrackCubit>();
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      FloatingActionButton(
        child: Text("Load Tracks"),
        onPressed: () {
          trackCubit.getTrackItem();
        },
      ),
    ],
  );
}

Widget buildLoading() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

//TODO KAK ПОМЕСТИТЬ ФУНКЦИЮ В БИЛД
void submitTrackItem(BuildContext context) {
  final trackCubit = context.read<TrackCubit>();
  trackCubit.getTrackItem();
}
