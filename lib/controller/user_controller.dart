import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../models/user.dart';
import '../services/user_service.dart';

class UserController extends GetxController {
  final UserService _service;
  UserController(this._service);

  final formKey = GlobalKey<FormBuilderState>();
  RxList<User> users = <User>[].obs;
  Map<String, dynamic> formValues = <String, dynamic>{}.obs;
  Rx<User?> selectedUser = (null as User?).obs;

  Future<void> getAllUsers() async {
    final responseData = await _service.getUsers();
    responseData.when(
      (response) {
        users.value = response.data;
      },
      (exception) {
        log("exception");
      },
    );
  }

  void setSelectedUser(User user) {
    selectedUser.value = user;
  }

  Future<void> addUser() async {
    final field = formKey.currentState?.fields;

    final data = {
      "id": DateTime.now().millisecondsSinceEpoch,
      "name": field?["name"]?.value,
      "username": field?["username"]?.value,
      "email": field?["email"]?.value,
      "address": {
        "street": "Kulas Light",
        "suite": "Apt. 556",
        "city": "Gwenborough",
        "zipcode": "92998-3874",
        "geo": {"lat": "-37.3159", "lng": "81.1496"}
      },
      "phone": field?["phone"]?.value,
      "website": field?["website"]?.value,
      "company": {
        "name": "Romaguera-Crona",
        "catchPhrase": "Multi-layered client-server neural-net",
        "bs": "harness real-time e-markets"
      }
    };

    //-----POST https://jsonplaceholder.typicode.com/users

    final userData = User.fromJson(data);
    users.insert(0, userData);
  }

  Future<void> deleteUser(int userID) async {
    users.removeWhere((item) => item.id == userID);
    //----DELETE https://jsonplaceholder.typicode.com/users/{id}
  }

  Future<void> editUser() async {
    final field = formKey.currentState?.fields;
    users.value = users.map((item) {
      if (item.id != selectedUser.value!.id) return item;
      item.name = field?["name"]?.value;
      item.username = field?["username"]?.value;
      item.email = field?["email"]?.value;
      item.phone = field?["phone"]?.value;
      item.website = field?["website"]?.value;

      return item;
    }).toList();

    //---------PUT https://jsonplaceholder.typicode.com/users/{id}
  }

  Future<void> loadData() async {
    formValues = {
      "name": selectedUser.value!.name,
      "username": selectedUser.value!.username,
      "email": selectedUser.value!.email,
      "phone": selectedUser.value!.phone,
      "website": selectedUser.value!.website,
    };
  }
}
