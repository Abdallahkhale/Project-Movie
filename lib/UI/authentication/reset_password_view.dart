import 'package:flutter/material.dart';
import 'package:movies/Core/Custom_widget/CustomTextFormField.dart';
import 'package:movies/Core/Custom_widget/custombutton.dart';
import 'package:movies/Core/assets/Colors/Colors.dart';
import 'package:movies/Core/assets/images/imagesPath.dart';

class ResetPasswordView extends StatefulWidget {
  static const routeName = '/reset_password_view';

  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: ColorsApp.gold,
        ),
        title: const Text("Forget Password",
            style: TextStyle(color: ColorsApp.gold)),
        centerTitle: true,
      ),
      backgroundColor: ColorsApp.black,
      body: Form(
        key: _formkey,
        child: Column(
          spacing: 24,
          children: [
            const Image(image: AssetImage(ImagesPath.forgotPasswordImg)),
            CustomTextFormField(
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Your Email";
                }
                return null;
              },
              prefixIcon: const Padding(
                padding: EdgeInsets.all(16.0),
                child: ImageIcon(
                  AssetImage(ImagesPath.emailIcn),
                  color: Colors.white,
                ),
              ),
              hintText: "Email",
            ),
            Container(
              width: double.infinity,
              child: CustomButtonWidget(
                onTap: () {
                  if (_formkey.currentState!.validate()) {}
                },
                color: ColorsApp.gold,
                backgroundColor: ColorsApp.gold,
                child: Text(
                  "Verify Email",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
