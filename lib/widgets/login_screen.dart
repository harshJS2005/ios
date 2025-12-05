import 'package:flutter/cupertino.dart';
import '../widgets/ios_textfield.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("iOS Club Login"),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text("Welcome Back 👋",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),

              IOSTextField(
                placeholder: "Email",
                controller: emailController,
              ),
              const SizedBox(height: 15),

              IOSTextField(
                placeholder: "Password",
                controller: passwordController,
                isPassword: true,
              ),

              const SizedBox(height: 30),

              CupertinoButton.filled(
                child: const Text("Login"),
                onPressed: () {
                  // TODO: Add Firebase/Auth Logic
                },
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: const Text("Sign Up"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (_) => const SignupScreen()),
                      );
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
