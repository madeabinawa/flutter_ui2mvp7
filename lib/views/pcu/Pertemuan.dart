import 'package:flutter/material.dart';
import 'package:flutter_ui2mvp7/api/login_api.dart';
import 'package:flutter_ui2mvp7/api/schedule_api.dart';
import 'package:flutter_ui2mvp7/shared_value.dart';
import 'package:provider/provider.dart';

class Pertemuan extends StatefulWidget {
  @override
  _PertemuanState createState() => _PertemuanState();
}

class _PertemuanState extends State<Pertemuan> {
  @override
  Widget build(BuildContext context) {
    final loggedInUser = Provider.of<LoginProvider>(context, listen: false);
    final scheduleData = Provider.of<ScheduleProvider>(context, listen: false);
    var screen = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: screen.height * 0.2),
      child: FutureBuilder(
        future: scheduleData.getSchedulePcu(loggedInUser.dataLoginUser.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return Consumer<ScheduleProvider>(
            builder: (context, scheduleData, _) {
              dynamic dataSchedulePcu = scheduleData.schedulePCu;
              return ListView.builder(
                itemCount: dataSchedulePcu.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 8,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 6.0),
                    child: InkWell(
                      onTap: () {
                        scheduleData
                            .getSchedulePcu(loggedInUser.dataLoginUser.id);
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 10, 5, 10),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      dataSchedulePcu[index].note,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(height: 15),
                                    Row(
                                      children: [
                                        Icon(Icons.calendar_today, size: 18),
                                        SizedBox(width: 8),
                                        Text(
                                          '20/04/2020',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        SizedBox(width: 15),
                                        Icon(Icons.watch_later_outlined,
                                            size: 18),
                                        SizedBox(width: 8),
                                        Text(
                                          '10:00',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Icon(Icons.location_on_outlined,
                                            size: 18),
                                        SizedBox(width: 8),
                                        Text(
                                          'KC Pondok Indah',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.check_circle,
                                color: SharedColor.mainColor,
                                size: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
