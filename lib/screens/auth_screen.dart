import 'package:book_reader/size_data.dart';
import 'package:book_reader/widgets/forms/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/forms/login_form.dart';

////////////////////////////////////////
///
///   Rename screen to AuthScreen
///
///   AuthScreen should be Stateful:
///     -> switch state based on Sign-in or Sign-up
///
///   Current LoginForm needs to be made into propper Form
///   with controllers and able to extract user email & pass
///
///
////////////////////////////////////////

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});
  static String get routeName => 'auth';
  static String get routePath => '/$routeName';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    final icon =
        !isLogin ? const Icon(Icons.login) : const Icon(Icons.person_add);
    final label = !isLogin ? const Text('Log in') : const Text('Sign up');

    return Scaffold(
      appBar: AppBar(actions: [
        TextButton.icon(
            onPressed: () => setState(() => isLogin = !isLogin),
            icon: icon,
            label: label)
      ]),
      body: isLogin ? const Login() : const Signup(),
    );
  }
}

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SignupForm(),
      ),
    );
  }
}

class Login extends StatelessWidget {
  const Login({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
