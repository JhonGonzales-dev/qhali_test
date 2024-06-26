import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:qhali_app/routes/home_route.dart';
import '../controller/user_controller.dart';
import '../widgets/custom_icon.dart';
import '../widgets/rich_text.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    final user = userController.selectedUser.value;

    return Scaffold(
        appBar: AppBar(
          actions: [
            CustomIcon(
              icon: Icons.edit,
              iconColor: Colors.blue,
              onPress: () {
                userController.loadData();
                context.pushNamed(HomeRoute.addUser, extra: "edit");
              },
            ),
            CustomIcon(
              icon: Icons.delete,
              iconColor: Colors.red,
              onPress: () {
                userController.deleteUser(user!.id);
                context.pop();
              },
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Card(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "USER",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 5),
                    RichTextBold('name', user!.name),
                    RichTextBold('username', user.username),
                    RichTextBold('email', user.email),
                    RichTextBold('phone', user.phone),
                    RichTextBold('website', user.website),
                    const SizedBox(height: 20),
                    const Divider(),
                    const Text(
                      "ADDRESS",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 5),
                    RichTextBold('street', user.address.street),
                    RichTextBold('city', user.address.city),
                    RichTextBold('suite', user.address.suite),
                    RichTextBold('suite', user.address.zipcode),
                    const SizedBox(height: 20),
                    const Divider(),
                    const Text(
                      "COMPANY",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 5),
                    RichTextBold('name', user.company.name),
                    RichTextBold('catchPhrase', user.company.catchPhrase),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
