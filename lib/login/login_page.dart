import 'package:aking_todo/core/styles.dart';
import 'package:aking_todo/login/forgot_password_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

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
              _passwordFocusNode.unfocus();
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
                  'Welcome back',
                  style: RobotoThinItalic(fontSize: 32, color: Colors.black),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Sign in to continue',
                  style: RobotoMedium(fontSize: 16, color: Color(0xFF9B9B9B)),
                ),
                const SizedBox(height: 48),
                const Text(
                  'Username',
                  style: RobotoMedium(fontSize: 20, color: Colors.black),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _usernameController,
                  focusNode: _usernameFocusNode,
                  decoration:
                      const InputDecoration(hintText: 'Enter your username'),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Password',
                  style: RobotoMedium(fontSize: 20, color: Colors.black),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  decoration:
                      const InputDecoration(hintText: 'Enter your password'),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                            child: ForgotPasswordPage(
                              placeholderEmail: _usernameController.text,
                            ),
                            type: PageTransitionType.rightToLeft,
                          ),
                        );
                      },
                      child: const Text(
                        'Forgot password?',
                        style: RobotoThinItalic(
                          fontSize: 18,
                          color: Color(0xFF313131),
                        ),
                      ),
                    ),
                  ],
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
      ),
    );
  }
}
