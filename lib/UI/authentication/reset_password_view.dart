import 'package:flutter/material.dart';
import 'package:movies/Core/assets/Colors/Colors.dart';

class ResetPasswordView extends StatefulWidget {
  static const routeName = '/reset_password_view';

  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: ColorsApp.gold,
        ),
      ),
    );
  }
}
