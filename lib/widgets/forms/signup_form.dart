import 'package:book_reader/providers/firebase_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../size_data.dart';

final _formKey = GlobalKey<FormState>();

final _emailControoler = TextEditingController();
final _passwordControoler = TextEditingController();

class SignupForm extends ConsumerWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onSubmit() {
      if (_formKey.currentState == null) return;

      if (!_formKey.currentState!.validate()) return;

      final email = _emailControoler.text;
      final password = _passwordControoler.text;

      ref.read(authServiceProvider).createUserEmailPassword(
            email: email,
            pass: password,
          );
    }

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
              controller: _emailControoler,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Required field';

                if (!_emailRegex.hasMatch(value)) return 'Wrong email syntax';

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
              controller: _passwordControoler,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Required field';

                if (!_passwordRegex.hasMatch(value)) {
                  return 'Minimum 8 characters, at least: \n 1 uppercase letter, \n 1 lowercase letter \n 1 number';
                }

                return null;
              },
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: const InputDecoration(label: Text('Password')),
            ),
          ),

          /// Confirm password field
          Container(
            padding: EdgeInsets.only(bottom: defaultSize),
            width: defaultSize * 21.5,
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) return 'Required field';

                if (value != _passwordControoler.text) {
                  return 'Does not match password field';
                }

                return null;
              },
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration:
                  const InputDecoration(label: Text('Confirm password')),
            ),
          ),

          /// Sign-up button
          Padding(
            padding: EdgeInsets.symmetric(vertical: defaultSize * 1.6),
            child: ElevatedButton(
                onPressed: onSubmit,
                child: SizedBox(
                  width: defaultSize * 8.5,
                  child: const Center(child: Text('Sign up')),
                )),
          ),
        ],
      ),
    );
  }
}

final _emailRegex = RegExp(
    r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$");

final _passwordRegex =
    RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$");
