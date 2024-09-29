// ignore_for_file: avoid_print

import 'package:api_practice/models/user.dart';
import 'package:api_practice/services/web_services.dart';

/*
When I generate web services class and build the build runner packge the file was generated is contain about the object ready to use
becasue this object is already mapped in the web_services.dart And converted to json and from json 
I can use the function I wrote in the web_services.dart to call the api and get the response
 */

class MyRepo {
  final WebServices webServices;
  MyRepo(this.webServices);
  Future<List<Users>> getAllUsers() async {
    return await webServices.getAllUsers();
  }

  Future<Users> getUserById(int id) async {
    return await webServices.getUserById(id);
  }

  Future<Users> createNewUser(Users user) async {
    return await webServices.createUser(user,
        'Bearer 7fd78565f55e32b00bc057aaf361731ae264d61bff5de428353af57d96a05fb6');
  }
}
