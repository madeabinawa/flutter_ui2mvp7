// Halaman Untuk Menambahkan Pcu Baru yang tersedia
import 'package:flutter/material.dart';
import 'package:flutter_ui2mvp7/shared_value.dart';

class PermintaanDitolak extends StatefulWidget {
  @override
  _PermintaanDitolakState createState() => _PermintaanDitolakState();
}

class _PermintaanDitolakState extends State<PermintaanDitolak> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pertemuan Ditangguhkan'),
        centerTitle: true,
      ),
      body: Column(
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
                          Row(
                            children: [
                              Icon(Icons.person, size: 18),
                              SizedBox(width: 8),
                              Text(
                                'Wawan Marica',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ],
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
                              SizedBox(width: 20),
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
                              SizedBox(width: 20),
                            ],
                          ),
                          SizedBox(height: 10),
                          update()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Halaman Ulasan
  // feedback() {
  //   return RaisedButton(
  //     child: Text('Berikan Ulasan'),
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
  //     elevation: 0,
  //     color: SharedColor.mainColor,
  //     textColor: Colors.white,
  //     onPressed: () {},
  //   );
  // }

  // Halaman Pembatalan
  update() {
    return RaisedButton(
      child: Text('Update'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 0,
      color: SharedColor.mainColor,
      textColor: Colors.white,
      onPressed: () {},
    );
  }
}
