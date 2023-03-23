import '../core/utils.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../core/styles.dart';
import 'forgot_password_result_page.dart';

class ForgotPasswordFormPage extends StatefulWidget {
  final String email;

  const ForgotPasswordFormPage({super.key, required this.email});

  @override
  State<ForgotPasswordFormPage> createState() => _ForgotPasswordFormPageState();
}

class _ForgotPasswordFormPageState extends State<ForgotPasswordFormPage> {
  final _enterCodeFocusNode = FocusNode();
  final _enterCodeController = TextEditingController();
  final _passwordFocusNode = FocusNode();
  final _passwordController = TextEditingController();
  final _reEnterPasswordFocusNode = FocusNode();
  final _reEnterPasswordController = TextEditingController();

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
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              _enterCodeFocusNode.unfocus();
              _passwordFocusNode.unfocus();
              _reEnterPasswordFocusNode.unfocus();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 60,
                    bottom: 60,
                  ),
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    child: const Icon(Icons.arrow_back),
                    onTap: () {},
                  ),
                ),
                const Text(
                  'Reset Password',
                  style: RobotoThinItalic(fontSize: 32, color: Colors.black),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Reset code was sent to your email. Please enter the code and creae new password',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: RobotoMedium(fontSize: 16, color: Color(0xFF9B9B9B)),
                ),
                const SizedBox(height: 48),
                const Text(
                  'Enter code',
                  style: RobotoMedium(fontSize: 20, color: Colors.black),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _enterCodeController,
                  focusNode: _enterCodeFocusNode,
                  obscureText: true,
                  decoration: const InputDecoration(hintText: 'Enter new password'),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Enter new password',
                  style: RobotoMedium(fontSize: 20, color: Colors.black),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  obscureText: true,
                  decoration: const InputDecoration(hintText: 'Enter new password'),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Confirm new password',
                  style: RobotoMedium(fontSize: 20, color: Colors.black),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _reEnterPasswordController,
                  focusNode: _reEnterPasswordFocusNode,
                  obscureText: true,
                  decoration: const InputDecoration(hintText: 'Confirm new password'),
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
                          child: ForgotPasswordResultPage(
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
                      'Change password',
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
      ),
    );
  }
}
