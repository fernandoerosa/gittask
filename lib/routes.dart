import 'package:routefly/routefly.dart';

import 'app/(modules)/home/home_page.dart' as a2;
import 'app/(modules)/splash_page.dart' as a3;
import 'app/(modules)/task/details/[id]_page.dart' as a1;
import 'app/(modules)/task/task_page.dart' as a0;

List<RouteEntity> get routes => [
  RouteEntity(
    key: '/task',
    uri: Uri.parse('/task'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a0.TaskPage(),
    ),
  ),
  RouteEntity(
    key: '/task/details/[id]',
    uri: Uri.parse('/task/details/[id]'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a1.TaskDetailsPage(),
    ),
  ),
  RouteEntity(
    key: '/home',
    uri: Uri.parse('/home'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a2.HomePage(),
    ),
  ),
  RouteEntity(
    key: '/splash',
    uri: Uri.parse('/splash'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a3.SplashPage(),
    ),
  ),
];

const routePaths = (
  path: '/',
  task: (
    path: '/task',
    details: (
      path: '/task/details',
      $id: '/task/details/[id]',
    ),
  ),
  home: '/home',
  splash: '/splash',
);
