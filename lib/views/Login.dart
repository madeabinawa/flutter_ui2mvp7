import 'package:flutter/material.dart';
import 'package:flutter_ui2mvp7/views/Home.dart';

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
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text('Login'),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: screen.height / 3,
              decoration: BoxDecoration(
                color: Color(0xff021e52),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
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
                          onPressed: isControllerEmpty()
                              ? () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Home(),
                                    ),
                                  )
                              : null,
                          color: isControllerEmpty()
                              ? Color(0xff021e52)
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
