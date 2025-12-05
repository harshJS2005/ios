import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  bool isLoading = false;

  Future<void> signupUser() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      showError("Please fill all fields.");
      return;
    }

    setState(() => isLoading = true);

    // simulate loading for UX
    await Future.delayed(const Duration(seconds: 1));

    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Save data
    await prefs.setString("user_name", name);
    await prefs.setString("user_email", email);
    await prefs.setString("user_password", password);

    setState(() => isLoading = false);

    showSuccess("Account created successfully! 🎉");
  }

  void showError(String msg) {
    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: const Text("Error"),
        content: Text(msg),
        actions: [
          CupertinoDialogAction(
              child: const Text("OK"),
              onPressed: () => Navigator.pop(context))
        ],
      ),
    );
  }

  void showSuccess(String msg) {
    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: const Text("Success"),
        content: Text(msg),
        actions: [
          CupertinoDialogAction(
            child: const Text("Go to Login"),
            onPressed: () {
              Navigator.pop(context); // close dialog
              Navigator.pop(context); // go back to login
            },
          )
        ],
      ),
    );
  }

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

              isLoading
                  ? const CupertinoActivityIndicator()
                  : CupertinoButton.filled(
                      child: const Text("Create Account"),
                      onPressed: signupUser,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
