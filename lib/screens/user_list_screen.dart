import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:qhali_app/routes/home_route.dart';
import 'package:qhali_app/services/user_service.dart';
import '../controller/user_controller.dart';
import '../widgets/custom_loading.dart';
import '../widgets/user_tile.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final userController = Get.put(UserController(GetIt.instance<UserService>()));

  @override
  void initState() {
    userController.getAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final users = userController.users;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Qhali test"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              context.pushNamed(HomeRoute.addUser, extra: "update"),
          child: const Icon(Icons.add),
        ),
        body: Obx(() => users.isEmpty
            ? const CustomCircularLoading()
            : ListView(
                padding: const EdgeInsets.all(20),
                children: List.generate(users.length, (index) {
                  final user = users[index];
                  return UserListTile(user);
                }),
              )));
  }
}
