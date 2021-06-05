import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laba_1/api/models/track_item.dart';
import 'package:flutter_laba_1/cubit/track_cubit.dart';
import 'package:flutter_laba_1/resources/app_strings.dart';
import 'package:flutter_laba_1/ui/pages/side_menu.dart';
import 'package:flutter_laba_1/ui/pages/track_detail.dart';
import 'package:flutter_laba_1/ui/views/track_view.dart';

class HomePage extends StatefulWidget {

  final List<TrackItem> trackItem;
  const HomePage({
    Key? key,
    required this.trackItem}): super(key: key);
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
        ),
    );
  }

  Widget buildTrackList(List<TrackItem> trackItem) {
    return ListView.builder(
      itemCount: trackItem.length,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          height: 50.0,
          color: Colors.white,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrackDetail(
                    trackItem: trackItem[index],
                    title: 'Track Detail',
                    key: UniqueKey(),
                  ),
                ),
              );
            },
            child: Row(
              children: [
                Expanded(
                  child: TrackView(trackItem: trackItem[index]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildButtonLoad(BuildContext context) {
    final trackCubit = context.read<TrackCubit>();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FloatingActionButton(
          child: Text("Load Tracks"),
          onPressed: () {
            trackCubit.getTracks();
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
}
