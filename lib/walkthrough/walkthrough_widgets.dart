import 'package:flutter/material.dart';

import '../core/styles.dart';

class SlideStateButton extends StatefulWidget {
  const SlideStateButton({Key? key}) : super(key: key);

  @override
  State<SlideStateButton> createState() => _SlideStateButtonState();
}

class _SlideStateButtonState extends State<SlideStateButton> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WalkthroughContent extends StatelessWidget {
  final String title;
  final String description;
  final String imgAsset;

  const WalkthroughContent({Key? key, required this.title, required this.description, required this.imgAsset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/drawable/$imgAsset.png',
          height: MediaQuery.of(context).size.height * 30 / 100,
        ),
        Container(
          margin: const EdgeInsets.only(top: 50, bottom: 20),
          child: Text(
            title,
            style: const RobotoItalic(fontSize: 24),
          ),
        ),
        Text(
          description,
          style: const RobotoMedium(),
        ),
      ],
    );
  }
}
