import 'package:flutter/material.dart';
import 'package:flutter_ui2mvp7/views/pcu/BerandaPcu.dart';
import 'package:flutter_ui2mvp7/views/pcu/Pengaturan.dart';
import 'package:flutter_ui2mvp7/views/pcu/Pertemuan.dart';
import 'package:flutter_ui2mvp7/views/pcu/RiwayatPertemuan.dart';

class MainPcu extends StatefulWidget {
  @override
  _MainPcuState createState() => _MainPcuState();
}

class _MainPcuState extends State<MainPcu> {
  // index to switch page
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // List of Page Widget
    List<Widget> _pageOptions = [
      BerandaPcu(),
      Pertemuan(),
      RiwayatPertemuan(),
    ];
    // Screen Size Mediaquery
    var screen = MediaQuery.of(context).size;

    final _formKey = GlobalKey<FormState>();
    String _valLokasi;
    List _lokasi = [
      "Lokasi 1",
      "Lokasi 2",
      "Lokasi 3",
      "Lokasi 4",
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: screen.height * 0.20,
            width: screen.width,
            decoration: BoxDecoration(
              color: Color(0xff021e52),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                text: 'Caca Marica',
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
          SizedBox(height: 10),
          _pageOptions.elementAt(_selectedIndex),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext bc) {
                return Container(
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          DropdownButton(
                            hint: Text("Pilih Lokasi"),
                            value: _valLokasi,
                            items: _lokasi.map((value) {
                              return DropdownMenuItem(
                                child: Text(value),
                                value: value,
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _valLokasi =
                                    value; //Untuk memberitahu _valFriends bahwa isi nya akan diubah sesuai dengan value yang kita pilih
                              });
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              child: Text("Submit"),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
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
          print(index);
          print(_selectedIndex);
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
