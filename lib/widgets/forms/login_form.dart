import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/firebase_providers.dart';
import '../../sevices/mock_constants.dart';
import '../../size_data.dart';

final _formKey = GlobalKey<FormState>();

final _emailController = TextEditingController();
final _passwordController = TextEditingController();

class LoginForm extends ConsumerWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onLogin() {
      if (_formKey.currentState == null) return;

      if (!_formKey.currentState!.validate()) return;

      final email = _emailController.text;
      final password = _passwordController.text;

      ref.read(authServiceProvider).signInEmailPassword(
            email: email,
            pass: password,
          );
    }

    _emailController.text = '';
    _passwordController.text = '';

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          /// Email field
          Container(
            padding: EdgeInsets.only(bottom: defaultSize),
            width: defaultSize * 21.5,
            child: TextFormField(
              controller: _emailController,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Required field';

                if (!emailRegex.hasMatch(value)) return 'Invalid email syntax';

                return null;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(label: Text('Email')),
            ),
          ),

          /// Password field
          Container(
            padding: EdgeInsets.only(bottom: defaultSize),
            width: defaultSize * 21.5,
            child: TextFormField(
              controller: _passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Required field';

                return null;
              },
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: const InputDecoration(label: Text('Password')),
            ),
          ),

          /// Login button
          Padding(
            padding: EdgeInsets.only(bottom: defaultSize * 1.6),
            child: ElevatedButton(
                onPressed: onLogin,
                child: SizedBox(
                  width: defaultSize * 8.5,
                  child: const Center(child: Text('Log in')),
                )),
          ),
          SizedBox(height: defaultSize),
          const Text(
            'Forgot password?',
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        ],
      ),
    );
  }
}
