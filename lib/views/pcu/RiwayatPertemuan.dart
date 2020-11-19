import 'package:flutter/material.dart';
import 'package:flutter_ui2mvp7/shared_value.dart';

class RiwayatPertemuan extends StatefulWidget {
  @override
  _RiwayatPertemuanState createState() => _RiwayatPertemuanState();
}

class _RiwayatPertemuanState extends State<RiwayatPertemuan> {
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 8,
          margin: new EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
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
                          'Membuat Investasi Jangka Panjang 10 Tahun',
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
                            Icon(Icons.watch_later_outlined, size: 18),
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
                            Icon(Icons.location_on_outlined, size: 18),
                            SizedBox(width: 8),
                            Text(
                              'KC Pondok Indah',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        // Cek ulasan, jika ulasan kosong tampilkan button
                        // Jika telah diulas, tampilkan bintang
                        RaisedButton(
                          child: Text('Berikan Ulasan'),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          elevation: 0,
                          color: SharedColor.mainColor,
                          textColor: Colors.white,
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
