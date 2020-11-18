import 'package:flutter/material.dart';
import 'package:flutter_ui2mvp7/shared_value.dart';

class GantiPassword extends StatefulWidget {
  GantiPassword({Key key}) : super(key: key);

  @override
  _GantiPasswordState createState() => _GantiPasswordState();
}

class _GantiPasswordState extends State<GantiPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ganti Password'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 18),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      // border: OutlineInputBorder(),
                      labelText: 'Kata Sandi Lama',
                      prefixIcon: Icon(Icons.lock_outline),
                      //suffixIcon: Icon(Icons.lock_outline),
                    ),
                    //controller: _password,
                    //onEditingComplete: () => node.unfocus(),
                    obscureText: true,
                    style: TextStyle(),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Kata Sandi Baru',
                        prefixIcon: Icon(Icons.lock_outline)),
                    //controller: _password,
                    //onEditingComplete: () => node.unfocus(),
                    obscureText: true,
                    style: TextStyle(),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Konfirmasi Kata Sandi Baru',
                        prefixIcon: Icon(Icons.lock_outline)),
                    //controller: _password,
                    //onEditingComplete: () => node.unfocus(),
                    obscureText: true,
                    style: TextStyle(),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: RaisedButton(
                            child: Text(
                              'Simpan',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            color: SharedColor.mainColor,
                            onPressed: () {}),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
