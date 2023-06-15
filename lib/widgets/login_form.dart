import 'package:flutter/material.dart';

import '../size_data.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: defaultSize),
          width: defaultSize * 21.5,
          child: const TextField(
            keyboardType: TextInputType.emailAddress,
            obscureText: true,
            decoration: InputDecoration(label: Text('Email')),
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: defaultSize),
          width: defaultSize * 21.5,
          child: const TextField(
            keyboardType: TextInputType.emailAddress,
            obscureText: true,
            decoration: InputDecoration(label: Text('Password')),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: defaultSize * 1.6),
          child: ElevatedButton(
              onPressed: () {},
              child: SizedBox(
                width: defaultSize * 8.5,
                child: const Center(child: Text('Log in')),
              )),
        ),
        const Text(
          'Sign up',
          style: TextStyle(decoration: TextDecoration.underline),
        ),
        SizedBox(height: defaultSize),
        const Text(
          'Forgot password?',
          style: TextStyle(decoration: TextDecoration.underline),
        ),
      ],
    );
  }
}
