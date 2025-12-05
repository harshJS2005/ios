import 'package:flutter/cupertino.dart';

class IOSTextField extends StatelessWidget {
  final String placeholder;
  final TextEditingController controller;
  final bool isPassword;

  const IOSTextField({
    super.key,
    required this.placeholder,
    required this.controller,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      placeholder: placeholder,
      obscureText: isPassword,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
