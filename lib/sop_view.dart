import 'package:flutter/material.dart';

class SOP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('SOP',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white, fontFamily: 'Open Sans')),
              backgroundColor: Color(0xfff8c291),
              bottom: TabBar(
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
                tabs: [
                  Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text('Pra Bencana',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white, fontFamily: 'Open Sans'))
                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text('Saat Bencana',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white, fontFamily: 'Open Sans'))
                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text('Pasca Bencana',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white, fontFamily: 'Open Sans'))
                  ),
                ],
              ),
            ),
          body: TabBarView(
            children: [
              ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 30, top: 15),
                children: [
                    for( var i = 1 ; i <=5; i++ ) Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child:
                          Padding(
                              padding: EdgeInsets.all(10),
                              child: ListTile(
                                contentPadding:EdgeInsets.all(0),
                                leading:CircleAvatar(
                                  backgroundColor: Color(0xfff8c291),
                                  radius: 50,
                                  child:
                                  Text(
                                      i.toString(), // ambil karakter pertama text
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20, color: Colors.white, fontFamily: 'Open Sans')
                                  ),
                                ),
                                title:
                                Transform(
                                  transform: Matrix4.translationValues(-16, 0.0, 0.0),
                                  child:   Text('Segera evakuasi untuk menjauhi suara gemuruh atau arah datangnya longsoran.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.2, color: Colors.black, fontFamily: 'Open Sans')),
                                ),
                              )
                          )

                      ),
                ],
              ),
              ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 30, top: 15),
                children: [
                  for( var i = 1 ; i <=5; i++ ) Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: ListTile(
                            contentPadding:EdgeInsets.all(0),
                            leading:CircleAvatar(
                              backgroundColor: Color(0xfff8c291),
                              radius: 50,
                              child:
                              Text(
                                  i.toString(), // ambil karakter pertama text
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20, color: Colors.white, fontFamily: 'Open Sans')
                              ),
                            ),
                            title:
                            Transform(
                              transform: Matrix4.translationValues(-16, 0.0, 0.0),
                              child:   Text('Segera evakuasi untuk menjauhi suara gemuruh atau arah datangnya longsoran.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.2, color: Colors.black, fontFamily: 'Open Sans')),
                            ),
                          )
                      )

                  ),
                ],
              ),
              ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 30, top: 15),
                children: [
                  for( var i = 1 ; i <=5; i++ ) Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: ListTile(
                            contentPadding:EdgeInsets.all(0),
                            leading:CircleAvatar(
                              backgroundColor: Color(0xfff8c291),
                              radius: 50,
                              child:
                              Text(
                                  i.toString(), // ambil karakter pertama text
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20, color: Colors.white, fontFamily: 'Open Sans')
                              ),
                            ),
                            title:
                            Transform(
                              transform: Matrix4.translationValues(-16, 0.0, 0.0),
                              child:   Text('Segera evakuasi untuk menjauhi suara gemuruh atau arah datangnya longsoran.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.2, color: Colors.black, fontFamily: 'Open Sans')),
                            ),
                          )
                      )

                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }
}