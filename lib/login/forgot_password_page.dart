import 'package:aking_todo/core/utils.dart';
import 'package:flutter/material.dart';

import '../core/styles.dart';

class ForgotPasswordPage extends StatefulWidget {
  final String placeholderEmail;

  const ForgotPasswordPage({super.key, required this.placeholderEmail});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late final String email;
  final _usernameFocusNode = FocusNode();
  final usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    email = Utils.isEmailValid(widget.placeholderEmail) ? widget.placeholderEmail : '';
    usernameController.text = email;
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
              _usernameFocusNode.unfocus();
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
                  'Forgot Password',
                  style: RobotoThinItalic(fontSize: 32, color: Colors.black),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Please enter your email below to receive your password reset instructions',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: RobotoMedium(fontSize: 16, color: Color(0xFF9B9B9B)),
                ),
                const SizedBox(height: 48),
                const Text(
                  'Username',
                  style: RobotoMedium(fontSize: 20, color: Colors.black),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: usernameController,
                  focusNode: _usernameFocusNode,
                  decoration:
                      const InputDecoration(hintText: 'Enter your username'),
                ),
                const SizedBox(height: 80),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFFF96060)),
                      elevation: MaterialStateProperty.all(5),
                    ),
                    child: const Text(
                      'Send Request',
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