import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../models/user.dart';
import '../services/user_service.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserService _service;
  UserCubit(this._service) : super(UserInitial());
  final formKey = GlobalKey<FormBuilderState>();
  List<User> users = [];
  Map<String, dynamic> formValues = {};
  User? selectedUser;

  Future<void> getAllUsers() async {
    emit(UserLoading());
    final responseData = await _service.getUsers();
    responseData.when(
      (response) {
        users = response.data;
        emit(UserSuccess(users));
      },
      (exception) {
        emit(UserError());
      },
    );
  }

  void setSelectedUser(User user) {
    selectedUser = user;
    emit(UserSelected(user));
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

    final userData = User.fromJson(data);
    users.insert(0, userData);
    emit(UserAdd(users));
  }

  Future<void> deleteUser(int userID) async {
    users.removeWhere((item) => item.id == userID);
    emit(UserDeleted(users));
  }

  Future<void> editUser() async {
    final field = formKey.currentState?.fields;

    users = users.map((item) {
      if (item.id != selectedUser!.id) return item;
      item.name = field?["name"]?.value;
      item.username = field?["username"]?.value;
      item.email = field?["email"]?.value;
      item.phone = field?["phone"]?.value;
      item.website = field?["website"]?.value;

      return item;
    }).toList();

    emit(UserUpdated(users));
  }

  Future<void> loadData() async {
    formValues = {
      "name": selectedUser!.name,
      "username": selectedUser!.username,
      "email": selectedUser!.email,
      "phone": selectedUser!.phone,
      "website": selectedUser!.website,
    };

    emit(LoadedData(formValues));
  }
}
