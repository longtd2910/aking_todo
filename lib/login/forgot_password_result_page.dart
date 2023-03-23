import 'login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

import '../core/styles.dart';

class ForgotPasswordResultPage extends StatefulWidget {
  final String email;

  const ForgotPasswordResultPage({super.key, required this.email});

  @override
  State<ForgotPasswordResultPage> createState() => _ForgotPasswordResultPageState();
}

class _ForgotPasswordResultPageState extends State<ForgotPasswordResultPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 7 / 100,
            right: MediaQuery.of(context).size.width * 7 / 100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SvgPicture.asset(
                'assets/drawable/change_password_success.svg',
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 20),
              const Text(
                'Succesful!',
                textAlign: TextAlign.center,
                style: RobotoThinItalic(fontSize: 32, color: Colors.black),
              ),
              const SizedBox(height: 20),
              const Text(
                'You have succesfully change password. Please use your new passwords when logging in.',
                textAlign: TextAlign.center,
                style: RobotoMedium(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 80),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                        child: LoginPage(
                          email: widget.email,
                        ),
                        type: PageTransitionType.rightToLeft,
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color(0xFFF96060)),
                    elevation: MaterialStateProperty.all(5),
                  ),
                  child: const Text(
                    'Login',
                    style: RobotoThinItalic(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
