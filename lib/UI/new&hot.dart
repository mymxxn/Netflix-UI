import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/model.dart';

class NewHot extends StatelessWidget {
  const NewHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Text(
            "Hot and new",
            style: GoogleFonts.montserrat(
                fontSize: 25, fontWeight: FontWeight.w800),
          ),
          actions: [
            const Icon(
              Icons.cast,
              size: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              icon: Image.asset(
                'assets/avatar.png',
                height: 30,
              ),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.white,
              labelColor: Colors.black,
              labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              indicator: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(50)),
              tabs: [
                Tab(
                  text: "🍿 Coming Soon",
                ),
                Tab(
                  text: "👀 Everyone's watching",
                )
              ]),
        ),
        body: TabBarView(children: [_comingsoon(context), _everyones(context)]),
      ),
    );
  }

  Widget _comingsoon(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: getUpComing(),
      builder: (context, snapshot) {
        Future.delayed(Duration(seconds: 3), () {});
        if (snapshot.hasData) {
          List upcoming = snapshot.data as List;
          return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 50,
                            height: 450,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  upcoming[index]['release_date'],
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width - 50,
                            height: 500,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    SizedBox(
                                        width: double.infinity,
                                        height: 200,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  'http://image.tmdb.org/t/p/w500' +
                                                      upcoming[index]
                                                          ['backdrop_path'],
                                                ),
                                                fit: BoxFit.cover),
                                          ),
                                        )),
                                    Positioned(
                                      bottom: 10,
                                      right: 10,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.black54,
                                        radius: 25,
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: const FaIcon(
                                                FontAwesomeIcons.volumeMute)),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      upcoming[index]['title'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: -2,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Icon(
                                              Icons.notifications_none_outlined,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                            Text(
                                              "Remind Me",
                                              style: TextStyle(
                                                  letterSpacing: -1,
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          children: [
                                            Icon(
                                              Icons.info_outline,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                            Text(
                                              "Info",
                                              style: TextStyle(
                                                letterSpacing: -1,
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  upcoming[index]['title'],
                                  style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  upcoming[index]['overview'],
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                        ]),
                  ],
                );
              });
        }
        return Container();
      },
    );
  }

  Widget _everyones(BuildContext context) {
    return FutureBuilder(
      future: getPopular(),
      builder: (context, snapshot) {
        Future.delayed(Duration(seconds: 3), () {});
        if (snapshot.hasData) {
          List popular = snapshot.data as List;
          return ListView.builder(
              //           scrollDirection: Axis.vertical,
              itemCount: popular.length,
              //           shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 180,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  'http://image.tmdb.org/t/p/w500' +
                                      popular[index]['backdrop_path'],
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: CircleAvatar(
                            backgroundColor: Colors.black54,
                            radius: 25,
                            child: IconButton(
                                onPressed: () {},
                                icon:
                                    const FaIcon(FontAwesomeIcons.volumeMute)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          popular[index]['title'],
                          style: TextStyle(
                              letterSpacing: -2,
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Column(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.telegramPlane,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                Text(
                                  "Share",
                                  style: TextStyle(
                                    letterSpacing: -1,
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                Text(
                                  "My List",
                                  style: TextStyle(
                                    letterSpacing: -1,
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                Text(
                                  "Play",
                                  style: TextStyle(
                                    letterSpacing: -1,
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      popular[index]['title'],
                      style: TextStyle(
                          color: Colors.grey[400], fontWeight: FontWeight.bold),
                    ),
                    Text(
                      popular[index]['overview'],
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                );
              });
        }
        return Container();
      },
    );
  }
}
