// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i5;
import 'package:project_flutter/home.dart' as _i1;
import 'package:project_flutter/model/location.dart' as _i4;
import 'package:project_flutter/weather.dart' as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    LocationWidgetWrapper.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LocationWidgetWrapper(),
      );
    },
    Weather.name: (routeData) {
      final args = routeData.argsAs<WeatherArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.Weather(
          args.list,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.LocationWidgetWrapper]
class LocationWidgetWrapper extends _i3.PageRouteInfo<void> {
  const LocationWidgetWrapper({List<_i3.PageRouteInfo>? children})
      : super(
          LocationWidgetWrapper.name,
          initialChildren: children,
        );

  static const String name = 'LocationWidgetWrapper';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.Weather]
class Weather extends _i3.PageRouteInfo<WeatherArgs> {
  Weather({
    required _i4.Location list,
    _i5.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          Weather.name,
          args: WeatherArgs(
            list: list,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'Weather';

  static const _i3.PageInfo<WeatherArgs> page = _i3.PageInfo<WeatherArgs>(name);
}

class WeatherArgs {
  const WeatherArgs({
    required this.list,
    this.key,
  });

  final _i4.Location list;

  final _i5.Key? key;

  @override
  String toString() {
    return 'WeatherArgs{list: $list, key: $key}';
  }
}
