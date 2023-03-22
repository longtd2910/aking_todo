import 'package:aking_todo/core/styles.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 7 / 100,
            right: MediaQuery.of(context).size.width * 7 / 100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                child: InkWell(
                  child: Icon(Icons.arrow_back),
                  onTap: () {},
                ),
              ),
              const Text(
                'Welcome back',
                style: RobotoThinItalic(fontSize: 32, color: Color(0xFF313131)),
              ),
              const Text(
                'Sign in to continue',
                style: RobotoMedium(fontSize: 16, color: Color(0xFF9B9B9B)),
              ),
              const Text(
                'Username',
                style: RobotoMedium(fontSize: 20, color: Color(0xFF9B9B9B)),
              ),
              const TextField(
                decoration: InputDecoration(hintText: 'Enter your username'),
              ),
              const Text(
                'Password',
                style: RobotoMedium(fontSize: 20, color: Color(0xFF9B9B9B)),
              ),
              const TextField(
                decoration: InputDecoration(hintText: 'Enter your password'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  InkWell(
                    child: Text(
                      'Forgot password?',
                      style: RobotoThinItalic(
                        fontSize: 18,
                        color: Color(0xFF313131),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
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
