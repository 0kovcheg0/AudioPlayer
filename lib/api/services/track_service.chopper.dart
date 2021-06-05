// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$TrackService extends TrackService {
  _$TrackService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = TrackService;

  @override
  Future<Response<dynamic>> getAllTracks() {
    final $url =
        'https://api-flutter-audio-player.herokuapp.com/tunes/?_page=1&_limit=20';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
