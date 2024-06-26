import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:qhali_app/routes/home_route.dart';
import '../controller/user_controller.dart';
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
  final userController = Get.find<UserController>();
  void loadData() {
    if (widget.from == "edit") {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final data = userController.formValues;
        formKey.currentState!.patchValue(data);
      });
    }
  }

  void onPressIcon() {
    if (formKey.currentState!.validate()) {
      (widget.from == "edit")
          ? userController.editUser()
          : userController.addUser();
      context.goNamed(HomeRoute.home);
    }
  }

  String? validatorField(String? value) {
    final data = value?.trim();
    return (data == null || data.isEmpty) ? 'Obligatory field' : null;
  }

  @override
  void initState() {
    formKey = userController.formKey;
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
              onPress: () => onPressIcon(),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Card(
              child: Container(
                  padding: const EdgeInsets.all(20),
                  child: FormBuilder(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomTextfield(
                          nameField: "name",
                          labelText: 'Name',
                          validator: validatorField,
                        ),
                        const SizedBox(height: 15),
                        CustomTextfield(
                          nameField: "username",
                          labelText: 'Username',
                          validator: validatorField,
                        ),
                        const SizedBox(height: 15),
                        CustomTextfield(
                          nameField: "email",
                          labelText: 'Email',
                          textInputType: TextInputType.emailAddress,
                          validator: validatorField,
                        ),
                        const SizedBox(height: 15),
                        CustomTextfield(
                          nameField: "phone",
                          labelText: 'Phone',
                          textInputType: TextInputType.phone,
                          validator: validatorField,
                        ),
                        const SizedBox(height: 15),
                        CustomTextfield(
                          nameField: "website",
                          labelText: 'Website',
                          textInputType: TextInputType.url,
                          validator: validatorField,
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  )),
            )
          ],
        ));
  }
}
