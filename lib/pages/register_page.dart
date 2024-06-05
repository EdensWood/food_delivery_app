import 'package:flutter/material.dart';
import 'package:food_delivery_app/services/auth/auth_service.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.onTap});

  final void Function()? onTap;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  // register method
  void register() async {
    // get auth service
    final authService = AuthService();

    // check if passwords match -> create user
    if (passwordController.text == confirmPasswordController.text) {
      // try creating user
      try {
        await authService.signUpWithEmailPassword(
          emailController.text,
          passwordController.text,
        );
      }
      // display any errors
      catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }

    // if passwords don't match -> show error
    else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords do not match!"),
        ),
      );
    }
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
              "Let's create an account for you",
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
            const SizedBox(height: 10),

            /// confirm Password
            MyTextField(
              controller: confirmPasswordController,
              hintText: "Confirm password",
              obscureText: true,
            ),
            const SizedBox(height: 25),

            /// sign in button
            MyButton(onTap: register, text: 'Sign Up'),

            const SizedBox(height: 25),

            /// already have an account? Login here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary)),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text("Login now",
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
