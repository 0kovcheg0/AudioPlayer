import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laba_1/resources/app_strings.dart';
import 'package:flutter_laba_1/ui/pages/home_page.dart';

import 'bloc/home_page_sort_bloc.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(

        create: (BuildContext context) => HomePageSortBloc(state),
        child: MaterialApp(
            title: '$AppStrings.appTitle',
            theme: ThemeData(
            primarySwatch: Colors.red,
          ),
        home: HomePage(title: '$AppStrings.homeTitle'),
      );
    )
  }
}