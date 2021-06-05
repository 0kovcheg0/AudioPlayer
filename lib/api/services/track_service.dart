import 'package:chopper/chopper.dart';
import 'package:flutter_laba_1/resources/app_strings.dart';

part 'track_service.chopper.dart';

@ChopperApi(baseUrl: AppStrings.baseUrl)
abstract class TrackService extends ChopperService{
  static TrackService create([ChopperClient? client]) => _$TrackService(client);

  @Get(path: AppStrings.urlForList)
  Future<Response> getAllTracks();

}