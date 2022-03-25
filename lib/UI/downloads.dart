import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Downloads extends StatelessWidget {
  const Downloads({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List images = [
      "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/mikrpR6NNr0SSlHBhI64WAjrokT.jpg",
      "https://www.themoviedb.org/t/p/original/gDoareEtuBpFd3Do50NXNP2dJbQ.jpg",
      "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/34Ks9lSiOAPpW13tb0m4PMUkVYc.jpg"
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Text(
            "Downloads",
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
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Smart Downloads",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Text(
              "Introducing Downloads for You",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "We'll download a personalized selecton of\nmovies and shows for you, so there's\nalways something to watch on your\ndevice",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            Container(
              color: Colors.transparent,
              width: size.width,
              height: size.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                      child: CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.5),
                    radius: size.width * 0.38,
                  )),
                  Transform.rotate(
                    angle: 18 * pi / 180,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: Container(
                        margin: EdgeInsets.only(left: 140, bottom: 10),
                        width: size.width * 0.4,
                        height: size.width * 0.58,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(images[0]))),
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: -18 * pi / 180,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: Container(
                        margin: EdgeInsets.only(right: 140, bottom: 10),
                        width: size.width * 0.4,
                        height: size.width * 0.58,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(images[1]))),
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        width: size.width * 0.4,
                        height: size.height * 0.70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage(images[2]))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: Colors.blueAccent[700],
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Set Up",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: Colors.white,
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "See What You Can Download",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
