import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_laba_1/api/api_error.dart';
import 'package:flutter_laba_1/api/models/track_item.dart';
import 'package:flutter_laba_1/api/api_client.dart';

part "track_state.dart";

class TrackCubit extends Cubit<TrackState> {
  final ApiClient apiClient;

  TrackCubit(this.apiClient): super(TrackState() );

  Future<void> getTracks() async {
    try {
      emit(state.copyWith(status: TrackStatus.loading));
      final track = await apiClient.getTracks();
      emit(state.copyWith(status: TrackStatus.loaded, trackItem: track));
    } on ApiError {
      emit(state.copyWith(
        status: TrackStatus.error,
        message: "Couldn't fetch tracks. Is the device online?"
      ));
    }
  }
  Future<void> sortTrackName() async {
    try{
      emit(state.copyWith(status: TrackStatus.loading));
      final track = await apiClient.getTracks();
      var trackSorted = List<TrackItem>.from(track)..sort((a,b) => a.trackName!.compareTo(b.trackName!));
      emit(state.copyWith(status: TrackStatus.loaded, trackItem: trackSorted));
    } on ApiError {
      emit(state.copyWith(
          status: TrackStatus.error,
          message: "Couldn't fetch tracks. Is the device online?"
      ));
    }
  }

  Future<void> sortAuthorName() async {
    try{
      emit(state.copyWith(status: TrackStatus.loading));
      final track = await apiClient.getTracks();
      var trackSorted = List<TrackItem>.from(track)..sort((a,b) => a.authorName!.compareTo(b.authorName!));
      emit(state.copyWith(status: TrackStatus.loaded, trackItem: trackSorted));
    } on ApiError {
      emit(state.copyWith(
          status: TrackStatus.error,
          message: "Couldn't fetch tracks. Is the device online?"
      ));
    }
  }
}