
import 'package:chittoo/Games_Pages/Stories_Pages/story_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:story_view/story_view.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Stories_Page extends StatefulWidget {
  final List<stories_model> storiesModel;
  final String section;

  Stories_Page({super.key, required this.storiesModel, required this.section});

  @override
  State<Stories_Page> createState() => _Stories_PageState();
}

class _Stories_PageState extends State<Stories_Page>
    with SingleTickerProviderStateMixin {
  Icon _favtoure_btn = Icon(Icons.favorite_border);

  List<String> videoid = [
    YoutubePlayer.convertUrlToId(
            "https://youtu.be/crJ_MLrfXMY?si=gsqcAfbASBh4r6Ce")
        .toString(),
    YoutubePlayer.convertUrlToId(
            "https://youtu.be/3gU1OLKBcys?si=np6HCaJGUhSIUBrW")
        .toString()
  ];

  late PageController _pageController = new PageController();

  // List<stories_model> storyModel = widget.storiesModel;
  final StoryController _stories_controller = new StoryController();
  List<stories_model> stories_items1 = [];

  int stories_index = 0;
  List<StoryItem> stories_items = [];
  List<StoryItem> stories_null = [
    StoryItem(
        Container(
          child: Center(child: CircularProgressIndicator()),
        ),
        duration: Duration(seconds: 30))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            StoryView(
              progressPosition: ProgressPosition.top,
              repeat: false,
              inline: true,
              onStoryShow: (storyItem, index) {},
              onComplete: () {
                Navigator.pop(context);
              },
              onVerticalSwipeComplete: (direction) {
                if (direction == Direction.up || direction == Direction.down)
                  Navigator.pop(context);
              },
              indicatorForegroundColor: Colors.white,
              controller: _stories_controller,
              storyItems:
                  stories_items.length != 0 ? stories_items : stories_null,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(top: 30, left: 10),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 20,
                      ),
                      color: Colors.white,
                      onPressed: () {
                        Fluttertoast.showToast(
                            msg: "clciked",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        Navigator.pop(context);
                      },
                    )),
                Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.remove_red_eye,
                        color: Colors.white,
                        size: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "33k watching",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _favtoure_btn = Icon(
                          Icons.favorite,
                          color: Colors.red,
                        );
                      });
                    },
                    icon: _favtoure_btn,
                    color: Colors.white,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_comment,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.file_upload_outlined,
                        color: Colors.white,
                      )),
                  Center(
                    child: Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Comment",
                            prefixIcon: Icon(Icons.emoji_emotions_outlined),
                            suffixIcon: Icon(
                              Icons.send,
                              color: Color(0xFFF57952),
                            )),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        setStories();
      });
    });
    // storyModel = getStories() as List<stories_model>;
  }

  void setStories() {
    final List<stories_model> storiesModel = widget.storiesModel;

    setState(() {
      stories_items1 = storiesModel;
      print("in setStroies" + widget.section);
      print(storiesModel.length.toString() + "leght");
      for (int i = 0; i < storiesModel.length; i++) {
        print("added " + i.toString());
        if (storiesModel.elementAt(i).section?.toLowerCase() ==
            widget.section.toLowerCase()) {
          if (storiesModel.elementAt(i).type == "video") {
            stories_items.add(StoryItem(
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: YoutubePlayer(
                      controller: YoutubePlayerController(
                        initialVideoId:
                            storiesModel.elementAt(i).videoId.toString(),
                        flags: YoutubePlayerFlags(
                            showLiveFullscreenButton: false,
                            startAt: 0,
                            endAt: storiesModel.elementAt(i).duration,
                            disableDragSeek: true,
                            autoPlay: true,
                            loop: true,
                            useHybridComposition: true,
                            hideControls: true,
                            // Hide seek bar and fullscreen button
                            controlsVisibleAtStart:
                                false // Hide seek bar and fullscreen button
                            ),
                      ),
                      showVideoProgressIndicator: false,
                      onReady: () {
                        // _ytbPlayerController.load(storiesModel.elementAt(i).videoId.toString());
                      },
                      onEnded: (YoutubeMetaData metaData) {
                        _stories_controller.next();
                      },
                      progressIndicatorColor: Colors.orange,
                    )),
                duration:
                    Duration(seconds: storiesModel.elementAt(i).duration!)));
          }
          if (storiesModel.elementAt(i).type == "image") {
            print(storiesModel.elementAt(i).link.toString() + i.toString());
            stories_items.add(StoryItem(
                Container(
                    color: Colors.black,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Image.network(
                        storiesModel.elementAt(i).link.toString())),
                duration: Duration(seconds: 10)));
          }
        }

        print(stories_items.length);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // _ytbPlayerController.dispose();
    _stories_controller.dispose();
    super.dispose();
  }
}
