import 'package:routefly/routefly.dart';

import 'app/(public)/category_page.dart' as a0;
import 'app/(public)/home_page.dart' as a1;
import 'app/(public)/login_page.dart' as a2;
import 'app/(public)/logo_page.dart' as a3;

List<RouteEntity> get routes => [
  RouteEntity(
    key: '/category',
    uri: Uri.parse('/category'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a0.CategoryPage(),
    ),
  ),
  RouteEntity(
    key: '/home',
    uri: Uri.parse('/home'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a1.HomePage(),
    ),
  ),
  RouteEntity(
    key: '/login',
    uri: Uri.parse('/login'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a2.LoginPage(),
    ),
  ),
  RouteEntity(
    key: '/logo',
    uri: Uri.parse('/logo'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a3.LogoPage(),
    ),
  ),
];

const routePaths = (
  path: '/',
  category: '/category',
  home: '/home',
  login: '/login',
  logo: '/logo',
);
