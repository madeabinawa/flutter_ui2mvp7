import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ui2mvp7/api/login_api.dart';
import 'package:flutter_ui2mvp7/shared_value.dart';
import 'package:flutter_ui2mvp7/views/pcu/BerandaPcu.dart';
import 'package:flutter_ui2mvp7/views/pcu/Pengaturan.dart';
import 'package:flutter_ui2mvp7/views/pcu/Pertemuan.dart';
import 'package:flutter_ui2mvp7/views/pcu/RiwayatPertemuan.dart';
import 'package:flutter_ui2mvp7/views/pcu/FormPertemuan.dart';

class MainPcu extends StatefulWidget {
  @override
  _MainPcuState createState() => _MainPcuState();
}

class _MainPcuState extends State<MainPcu> {
  // index to switch page
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final dataUserLogin =
        Provider.of<LoginProvider>(context, listen: false).dataLoginUser;
    // List of Page Widget
    List<Widget> _pageOptions = [
      BerandaPcu(),
      Pertemuan(),
      RiwayatPertemuan(),
    ];
    // Screen Size Mediaquery
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: screen.height * 0.28,
            width: screen.width,
            decoration: BoxDecoration(
              color: SharedColor.mainColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 25),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Halo, ',
                                style: TextStyle(fontWeight: FontWeight.w300),
                              ),
                              TextSpan(
                                text: dataUserLogin.nama,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.settings),
                          iconSize: 22,
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Pengaturan(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    Text(
                      'Priority Customer',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          _pageOptions.elementAt(_selectedIndex),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormPertemuan(),
            ),
          )
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: 'Beranda',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Pertemuan',
            icon: Icon(Icons.calendar_today),
          ),
          BottomNavigationBarItem(
            label: 'Riwayat',
            icon: Icon(Icons.watch_later_outlined),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
