import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qhali_app/controller/user_cubit.dart';
import 'package:qhali_app/models/user.dart';

import '../routes/home_route.dart';

class UserListTile extends StatelessWidget {
  const UserListTile(this.user, {super.key});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Card(
        child: ListTile(
          title: Text(user.name),
          subtitle: Text(user.username),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          onTap: () {
            context.read<UserCubit>().setSelectedUser(user);
            context.pushNamed(HomeRoute.detailUser);
          },
        ),
      ),
    );
  }
}
