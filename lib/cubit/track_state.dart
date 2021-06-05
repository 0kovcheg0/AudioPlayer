part of 'track_cubit.dart';

enum TrackStatus{
  initial,
  loading,
  loaded,
  error,
}

@immutable
class TrackState extends Equatable {

  final List<TrackItem>? trackItem;
  final String message;
  final TrackStatus status;

  TrackState({
    this.trackItem,
    this.message = "Error was raised!",
    this.status = TrackStatus.initial,
  });

  TrackState copyWith({
    List<TrackItem>? trackItem,
    String? message,
    TrackStatus? status,
}) {
    return TrackState(
      trackItem: trackItem ?? this.trackItem,
      message: message ?? this.message,
      status: status ?? this.status,
    );
}

  @override
  List<Object?> get props => [trackItem, message, status];

}