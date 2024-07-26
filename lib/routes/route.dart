import 'package:auto_route/auto_route.dart';
import 'route.gr.dart';


@AutoRouterConfig()
class AppRouter extends $AppRouter{
  @override
  List<AutoRoute>get routes=>[
    AutoRoute(page: LocationWidgetWrapper.page, initial: true),
    AutoRoute(page: Weather.page),
  ];
}