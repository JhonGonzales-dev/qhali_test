import 'package:go_router/go_router.dart';
import 'package:qhali_app/routes/home_route.dart';

class AppRoute {
  static final _router = GoRouter(initialLocation: '/home', routes: [
    HomeRoute.homeBuilder(),
    HomeRoute.addUserBuilder(),
    HomeRoute.detailUserBuilder()
  ]);
  static GoRouter get router => _router;
}
