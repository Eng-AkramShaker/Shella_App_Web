import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/app_images.dart';
import '../../../images/custom_Images.dart';

class VideoLogoWidget extends StatefulWidget {
  const VideoLogoWidget({super.key});

  @override
  State<VideoLogoWidget> createState() => _VideoLogoWidgetState();
}

class _VideoLogoWidgetState extends State<VideoLogoWidget> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    _controller = VideoPlayerController.asset(AppImages.onboarding)
      ..setLooping(true)
      ..initialize().then((_) {
        setState(() => _isInitialized = true);
        _controller.setVolume(0.0);
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.gryColor_3),
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 3,
      color: AppColors.backgroundColor,
      child: SizedBox(
        width: 111,
        height: 50,
        child: _isInitialized
            ? VideoPlayer(_controller)
            : custom_Images_asset(
          image: AppImages.logo,
          h: 50,
          w: 111,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}