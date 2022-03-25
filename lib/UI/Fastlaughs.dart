import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix/model.dart';

class FastLaughs extends StatelessWidget {
  const FastLaughs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView(
              scrollDirection: Axis.vertical,
              children: List.generate(10, (index) {
                return VideoListItem(index: index);
              }))),
    );
  }
}

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          future: getUpComing(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List upcoming = snapshot.data as List;
              return PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: upcoming.length,
                  itemBuilder: (ctx, index) {
                    return Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height -
                              MediaQuery.of(context).padding.top -
                              kBottomNavigationBarHeight,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  'http://image.tmdb.org/t/p/w500' +
                                      upcoming[index]['poster_path'],
                                ),
                                fit: BoxFit.fill),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.black54,
                                  radius: 30,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const FaIcon(
                                          FontAwesomeIcons.volumeMute)),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: CircleAvatar(
                                        radius: 30,
                                        backgroundImage: NetworkImage(
                                          'http://image.tmdb.org/t/p/w500' +
                                              upcoming[index]['poster_path'],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const ActionButton(
                                        icon: Icons.emoji_emotions_rounded,
                                        title: "LOL"),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const ActionButton(
                                        icon: Icons.add, title: "My List"),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: Column(
                                        children: const [
                                          FaIcon(
                                            FontAwesomeIcons.telegramPlane,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          Text(
                                            "Share",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const ActionButton(
                                        icon: Icons.play_arrow, title: "Play")
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;

  final String title;
  const ActionButton({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          )
        ],
      ),
    );
  }
}
