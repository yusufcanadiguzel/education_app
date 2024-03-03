import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';

/// Stateful widget to fetch and then display video content.
class LessonVideo extends StatefulWidget {
  const LessonVideo({
    Key? key,
    required this.videoUrl,
  }) : super(key: key);

  final String videoUrl;

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<LessonVideo> {
  late CustomVideoPlayerController _custumVideoPlayerController;

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomVideoPlayer(
          customVideoPlayerController: _custumVideoPlayerController),
    );
  }

  void initializeVideoPlayer() {
    CachedVideoPlayerController _videoPlayerController;
    _videoPlayerController =
        CachedVideoPlayerController.network(widget.videoUrl)
          ..initialize().then((value) {
            setState(() {});
          });
    _custumVideoPlayerController = CustomVideoPlayerController(
        context: context, videoPlayerController: _videoPlayerController);
  }
}
