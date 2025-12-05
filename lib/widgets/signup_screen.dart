import 'package:flutter/cupertino.dart';
import '../widgets/ios_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Join iOS Club"),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 40),
              IOSTextField(
                placeholder: "Full Name",
                controller: nameController,
              ),
              const SizedBox(height: 15),

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
                child: const Text("Create Account"),
                onPressed: () {
                  // TODO: Add signup logic
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
