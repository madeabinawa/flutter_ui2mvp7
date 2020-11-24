import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_ui2mvp7/model/schedule_model.dart';

class ScheduleProvider extends ChangeNotifier {
  List<ScheduleModel> _schedulePcu = [];
  List<ScheduleModel> get schedulePCu => _schedulePcu;

  List<ScheduleModel> _schedulePba = [];
  List<ScheduleModel> get schedulePba => _schedulePba;

  Future<dynamic> getSchedulePcu(int idUser) async {
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
      return _schedulePcu;
    }
    notifyListeners();
  }

  Future<dynamic> getSchedulePba(int idUser) async {
    dynamic result;
    //set endpoint api
    final url = 'http://18.191.9.5:8090/schedule/get-data-pba';

    Map data = {
      'pba_id': idUser,
    };

    final response = await http.post(url, body: json.encode(data));

    if (response.statusCode == 200) {
      // Decode response json dan cast kedalam bentuk key-value pair
      result =
          json.decode(response.body)['schedule'].cast<Map<String, dynamic>>();

      _schedulePba = result
          .map<ScheduleModel>((schedule) => ScheduleModel.fromJson(schedule))
          .toList();
      return _schedulePba;
    }
    notifyListeners();
  }

  Future<String> createSchedule(String date, String time, String note,
      int pbaID, int pcuID, int lokasi) async {
    //set endpoint api
    final url = 'http://18.191.9.5:8090/schedule/create';

    Map data = {
      'tanggal_jadwal': date,
      'jam_jadwal': time,
      'note': note,
      'pba_id': pbaID,
      'pcu_id': pcuID,
      'status': 0,
      'location_id': lokasi,
    };

    final response = await http.post(url, body: json.encode(data));

    if (response.statusCode == 200) {
      // Decode response json dan cast kedalam bentuk key-value pair
      print('Berhasil membuat jadwal pertemuan');
      return 'Berhasil membuat jadwal pertemuan';
    } else {
      print('Terjadi kesalahan, mohon coba lagi');
      return 'Terjadi kesalahan, mohon coba lagi';
    }
  }
}
