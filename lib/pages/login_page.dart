import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_textfield.dart';
import 'package:food_delivery_app/services/auth/auth_service.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.onTap});

  final void Function()? onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /// text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  /// login method
  void login() async {
    // get instance of auth service
    final authService = AuthService();

    // try sign in
    try {
      await authService.signInWithEmailPassword(
          emailController.text, passwordController.text);
    }
    // display any errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  /// forgot password
  void forgotPw() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text("User tapped forgot password"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 25),

            /// Message, app slogan
            Text(
              'Food Deliver App',
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            const SizedBox(height: 25),

            /// email textField
            MyTextField(
              controller: emailController,
              hintText: "Email",
              obscureText: false,
            ),
            const SizedBox(height: 10),

            /// password textField
            MyTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),
            const SizedBox(height: 25),

            // sign in button
            MyButton(onTap: login, text: 'Login'),

            const SizedBox(height: 25),

            // don't have an account? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member?",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary)),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text("Register Now",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
