import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_flutter/bloc/location/location_bloc.dart';
import 'package:project_flutter/home.dart';
import 'package:project_flutter/weather.dart';
import 'routes/route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter=AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
      // home: BlocProvider(
      //   create: (context) => LocationBloc(),
      //   child: LocationWidget(),
      // ),
      themeMode: ThemeMode.dark,
      // initialRoute: '/',
      // routes: {
      //   '/': (context)=> const LocationWidget(),
      //   '/info': (context)=> Weather(),
      // }
    );
  }
}
