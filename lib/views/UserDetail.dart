import 'package:flutter/material.dart';
import 'package:flutter_ui2mvp7/model/user_model.dart';
import 'package:flutter_ui2mvp7/shared_value.dart';

class UserDetail extends StatefulWidget {
  //Menerima passing data detail user
  UserModel detailUser;
  UserDetail({this.detailUser});
  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  Widget build(BuildContext context) {
    //Mengambil user detail dari parameter widget
    UserModel getUserDetail = widget.detailUser;
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail Priority Customer'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(
                    Icons.person,
                    color: SharedColor.mainColor,
                  ),
                  title: Text(getUserDetail.nama),
                  subtitle: Text(
                    getUserDetail.nama == 0 ? 'Tidak Aktif' : 'Aktif',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.location_on,
                    color: SharedColor.mainColor,
                  ),
                  title: Text(getUserDetail.alamat),
                ),
                ListTile(
                  leading: Icon(
                    Icons.email,
                    color: SharedColor.mainColor,
                  ),
                  title: Text(getUserDetail.email1),
                  subtitle: Text(
                    getUserDetail.email2,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.phone_android,
                    color: SharedColor.mainColor,
                  ),
                  title: Text(getUserDetail.phone1),
                  subtitle: Text(
                    getUserDetail.phone2,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
