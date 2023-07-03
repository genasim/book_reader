import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/firebase_providers.dart';
import '../size_data.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              onPressed: () => ref.read(authServiceProvider).signInAnon(),
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
