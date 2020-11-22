import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui2mvp7/api/login_api.dart';
import 'package:flutter_ui2mvp7/shared_value.dart';
import 'package:provider/provider.dart';

class GantiPassword extends StatefulWidget {
  @override
  _GantiPasswordState createState() => _GantiPasswordState();
}

class _GantiPasswordState extends State<GantiPassword> {
  TextEditingController _oldPassword = TextEditingController();
  TextEditingController _newPassword = TextEditingController();
  TextEditingController _confirmNewPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Init Login Provider
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);

    //Akses api ubah password
    updatePassword() async {
      String result = await loginProvider.changePassword(
          _oldPassword.text, _newPassword.text);
      showFlushbar(result);
    }

    // Cek jika newPassword dan confirmNewPassword bernilai sama
    isMatch() {
      if (_newPassword.text != '' && _confirmNewPassword.text != '') {
        return _newPassword.text == _confirmNewPassword.text;
      } else {
        return false;
      }
    }

    //Cek jika semua field sudah terpenuhi
    isVerified() {
      String msg = '';
      if (_oldPassword.text != '') {
        if (isMatch()) {
          //Jalankan method update password jika semua terpenuhi
          updatePassword();
        } else {
          // Jika field konfirmasi password tidak sesuai field password baru
          msg = 'Konfirmasi kata sandi tidak benar';
        }
      } else {
        // Jika field password lama kosong
        msg = 'Kata sandi tidak boleh kosong';
      }
      if (msg != '') {
        showFlushbar(msg);
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Ubah Password'),
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
                    controller: _oldPassword,
                    //onEditingComplete: () => node.unfocus(),
                    obscureText: true,
                    style: TextStyle(),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Kata Sandi Baru',
                        prefixIcon: Icon(Icons.lock_outline)),
                    controller: _newPassword,
                    // onEditingComplete: () => isMatch,
                    obscureText: true,
                    style: TextStyle(),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Konfirmasi Kata Sandi Baru',
                        prefixIcon: Icon(Icons.lock_outline)),
                    controller: _confirmNewPassword,
                    // onEditingComplete: () => isMatch,
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
                            onPressed: () => isVerified()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  // Flushbar untuk menampilkan respons
  showFlushbar(msg) {
    return Flushbar(
      duration: Duration(seconds: 4),
      backgroundColor: msg == 'Berhasil' ? Colors.green[800] : Colors.red[800],
      flushbarPosition: FlushbarPosition.BOTTOM,
      message: msg == 'Berhasil' ? 'Berhasil perbarui password' : msg,
    ).show(context);
  }
}
