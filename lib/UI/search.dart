// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/model.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CupertinoSearchTextField(
            backgroundColor: Colors.grey.withOpacity(0.4),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            suffixIcon: Icon(
              CupertinoIcons.xmark_circle_fill,
              color: Colors.grey,
            ),
            style: TextStyle(color: Colors.white24),
          ),
          SizedBox(
            height: 20,
          ),
          // Expanded(child: SearchIdleWidget()),
          Expanded(child: SearchIdleWidget())
        ],
      ),
    )));
  }
}

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchTextTitle(
                title: "Top Searches",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FutureBuilder(
                future: getPopular(),
                builder: (context, snapshot) {
                  return ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (ctx, index) => SizedBox(
                      height: 20,
                    ),
                    itemCount: popular.length,
                    itemBuilder: (ctx, index) {
                      return ListTile(
                        leading: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'http://image.tmdb.org/t/p/w500' +
                                          popular[index]['backdrop_path']),
                                  fit: BoxFit.cover)),
                        ),
                        title: Text(
                          popular[index]['original_title'],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        trailing: Icon(
                          Icons.play_circle_outline_sharp,
                          color: Colors.white,
                          size: 50,
                        ),
                      );
                    },
                  );
                })
          ],
        ),
      ],
    );
  }
}

class SearchTextTitle extends StatelessWidget {
  final String title;
  const SearchTextTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}

// class TopSearch extends StatelessWidget {
//   const TopSearch({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final screenwidth = MediaQuery.of(context).size.width;
//     return Row(
//       children: [
//         Container(
//           width: screenwidth * 0.35,
//           height: 65,
//           decoration: BoxDecoration(
//               image: DecorationImage(image: NetworkImage(), fit: BoxFit.cover)),
//         ),
//         Expanded(
//             child: Text(
//           "Movie Name",
//           style: TextStyle(
//               color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
//         )),
//         Icon(
//           Icons.play_circle_outline_sharp,
//           color: Colors.white,
//           size: 50,
//         )
//       ],
//     );
//   }
// }

// class SearchResult extends StatelessWidget {
//   const SearchResult({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SearchTextTitle(title: 'Movies & TV'),
//         SizedBox(
//           height: 10,
//         ),
//         Expanded(
//             child: GridView.count(
//           shrinkWrap: true,
//           crossAxisCount: 3,
//           mainAxisSpacing: 8,
//           childAspectRatio: 1.2 / 1.4,
//           crossAxisSpacing: 5,
//           children: List.generate(20, (index) {
//             return MainCard();
//           }),
//         ))
//       ],
//     );
//   }
// }

// class MainCard extends StatelessWidget {
//   const MainCard({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           image:
//               DecorationImage(image: NetworkImage(imageurl), fit: BoxFit.cover),
//           borderRadius: BorderRadius.circular(7)),
//     );
//   }
// }
