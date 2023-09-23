import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:music_app_getx/presentation/homepage/home_page.dart';


class ScreenIntro extends StatelessWidget {
  ScreenIntro({Key? key}) : super(key: key);

  final introKey = GlobalKey<IntroductionScreenState>();
  final List<String> imagePaths = [
    'assets/microphone_img.jpg',
    'assets/recently_img.jpg',
    'assets/vinyl-player.jpg',
    'assets/vinyl-player.jpg',
  ];

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) =>  HomePage()),
    );
  }

  Widget _buildImageList(List<String> imagePaths, int index,
      ) {
    if (index >= 0 && index < imagePaths.length) {
      return Image.asset(
        imagePaths[index],
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    final pageDecoration = PageDecoration(
      titleTextStyle: GoogleFonts.inconsolata(
        fontSize: 28.0,
        fontWeight: FontWeight.w700,
      ),
      bodyTextStyle: GoogleFonts.inconsolata(),
      bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      infiniteAutoScroll: true,
      pages: [
        PageViewModel(
          title: "Pablo Casals",
          body:
              "Music is the divine way to tell beautiful, poetic things to the heart.",
          image: _buildImageList(imagePaths, 0),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Jean Paul Friedrich Richter",
          body: "Music is the moonlight in the gloomy night of life.",
          image: _buildImageList(imagePaths, 1),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Friedrich Nietzsche",
          body: "Without music, life would be a mistake..",
          image: _buildImageList(imagePaths, 2),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Bono",
          body: "Music can change the world because it can change people.",
          image: _buildImageList(imagePaths, 3),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      skip: Text(
        'Skip',
        style: GoogleFonts.inconsolata(fontWeight: FontWeight.w600,color: Colors.black),
      ),
      next: const Icon(Icons.arrow_forward,color: Colors.black,),
      done: Text(
        'Home',
        style: GoogleFonts.inconsolata(fontWeight: FontWeight.w600,color: Colors.black),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: ShapeDecoration(
        color: Colors.red.withAlpha(20),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
      ),
    );
  }
}
