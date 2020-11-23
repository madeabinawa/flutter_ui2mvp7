import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_ui2mvp7/model/user_model.dart';

class UserProvider extends ChangeNotifier {
  List<UserModel> _dataPcu = [];
  List<UserModel> get dataPCu => _dataPcu;

  Future<dynamic> getDataPcu() async {
    dynamic result;
    //set endpoint api
    final url = 'http://18.191.9.5:8090/user/list';

    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Decode response json dan cast kedalam bentuk key-value pair
      result = json.decode(response.body)['user'].cast<Map<String, dynamic>>();

      _dataPcu =
          result.map<UserModel>((user) => UserModel.fromJson(user)).toList();

      return _dataPcu;
    }
    notifyListeners();
  }
}
