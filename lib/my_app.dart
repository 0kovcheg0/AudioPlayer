import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laba_1/api/api_client.dart';
import 'package:flutter_laba_1/cubit/track_cubit.dart';
import 'package:flutter_laba_1/resources/app_strings.dart';
import 'package:flutter_laba_1/ui/pages/home_page.dart';



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
            title: '$AppStrings.appTitle',
            theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: BlocProvider(
              create: (BuildContext context) => TrackCubit(ApiClient())..getTracks(),
              child: HomePage(trackItem: [],),
          )
      );

  }
}