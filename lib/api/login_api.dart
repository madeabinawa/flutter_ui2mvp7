import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_ui2mvp7/model/user_model.dart';

class LoginProvider extends ChangeNotifier {
  UserModel _loginUser;
  UserModel get dataLoginUser => _loginUser;

  Future<LoginResult> login(String email1, String password) async {
    //set endpoint api
    final url = 'http://18.191.9.5:8090/user/login';

    //Mapping input data
    Map data = {'email1': email1, 'password': password};

    try {
      //Encode input data map as json
      var body = json.encode(data);
      //send json to server and save response
      var response = await http.post(url, body: body);
      //decode user response json from server
      var user = json.decode(response.body)['user'];
      _loginUser = UserModel.fromJson(user);

      // return roleId ke halaman login
      return LoginResult(roleId: _loginUser.roleId);
    } catch (e) {
      //return error
      return LoginResult(message: 'ini errornya ${e.toString()}');
    }
  }

  Future<String> changePassword(
      String passwordLama, String passwordBaru) async {
    //set endpoint api ubah password
    final url = 'http://18.191.9.5:8090/user/change-password';
    //Mapping input data
    Map data = {
      'id': _loginUser.id,
      'new_pass': passwordBaru,
      'old_pass': passwordLama
    };

    try {
      //Encode input data map as json
      var body = json.encode(data);
      //send json to server and save response
      var response = await http.post(url, body: body);
      //decode response json from server
      var message = json.decode(response.body);
      if (message.containsKey("error")) {
        return 'Password lama tidak sesuai';
      } else {
        return 'Berhasil';
      }
    } catch (e) {
      //return error
      print(e.toString());
    }
  }

  Future<String> resetPasswordEmail(String email) async {
    //set endpoint api ubah password
    final url = 'http://18.191.9.5:8090/user/resetbymail';
    //Mapping input data
    Map data = {'email1': email};

    //Encode input data map as json
    var body = json.encode(data);
    //send json to server and save response
    var response = await http.post(url, body: body);
    //decode response json from server
    var message = json.decode(response.body)['message'];
    print(message);
    return message;
  }
}

class LoginResult {
  int roleId;
  String message;
  LoginResult({this.roleId, this.message});
}
