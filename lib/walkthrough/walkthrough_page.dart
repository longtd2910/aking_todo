import '../login/login_page.dart';
import 'walkthrough_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

import '../core/styles.dart';

class WalkThroughPage extends StatefulWidget {
  const WalkThroughPage({Key? key}) : super(key: key);

  @override
  State<WalkThroughPage> createState() => _WalkThroughPageState();
}

class _WalkThroughPageState extends State<WalkThroughPage> with SingleTickerProviderStateMixin {
  int indicator = 0;

  Map<int, Color> indicatorToBackgroundColorMap = {
    0: const Color(0xFFF96060),
    1: const Color(0xFF8560F9),
    2: const Color(0xFF6074F9),
  };

  TweenAnimationBuilder<Color?> animateBackground(int indicator) {
    return TweenAnimationBuilder<Color?>(
      duration: const Duration(milliseconds: 200),
      tween: ColorTween(begin: indicatorToBackgroundColorMap[indicator], end: indicatorToBackgroundColorMap[(indicator == 2) ? 0 : indicator + 1]),
      builder: (BuildContext context, Color? color, Widget? child) {
        return background(color);
      },
    );
  }

  SvgPicture background(Color? color) {
    return SvgPicture.asset(
      'assets/drawable/wt_background.svg',
      color: color,
      width: MediaQuery.of(context).size.width,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              bottom: -20,
              left: 0,
              right: 0,
              child: animateBackground(indicator),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: CarouselSlider(
                    items: const [
                      WalkthroughContent(
                        title: 'Welcome to Aking',
                        description: 'What is going to happen tomorrow?',
                        imgAsset: 'wt1',
                      ),
                      WalkthroughContent(
                        title: 'Work happens',
                        description: 'Get notified when work happens.',
                        imgAsset: 'wt2',
                      ),
                      WalkthroughContent(
                        title: 'Task and assign',
                        description: 'Task and assign them to colleagues.',
                        imgAsset: 'wt3',
                      )
                    ],
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 55 / 100,
                      enableInfiniteScroll: false,
                      viewportFraction: 1,
                      onPageChanged: (page, reason) {
                        setState(() {
                          indicator = page;
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 110),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 8,
                        width: 8,
                        margin: const EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (indicator == 0) ? Colors.black : const Color(0xFF979797),
                        ),
                      ),
                      Container(
                        height: 8,
                        width: 8,
                        margin: const EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (indicator == 1) ? Colors.black : const Color(0xFF979797),
                        ),
                      ),
                      Container(
                        height: 8,
                        width: 8,
                        margin: const EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (indicator == 2) ? Colors.black : const Color(0xFF979797),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 80 / 100,
                  margin: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                          child: const LoginPage(),
                          type: PageTransitionType.rightToLeft,
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      elevation: MaterialStateProperty.all(5),
                    ),
                    child: const Text(
                      'Get Started',
                      style: RobotoItalic(color: Color(0xFF000000)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
