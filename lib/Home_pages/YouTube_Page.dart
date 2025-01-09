
import 'package:chittoo/Home_pages/Question_Page_container.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTube_Page extends StatefulWidget {
  const YouTube_Page({super.key});

  @override
  State<YouTube_Page> createState() => _YouTube_PageState();
}

class _YouTube_PageState extends State<YouTube_Page> {
  late YoutubePlayerController _ytbPlayerController;
  bool _tapped = false;
  Color _myColor = const Color(0xC7F7F7F7);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          color: _myColor,
          height: size.height,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: _ytbPlayerController != null
                    ? GestureDetector(
                        onTap: () {
                          if (!_tapped) {
                            _ytbPlayerController.pause();
                            _tapped = true;
                          } else {
                            _ytbPlayerController.play();
                            _tapped = false;
                          }
                        },
                        child: YoutubePlayer(
                          controller: _ytbPlayerController,
                          showVideoProgressIndicator: false,

                          onEnded: (YoutubeMetaData metaData) {

                            // When the video ends, seek back to the start

                            _ytbPlayerController.seekTo(const Duration(seconds: 30));
                          },
                          progressIndicatorColor: Colors.orange,
                        ),
                      )
                    : const Center(child: Text("")),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20,bottom: 20),
                    child: const Question_Page_container(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    String? videoId;
    videoId = YoutubePlayer.convertUrlToId(
        "https://youtu.be/3gU1OLKBcys?si=np6HCaJGUhSIUBrW");

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        _ytbPlayerController = YoutubePlayerController(
          initialVideoId: videoId.toString(),
          flags: const YoutubePlayerFlags(
              startAt: 30,
              // Start at 30 seconds
              endAt: 60,
              showLiveFullscreenButton: false,
              disableDragSeek: true,
              autoPlay: true,
              loop: true,
              useHybridComposition: true,
              hideControls: true,
              // Hide seek bar and fullscreen button
              controlsVisibleAtStart:
                  false // Hide seek bar and fullscreen button
              ),
        );
      });
    });
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _ytbPlayerController.dispose();
    super.deactivate();
  }

  @override
  void dispose() {
    _ytbPlayerController.dispose();

    super.dispose();
  }
}
