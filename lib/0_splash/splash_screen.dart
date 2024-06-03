import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'package:drum/1_main/main_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late VideoPlayerController _controller;
  bool _isVidEnded = false;

  @override
  void initState() {
    _controller = VideoPlayerController.asset('assets/videos/splash.mp4')
      ..initialize().then((_) {
        _controller.setLooping(false);
        setState(() {});
        _controller.play().whenComplete(() {});
      });
    super.initState();

    Timer(
      const Duration(seconds: 5),
      () {
        setState(() {
          _isVidEnded = true;
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => const MainScreen()));
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                          width: _controller.value.size.width,
                          height: _controller.value.size.height,
                          child: VideoPlayer(_controller))),
                )
              : const CircularProgressIndicator(),
        ),
        GestureDetector(onTap: () {
          if (_isVidEnded) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => const MainScreen()));
          }
        }),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
}
