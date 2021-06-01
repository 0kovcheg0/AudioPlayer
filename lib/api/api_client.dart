import 'dart:collection';
import 'dart:io';
import 'dart:math';

import 'package:chopper/chopper.dart';
import 'package:flutter_laba_1/api/api_error.dart';
import 'package:flutter_laba_1/api/models/track_item.dart';
import 'package:flutter_laba_1/api/services/track_service.dart';
import 'package:flutter_laba_1/resources/app_strings.dart';

class ApiClient {
  static final ChopperClient _chopperClient = ChopperClient(
    baseUrl: AppStrings.baseUrl,
    services: [
      TrackService.create(),
    ],
    converter: JsonConverter(),
  );

  static final trackService = _chopperClient.getService<TrackService>();

  Future<List<TrackItem>> getTracks() async {
    final rawTracks = (await _makeCheckedCall(() => trackService.getAllTracks()))
        .body as List<dynamic>;
    final tracks = rawTracks.map((rawTrack) => TrackItem.fromJson(rawTrack)).toList();

    return tracks;
  }

  Future<Response> _makeCheckedCall(Future<Response> Function() call) async {
    try {
      final response = await call();

      if (response.statusCode >= 400) {
        throw ApiError(
            statusCode: response.statusCode,
            message: response.error.toString()
        );
      }

      return response;
    } on ApiError catch (ex) {
      throw ex;
    }
  }
}