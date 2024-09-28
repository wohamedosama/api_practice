// ignore_for_file: avoid_print

import 'package:api_practice/models/user.dart';
import 'package:api_practice/services/web_services.dart';

class MyRepo {
  final WebServices webServices;
  MyRepo(this.webServices);
  Future<List<Users>> getAllUsers() async {
    var response = await webServices.getAllUsers();
    return response.map((user) => Users.fromJson(user.toJson())).toList();
  }

  Future<Users> getUserById(int id) async {
    var response = await webServices.getUserById(id);
    return Users.fromJson(response.toJson());
  }
}
