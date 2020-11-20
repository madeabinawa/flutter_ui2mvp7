// Halaman Untuk Melihat Permintaan Pertemuan
import 'package:flutter/material.dart';
import 'package:flutter_ui2mvp7/shared_value.dart';
import 'package:flutter_ui2mvp7/views/FeedbackUser.dart';

class PermintaanPertemuan extends StatefulWidget {
  @override
  _PermintaanPertemuanState createState() => _PermintaanPertemuanState();
}

class _PermintaanPertemuanState extends State<PermintaanPertemuan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Permintaan Pertemuan'),
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
                              SizedBox(width: 50),
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
                              Icon(Icons.person, size: 18),
                              SizedBox(width: 8),
                              Text(
                                'Caca Marica',
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
                          Row(
                            children: [
                              terima(),
                              SizedBox(
                                width: 10,
                              ),
                              tolak(context)
                            ],
                          ),
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

  // Terima permintaan
  terima() {
    return RaisedButton(
      child: Text('Terima'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 0,
      color: SharedColor.mainColor,
      textColor: Colors.white,
      onPressed: () {},
    );
  }

  // Tolak permintaan
  tolak(context) {
    return RaisedButton(
      child: Text('Tolak'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 0,
      color: Colors.red[800],
      textColor: Colors.white,
      onPressed: () => showAlertDialog(context),
    );
  }

  showAlertDialog(BuildContext context) {
    //Tombol Aksi
    Widget tolak = FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      color: Colors.red[800],
      child: Text("Tolak"),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FeedbackUser(
            feedbackType: 'decline',
          ),
        ),
      ),
    );

    Widget batal = FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      color: Colors.grey[800],
      child: Text("Batal"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Tolak Pertemuan"),
      content: Text("Anda yakin tolak pertemuan ini?"),
      actions: [batal, tolak],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
