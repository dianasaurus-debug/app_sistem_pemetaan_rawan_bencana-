import 'package:ewarn_app/about.dart';
import 'package:ewarn_app/peta_lokasi_longsor.dart';
import 'package:ewarn_app/peta_rawan_longsor.dart';
import 'package:ewarn_app/peta_riwayat_longsor.dart';

import 'package:ewarn_app/sop_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  Widget build(BuildContext context){
    return Scaffold(
      body:
        ListView(
          padding: EdgeInsets.only(top: 80),
          children: [
        Container(
        color: Colors.white,
        width : double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 60),
                  alignment: Alignment.center,
                  child: Image.asset(
                    'images/header1.png',
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(left: 5, right: 5, top: 15),
                    alignment: Alignment.center,
                    child: Text(
                      'Sistem Peringatan Dini Bencana Tanah Longsor Kabupaten Bojonegoro',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
                    )),
              ],
            ),
            Card(
              margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              color: Color(0xfff8c291),
              clipBehavior: Clip.antiAlias,
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              child:
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                          GestureDetector(
                          onTap: () {
                            Route route = MaterialPageRoute(builder: (context) => PetaLokasiLongsor());
                            Navigator.push(context, route);
                          },
                          child :
                            Card(
                              elevation: 5,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child:SizedBox(
                                width: 130,
                                height: 120,
                                child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "images/location.png",
                                          width: 70.0,
                                          height: 70.0,
                                        ),
                                        Text('Lokasi Longsor',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black, fontFamily: 'Open Sans'))
                                      ],
                                    )
                                ),
                              ),
                            )
                          ),
                            GestureDetector(
                                onTap: () {
                                  Route route = MaterialPageRoute(builder: (context) => PetaRawanLongsor());
                                  Navigator.push(context, route);
                                },
                                child :
                                  Card(
                                        elevation: 5,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child:SizedBox(
                                          width: 130,
                                          height: 120,
                                          child: Center(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    "images/compass.png",
                                                    width: 70.0,
                                                    height: 70.0,
                                                  ),
                                                  Text('Rawan Longsor',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black, fontFamily: 'Open Sans'))
                                                ],
                                              )
                                          ),
                                        ),

                                      )
                            )
                          ]
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                          GestureDetector(
                            onTap: () {
                              Route route = MaterialPageRoute(builder: (context) => PetaRiwayatLongsor());
                              Navigator.push(context, route);
                            },
                            child :
                              Card(
                                elevation: 5,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child:SizedBox(
                                  width: 130,
                                  height: 120,
                                  child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "images/history.png",
                                            width: 70.0,
                                            height: 70.0,
                                          ),
                                          Text('Riwayat Longsor',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black, fontFamily: 'Open Sans'))
                                        ],
                                      )
                                  ),
                                ),
                              )
                          ),
                            GestureDetector(
                                onTap: () {
                                  Route route = MaterialPageRoute(builder: (context) => SOP());
                                  Navigator.push(context, route);
                                },
                                child:
                            Card(
                              elevation: 5,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child:SizedBox(
                                width: 130,
                                height: 120,
                                child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "images/note.png",
                                          width: 70.0,
                                          height: 70.0,
                                        ),
                                        Text('SOP Longsor',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black, fontFamily: 'Open Sans'))
                                      ],
                                    )
                                ),
                              ),

                            )
                          )
                          ]
                      ),
                    ),
                    Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Card(
                              elevation: 5,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child:SizedBox(
                                width: 130,
                                height: 120,
                                child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "images/bpbd.png",
                                          width: 70.0,
                                          height: 70.0,
                                        ),
                                        Text('BPBD Bojonegoro',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black, fontFamily: 'Open Sans'))
                                      ],
                                    )
                                ),
                              ),
                            ),
                          GestureDetector(
                          onTap: () {
                            Route route = MaterialPageRoute(builder: (context) => About());
                            Navigator.push(context, route);
                          },
                          child:
                            Card(
                              elevation: 5,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child:SizedBox(
                                width: 130,
                                height: 120,
                                child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "images/woman.png",
                                          width: 70.0,
                                          height: 70.0,
                                        ),
                                        Text('Tentang',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black, fontFamily: 'Open Sans'))
                                      ],
                                    )
                                ),
                              ),

                            )
                          )
                          ]
                      ),
                    ),
                  ],
                )
              ),
            )
          ],
        ),
      )
        ])
    );
  }
}
