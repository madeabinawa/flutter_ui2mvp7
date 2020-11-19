import 'package:flutter/material.dart';
import 'package:flutter_ui2mvp7/shared_value.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FeedbackUser extends StatefulWidget {
  String feedbackType;
  FeedbackUser({this.feedbackType});

  @override
  _FeedbackUserState createState() => _FeedbackUserState();
}

class _FeedbackUserState extends State<FeedbackUser> {
  //feedback = 'cancel' | batalkan pertemuan terjadwal (tampil kolom pesan)
  //feedback = 'finish' | beri ulasan pertemuan(pba dan pcu)(tampil kolom pesan dan bintang)
  //feedback = 'decline'| tolak permintaan pertemuan (tampil kolom pesan)
  //feedback = 'update' | update pesan permintaan ditolak (tampil kolom pesan)

  var rating = 0.0;
  @override
  Widget build(BuildContext context) {
    String feedback = widget.feedbackType.toString();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Feedback'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 8,
              margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 5, 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Membuat Investasi Jangka Panjang 10 Tahun',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Icon(Icons.calendar_today, size: 18),
                                SizedBox(width: 8),
                                Text(
                                  '20/04/2020',
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(width: 50),
                                Icon(Icons.watch_later_outlined, size: 18),
                                SizedBox(width: 8),
                                Text(
                                  '10:00',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(Icons.person, size: 18),
                                SizedBox(width: 8),
                                Text(
                                  'Caca Marica',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined, size: 18),
                                SizedBox(width: 8),
                                Text(
                                  'KC Pondok Indah',
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(width: 20),
                              ],
                            ),
                            SizedBox(height: 15),
                            Divider(
                              color: SharedColor.mainColor,
                              thickness: 3,
                            ),
                            SizedBox(height: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.email, size: 18),
                                    SizedBox(width: 8),
                                    Text(
                                      'Pesan',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    SizedBox(width: 20),
                                  ],
                                ),
                                TextField(
                                  maxLines: null,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                    hintText: 'Tulis Pesan',
                                  ),
                                  //controller: _email,
                                  //onEditingComplete: () => node.nextFocus(),
                                  style: TextStyle(),
                                ),
                                SizedBox(height: 15),
                                feedback == 'finish'
                                    ? Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.thumb_up, size: 18),
                                                SizedBox(width: 8),
                                                Text(
                                                  'Berikan Ulasan',
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 15),
                                            SmoothStarRating(
                                              rating: rating,
                                              isReadOnly: false,
                                              size: 30,
                                              filledIconData: Icons.star,
                                              halfFilledIconData:
                                                  Icons.star_half,
                                              defaultIconData:
                                                  Icons.star_border,
                                              starCount: 5,
                                              allowHalfRating: true,
                                              spacing: 2.0,
                                              onRated: (value) {
                                                //set state rating
                                                print("rating value -> $value");
                                                // print("rating value dd -> ${value.truncate()}");
                                              },
                                            )
                                          ],
                                        ),
                                      )
                                    : SizedBox(height: 0),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Expanded(
                                  child: RaisedButton(
                                      child: Text(
                                        'Simpan',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      padding:
                                          EdgeInsets.only(top: 15, bottom: 15),
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      color: SharedColor.mainColor,
                                      onPressed: () {}),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
