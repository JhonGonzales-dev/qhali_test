import 'package:go_router/go_router.dart';
import 'package:qhali_app/screens/add_edit_user_screen.dart';
import 'package:qhali_app/screens/user_detail_screen.dart';
import 'package:qhali_app/screens/user_list_screen.dart';
import 'fade_transition.dart';

class HomeRoute {
  static const home = 'home';
  static const addUser = 'addUser';
  static const detailUser = 'detailUser';

  static homeBuilder() => GoRoute(
        path: '/home',
        name: home,
        pageBuilder: (context, state) =>
            FadeTransitionPage(child: const UserListScreen()),
      );

  static addUserBuilder() => GoRoute(
        path: '/addUser',
        name: addUser,
        pageBuilder: (context, state) =>
            FadeTransitionPage(child: AddEditUserScreen(state.extra as String)),
      );

  static detailUserBuilder() => GoRoute(
        path: '/detailUser',
        name: detailUser,
        pageBuilder: (context, state) =>
            FadeTransitionPage(child: const UserDetailScreen()),
      );
}
