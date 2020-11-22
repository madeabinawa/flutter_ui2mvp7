import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ui2mvp7/shared_value.dart';
import 'package:flutter_ui2mvp7/api/login_api.dart';
import 'package:flutter_ui2mvp7/views/pba/MainPba.dart';
import 'package:flutter_ui2mvp7/views/pcu/MainPcu.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _resetEmail = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    //initial Login Provider
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    //cek jika field username password kosong
    isControllerEmpty() {
      return _email.text != '' && _password.text != '';
    }

    //get Screen size
    var screen = MediaQuery.of(context).size;
    //node textField
    final node = FocusScope.of(context);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: screen.height / 3.5,
              width: screen.width,
              decoration: BoxDecoration(
                color: SharedColor.mainColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/img/logo.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.person_outlined),
                      ),
                      controller: _email,
                      onEditingComplete: () => node.nextFocus(),
                      style: TextStyle(),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: _obscureText
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          )),
                      controller: _password,
                      onEditingComplete: () => node.unfocus(),
                      obscureText: _obscureText,
                      style: TextStyle(),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: RaisedButton(
                            child: Text(
                              'Login',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            onPressed: isControllerEmpty()
                                ? () async {
                                    //Menerima result dari login api
                                    LoginResult loginResult =
                                        await loginProvider.login(
                                            _email.text, _password.text);
                                    //jika role_id 4 maka navigasi ke halaman pcu
                                    if (loginResult.roleId == 4) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MainPcu(),
                                        ),
                                      );
                                    } else if (loginResult.roleId == 3) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MainPba(),
                                        ),
                                      );
                                    }
                                    //jika role_id tidak ditemukan tampilkan peringatan
                                    else {
                                      showFlushbar(msg: '');
                                      // Flushbar(
                                      //   duration: Duration(seconds: 4),
                                      //   backgroundColor: Colors.red[800],
                                      //   flushbarPosition:
                                      //       FlushbarPosition.BOTTOM,
                                      //   message:
                                      //       'Kesalahan pada email atau password',
                                      // ).show(context);
                                    }
                                  }
                                : null,
                            color: isControllerEmpty()
                                ? SharedColor.mainColor
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    // Forogot Password
                    GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return Container(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 20, 15, 20),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            TextField(
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: 'Reset Password',
                                                prefixIcon: Icon(Icons.email),
                                              ),
                                              controller: _resetEmail,
                                              onEditingComplete: () =>
                                                  node.nextFocus(),
                                              style: TextStyle(),
                                            ),
                                            SizedBox(height: 15),
                                            RaisedButton(
                                              child: Text(
                                                'Masukkan Email Anda',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              elevation: 0,
                                              color: SharedColor.mainColor,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                              onPressed: () async {
                                                // print(_resetEmail.text);
                                                String message =
                                                    await loginProvider
                                                        .resetPasswordEmail(
                                                            _resetEmail.text);
                                                showFlushbar(msg: message);
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: SharedColor.mainColor),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(height: screen.height / 8),
          ],
        ),
      ),
    );
  }

  showFlushbar({msg}) {
    var message = msg;
    return Flushbar(
      duration: Duration(seconds: 4),
      backgroundColor: message == '' ? Colors.red[800] : Colors.green[800],
      flushbarPosition: FlushbarPosition.BOTTOM,
      message: message == ''
          ? 'Kesalahan pada email atau password'
          : message.toString(),
    ).show(context);
  }
}
