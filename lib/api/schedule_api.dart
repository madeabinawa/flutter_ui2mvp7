import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_ui2mvp7/model/schedule_model.dart';

class ScheduleProvider extends ChangeNotifier {
  List<ScheduleModel> _schedulePcu = [];
  List<ScheduleModel> get schedulePCu => _schedulePcu;

  Future<dynamic> getSchedulePcu(int idUser) async {
    print(idUser);

    dynamic result;
    //set endpoint api
    final url = 'http://18.191.9.5:8090/schedule/get-data-pcu';

    Map data = {
      'pcu_id': idUser,
    };

    final response = await http.post(url, body: json.encode(data));

    if (response.statusCode == 200) {
      // Decode response json dan cast kedalam bentuk key-value pair
      result =
          json.decode(response.body)['schedule'].cast<Map<String, dynamic>>();

      _schedulePcu = result
          .map<ScheduleModel>((schedule) => ScheduleModel.fromJson(schedule))
          .toList();
      print(_schedulePcu);

      return _schedulePcu;
    }
    notifyListeners();
  }
}
