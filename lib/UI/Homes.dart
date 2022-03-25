import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/UI/search.dart';
import 'package:netflix/currrent.dart';
import 'package:netflix/model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Stack(
                    //   children: [
                    //     Container(
                    //       height: 480,
                    //       // decoration: BoxDecoration(image: DecorationImage(image: Image.network())),
                    //       child:  Image.network(
                    //                           'http://image.tmdb.org/t/p/w500' +
                    //                               popularmovies[5]['poster_path'],
                    //     )
                    //   ],
                    // )
                    Stack(
                      children: [
                        FutureBuilder(
                            future: getPopular(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                List popularmovies = snapshot.data as List;
                                return SizedBox(
                                  width: double.infinity,
                                  child: Container(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height /
                                        1.5,
                                    foregroundDecoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.black.withOpacity(1),
                                          Colors.black.withOpacity(0.8),
                                          Colors.black.withOpacity(0.2),
                                          Colors.black.withOpacity(1)
                                        ],
                                        end: Alignment.topCenter,
                                        begin: Alignment.bottomCenter,
                                        stops: [0, 0.0, 0, 15],
                                      ),
                                    ),
                                    child: Image.network(
                                      'http://image.tmdb.org/t/p/w500' +
                                          popularmovies[5]['poster_path'],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                );
                              }
                              return Container();
                            }),
                        Column(
                          children: [
                            const SizedBox(
                              height: 365,
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Triller  ',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                    Icon(
                                      Icons.circle,
                                      color: Colors.blue,
                                      size: 5,
                                    ),
                                    Text(
                                      '  Exciting  ',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                    Icon(
                                      Icons.circle,
                                      color: Colors.blue,
                                      size: 5,
                                    ),
                                    Text(
                                      '  Action ',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                    Icon(
                                      Icons.circle,
                                      color: Colors.blue,
                                      size: 5,
                                    ),
                                    Text(
                                      '  Inspiring ',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Positioned(
                              right: 0,
                              left: 0,
                              bottom: 0,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        Text(
                                          "My List",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        )
                                      ],
                                    ),
                                    TextButton.icon(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.white)),
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.play_arrow,
                                          size: 25,
                                          color: Colors.black,
                                        ),
                                        label: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 0),
                                          child: Text(
                                            "Play",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                        )),
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.info_outline,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        Text(
                                          "Info",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: SafeArea(
                    child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/netflix.png",
                                width: 35,
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.cast),
                              color: Colors.white,
                              iconSize: 30,
                            ),
                            IconButton(
                              icon: Image.asset(
                                'assets/avatar.png',
                                height: 30,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "TV Shows",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        Text(
                          "Movies",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        InkWell(
                          onTap: () async {
                            return showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return Scaffold(
                                    backgroundColor: Colors.transparent,
                                    body: Container(
                                      color: Colors.transparent,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: categories.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const SizedBox(height: 50),
                                              categories[index] == "Home"
                                                  ? Text(
                                                      categories[index],
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  : Text(
                                                      categories[index],
                                                      style: const TextStyle(
                                                          color: Colors.white70,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                              const SizedBox(
                                                height: 20,
                                              )
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                    floatingActionButton: FloatingActionButton(
                                      backgroundColor: Colors.white,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.black,
                                      ),
                                    ),
                                    floatingActionButtonLocation:
                                        FloatingActionButtonLocation
                                            .centerFloat,
                                  );
                                });
                          },
                          child: Row(
                            children: const [
                              Text(
                                "Categories",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                              Icon(
                                Icons.arrow_drop_down_sharp,
                                color: Colors.white,
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Released in the past year",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: FutureBuilder(
              future: getUpComing(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List popular = snapshot.data as List;
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: popular.length - 1,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Movies(
                                        movie: popular[index],
                                      ))),
                          child: SizedBox(
                            width: 145,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Container(
                                    height: 170,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(6)),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          'http://image.tmdb.org/t/p/w500' +
                                              popular[index]['poster_path'],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                }
                return Container();
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Trending Now",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: FutureBuilder(
              future: getTopRated(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List toprated = snapshot.data as List;
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: popular.length - 1,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Movies(
                                        movie: toprated[index],
                                      ))),
                          child: SizedBox(
                            width: 145,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Container(
                                    height: 170,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(6)),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          'http://image.tmdb.org/t/p/w500' +
                                              toprated[index]['poster_path'],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                }
                return Container();
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Top 10 TV Shows In India Today",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: FutureBuilder(
                future: getPopular(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List topTen = snapshot.data as List;
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Container(
                                width: 160,
                              ),
                              Positioned(
                                left: 25,
                                child: InkWell(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Movies(
                                                movie: topTen[index],
                                              ))),
                                  child: SizedBox(
                                    width: 145,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 170,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(6)),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  'http://image.tmdb.org/t/p/w500' +
                                                      topTen[index]
                                                          ['poster_path'],
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 80,
                                left: 5,
                                bottom: 10,
                                child: BorderedText(
                                  strokeColor: Colors.white,
                                  strokeWidth: 10.0,
                                  child: Text(
                                    '${index + 1}',
                                    style: const TextStyle(
                                        fontSize: 110,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none,
                                        decorationColor: Colors.black),
                                  ),
                                ),
                              ),
                              index == 1
                                  ? Container()
                                  : Container(
                                      width: 30,
                                      height: 300,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomRight,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            Colors.transparent,
                                            Colors.black,
                                          ],
                                        ),
                                      ),
                                    ),
                            ],
                          );
                        });
                  }
                  return Container();
                }),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Tense Dramas",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: FutureBuilder(
              future: gettvshows(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List tvshows = snapshot.data as List;
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: tvshows.length - 1,
                      itemBuilder: (context, index) {
                        return InkWell(
                          // onTap: () => Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Movies(
                          //               movie: tvshows[index],
                          //             ))),
                          child: SizedBox(
                            width: 145,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Container(
                                    height: 170,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(6)),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          'http://image.tmdb.org/t/p/w500' +
                                              tvshows[index]['poster_path'],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
