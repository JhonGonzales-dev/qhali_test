import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:qhali_app/controller/user_cubit.dart';
import 'package:qhali_app/routes/home_route.dart';

import '../widgets/custom_icon.dart';
import '../widgets/custom_textfield.dart';

class AddEditUserScreen extends StatefulWidget {
  const AddEditUserScreen(this.from, {super.key});
  final String from;

  @override
  State<AddEditUserScreen> createState() => _AddEditUserScreenState();
}

class _AddEditUserScreenState extends State<AddEditUserScreen> {
  late GlobalKey<FormBuilderState> formKey;
  void loadData() {
    if (widget.from == "edit") {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final data = context.read<UserCubit>().formValues;
        formKey.currentState!.patchValue(data);
      });
    }
  }

  @override
  void initState() {
    formKey = context.read<UserCubit>().formKey;
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            CustomIcon(
              icon: Icons.save,
              iconColor: Colors.blue,
              onPress: () {
                final cubit = context.read<UserCubit>();
                (widget.from == "edit") ? cubit.editUser() : cubit.addUser();
              },
            ),
          ],
        ),
        body: BlocConsumer<UserCubit, UserState>(
          listener: (context, state) {
            if (state is UserAdd) {
              context.pop();
            } else if (state is UserUpdated) {
              context.goNamed(HomeRoute.home);
            }
          },
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Card(
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      child: FormBuilder(
                        key: formKey,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomTextfield(
                              nameField: "name",
                              labelText: 'Name',
                            ),
                            SizedBox(height: 15),
                            CustomTextfield(
                              nameField: "username",
                              labelText: 'Username',
                            ),
                            SizedBox(height: 15),
                            CustomTextfield(
                              nameField: "email",
                              labelText: 'Email',
                              textInputType: TextInputType.emailAddress,
                            ),
                            SizedBox(height: 15),
                            CustomTextfield(
                              nameField: "phone",
                              labelText: 'Phone',
                              textInputType: TextInputType.phone,
                            ),
                            SizedBox(height: 15),
                            CustomTextfield(
                              nameField: "website",
                              labelText: 'Website',
                              textInputType: TextInputType.url,
                            ),
                            SizedBox(height: 30),
                          ],
                        ),
                      )),
                )
              ],
            );
          },
        ));
  }
}
