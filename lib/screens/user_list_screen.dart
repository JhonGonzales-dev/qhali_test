import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qhali_app/controller/user_cubit.dart';
import 'package:qhali_app/routes/home_route.dart';

import '../widgets/custom_loading.dart';
import '../widgets/user_tile.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  void initState() {
    context.read<UserCubit>().getAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final users = context.watch<UserCubit>().users;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Qhali test"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              context.pushNamed(HomeRoute.addUser, extra: "update"),
          child: const Icon(Icons.add),
        ),
        body: users.isEmpty
            ? const CustomCircularLoading()
            : ListView(
                padding: const EdgeInsets.all(20),
                children: List.generate(users.length, (index) {
                  final user = users[index];
                  return UserListTile(user);
                }),
              ));
  }
}
