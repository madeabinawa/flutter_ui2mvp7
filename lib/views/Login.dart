import 'package:flutter/material.dart';
import 'package:flutter_ui2mvp7/shared_value.dart';

import 'package:flutter_ui2mvp7/views/pba/MainPba.dart';
import 'package:flutter_ui2mvp7/views/pcu/MainPcu.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    isControllerEmpty() {
      return _email.text != '' && _password.text != '';
    }

    var screen = MediaQuery.of(context).size;
    final node = FocusScope.of(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: screen.height / 3,
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
                        prefixIcon: Icon(Icons.lock_outline)),
                    controller: _password,
                    onEditingComplete: () => node.unfocus(),
                    obscureText: true,
                    style: TextStyle(),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: RaisedButton(
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          padding: EdgeInsets.only(top: 15, bottom: 15),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          onPressed: isControllerEmpty()
                              ? () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MainPba(),
                                    ),
                                  )
                              : null,
                          onLongPress: isControllerEmpty()
                              ? () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MainPcu(),
                                    ),
                                  )
                              : null,
                          color: isControllerEmpty()
                              ? SharedColor.mainColor
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: screen.height / 8)
          ],
        ),
      ),
    );
  }
}
