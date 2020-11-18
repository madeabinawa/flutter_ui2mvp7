import 'package:flutter/material.dart';
import 'package:flutter_ui2mvp7/shared_value.dart';

class FormPertemuan extends StatefulWidget {
  @override
  _FormPertemuanState createState() => _FormPertemuanState();
}

class _FormPertemuanState extends State<FormPertemuan> {
  DateTime pickedDate;
  TimeOfDay time;
  String _valLokasi;
  List _lokasi = [
    "Lokasi 1",
    "Lokasi 2",
    "Lokasi 3",
    "Lokasi 4",
  ];
  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Pertemuan'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: SingleChildScrollView(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.calendar_today,
                      color: SharedColor.mainColor,
                    ),
                    title: Text(
                        '${pickedDate.day}/ ${pickedDate.month}/ ${pickedDate.year}'),
                    onTap: _pickDate,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.watch_later,
                      color: SharedColor.mainColor,
                    ),
                    title: Text('${time.hour} : ${time.minute}'),
                    onTap: _pickTime,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.location_on,
                      color: SharedColor.mainColor,
                    ),
                    title: DropdownButton(
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
                          _valLokasi = value;
                        });
                      },
                    ),
                    onTap: () {},
                  ),
                  TextField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Catatan',
                      prefixIcon: Icon(Icons.note_add),
                    ),
                    //controller: _email,
                    //onEditingComplete: () => node.nextFocus(),
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
        ),
      ),
    );
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
        context: context,
        firstDate: DateTime(DateTime.now().year - 5),
        initialDate: pickedDate,
        lastDate: DateTime(DateTime.now().year + 5));

    if (date != null) {
      setState(() {
        pickedDate = date;
      });
    }
  }

  _pickTime() async {
    TimeOfDay selectedTime = await showTimePicker(
      context: context,
      initialTime: time,
    );

    if (selectedTime != null) {
      setState(() {
        time = selectedTime;
      });
    }
  }
}
