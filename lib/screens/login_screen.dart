import 'package:book_reader/size_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LoginForm(),
              SizedBox(height: defaultSize * 4),
              Padding(
                padding: EdgeInsets.only(bottom: defaultSize),
                child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/google_logo.svg',
                      height: defaultSize * 3,
                    ),
                    label: SizedBox(
                      width: defaultSize * 15.5,
                      child: const Center(child: Text('Log in with Google')),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: defaultSize),
                child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/apple_logo.svg',
                      height: defaultSize * 3,
                    ),
                    label: SizedBox(
                      width: defaultSize * 15.5,
                      child: const Center(child: Text('Log in with Apple ID')),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
