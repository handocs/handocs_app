import 'package:routefly/routefly.dart';

import 'app/(public)/category_edit_page.dart' as a0;
import 'app/(public)/category_page.dart' as a1;
import 'app/(public)/home_page.dart' as a2;
import 'app/(public)/lab_page.dart' as a3;
import 'app/(public)/login_page.dart' as a4;
import 'app/(public)/logo_page.dart' as a5;
import 'app/(public)/register_page.dart' as a6;

List<RouteEntity> get routes => [
  RouteEntity(
    key: '/category_edit',
    uri: Uri.parse('/category_edit'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a0.CategoryEditPage(),
    ),
  ),
  RouteEntity(
    key: '/category',
    uri: Uri.parse('/category'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a1.CategoryPage(),
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
    key: '/lab',
    uri: Uri.parse('/lab'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a3.LabPage(),
    ),
  ),
  RouteEntity(
    key: '/login',
    uri: Uri.parse('/login'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a4.LoginPage(),
    ),
  ),
  RouteEntity(
    key: '/logo',
    uri: Uri.parse('/logo'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a5.LogoPage(),
    ),
  ),
  RouteEntity(
    key: '/register',
    uri: Uri.parse('/register'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a6.RegisterPage(),
    ),
  ),
];

const routePaths = (
  path: '/',
  categoryEdit: '/category_edit',
  category: '/category',
  home: '/home',
  lab: '/lab',
  login: '/login',
  logo: '/logo',
  register: '/register',
);
