// Halaman Untuk Menambahkan Pcu Baru yang tersedia
import 'package:flutter/material.dart';
import 'package:flutter_ui2mvp7/shared_value.dart';

class AddPcu extends StatefulWidget {
  @override
  _AddPcuState createState() => _AddPcuState();
}

class _AddPcuState extends State<AddPcu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Priority Customer'),
        centerTitle: true,
      ),
      body: Card(
        elevation: 8,
        child: ListTile(
          leading: Icon(
            Icons.person,
            size: 30,
            color: SharedColor.mainColor,
          ),
          title: Text('Wawan Marica'),
          subtitle: Text('Enable'),
          trailing: GestureDetector(
              child:
                  Icon(Icons.add_box_rounded, color: SharedColor.secondColor),
              onTap: () {
                showAlertDialog(context);
              }),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    //Tombol Aksi
    Widget cancel = FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      color: Colors.red[800],
      child: Text("Batalkan"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    Widget add = FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      color: Colors.green[800],
      child: Text("Tambahkan"),
      onPressed: () {
        //Jalankan Fungsi tambah
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Tambahkan PCU"),
      content: Text("Anda yakin tambahkan Wawan Marica sebagai PCU Anda?"),
      actions: [cancel, add],
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
