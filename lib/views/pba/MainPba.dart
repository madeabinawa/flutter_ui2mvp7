import 'package:flutter/material.dart';
import 'package:flutter_ui2mvp7/api/user_api.dart';
import 'package:flutter_ui2mvp7/views/UserDetail.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ui2mvp7/views/Login.dart';
import 'package:flutter_ui2mvp7/shared_value.dart';
import 'package:flutter_ui2mvp7/api/login_api.dart';
import 'package:flutter_ui2mvp7/views/GantiPassword.dart';
import 'package:flutter_ui2mvp7/views/pba/RiwayatUlasan.dart';
import 'package:flutter_ui2mvp7/views/pba/JadwalPertemuan.dart';
import 'package:flutter_ui2mvp7/views/pba/PermintaanDitolak.dart';
import 'package:flutter_ui2mvp7/views/pba/PermintaanPertemuan.dart';

class MainPba extends StatefulWidget {
  @override
  _MainPbaState createState() => _MainPbaState();
}

class _MainPbaState extends State<MainPba> {
  @override
  Widget build(BuildContext context) {
    final dataUserLogin =
        Provider.of<LoginProvider>(context, listen: false).dataLoginUser;
    final userApi = Provider.of<UserProvider>(context, listen: false);
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Data Priority Customer'),
        actions: [
          IconButton(
            splashRadius: 20,
            icon: Icon(Icons.notifications),
            onPressed: () {},
          )
        ],
        elevation: 0,
      ),
      body: Container(
        child: FutureBuilder(
          future: userApi.getDataPcu(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return Consumer<UserProvider>(
              builder: (context, userData, _) {
                dynamic dataUserPcu = userData.dataPCu;
                return ListView.builder(
                  itemCount: dataUserPcu.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 8,
                      child: InkWell(
                        onTap: () {
                          //print(dataUserPcu[index].runtimeType);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserDetail(
                                detailUser: dataUserPcu[index],
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Icon(
                              Icons.person,
                              size: 30,
                              color: SharedColor.mainColor,
                            ),
                            title: Text(
                              dataUserPcu[index].nama,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 8),
                                Text(dataUserPcu[index].email1,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                                SizedBox(height: 5),
                                Text(dataUserPcu[index].phone1,
                                    style: TextStyle(fontSize: 14)),
                              ],
                            ),
                            trailing: Icon(Icons.chevron_right,
                                color: SharedColor.mainColor),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
      // Left Drawer
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      UserAccountsDrawerHeader(
                        currentAccountPicture: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/img/user-icon.png'),
                        ),
                        accountName: Text('Halo, ${dataUserLogin.nama}'),
                        accountEmail: Text('Personal Banking Assistant'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Jadwal Pertemuan'),
                    leading: Icon(
                      Icons.perm_contact_calendar,
                      size: 25.0,
                      color: SharedColor.mainColor,
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JadwalPertemuan(),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text('Permintaan Pertemuan'),
                    leading: Icon(
                      Icons.add_comment,
                      size: 25.0,
                      color: SharedColor.mainColor,
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PermintaanPertemuan(),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text('Pertemuan Ditangguhkan'),
                    leading: Icon(
                      Icons.announcement,
                      size: 25.0,
                      color: SharedColor.mainColor,
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PermintaanDitolak(),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text('Riwayat Ulasan'),
                    leading: Icon(
                      Icons.watch_later,
                      size: 25.0,
                      color: SharedColor.mainColor,
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RiwayatUlasan(),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text('Ubah Kata Sandi'),
                    leading: Icon(
                      Icons.vpn_key,
                      size: 25.0,
                      color: SharedColor.mainColor,
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GantiPassword(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Log Out'),
              leading: Icon(
                Icons.exit_to_app,
                size: 25.0,
                color: SharedColor.mainColor,
              ),
              onTap: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                  (Route<dynamic> route) => false),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    //Tombol Aksi
    Widget cancel = FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      color: Colors.grey[600],
      child: Text("Batalkan"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    Widget remove = FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      color: Colors.red[800],
      child: Text("Hapus"),
      onPressed: () {
        //Jalankan Fungsi hapus
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Hapus PCU"),
      content: Text("Anda yakin hapus Wawan Marica dari PCU Anda?"),
      actions: [remove, cancel],
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
