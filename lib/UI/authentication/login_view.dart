import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies/Core/Custom_widget/CustomTextFormField.dart';
import 'package:movies/Core/Custom_widget/custombutton.dart';
import 'package:movies/Core/assets/Colors/Colors.dart';
import 'package:movies/Core/assets/images/imagesPath.dart';
import 'package:movies/Core/network/controllers/auth_controller.dart';
import 'package:movies/Core/services/google_sign_in_service.dart';
import 'package:movies/UI/authentication/register_view.dart';
import 'package:movies/UI/home/home_view.dart';

class LoginView extends StatefulWidget {
  static const routeName = '/login_view';

  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: ColorsApp.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(ImagesPath.loginImg, height: 80),
              const SizedBox(height: 15),
              CustomTextFormField(
                controller: _emailController,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  return null;
                },
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ImageIcon(
                    AssetImage(ImagesPath.emailIcn),
                    color: Colors.white,
                  ),
                ),
                hintText: "Email",
                isPassword: false,
              ),
              const SizedBox(height: 15),
              CustomTextFormField(
                controller: _passwordController,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }
                  return null;
                },
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ImageIcon(
                    AssetImage(ImagesPath.passwordIcn),
                    color: Colors.white,
                  ),
                ),
                hintText: "Password",
                isPassword: true,
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forget Password?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: ColorsApp.gold,
                      decoration: TextDecoration.underline,
                      decorationColor: ColorsApp.gold,
                      decorationThickness: 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              CustomButtonWidget(
                color: ColorsApp.gold,
                onTap: () {
                  if (_formkey.currentState!.validate()) {
                    final authController = Get.put(AuthController());
                    authController.login(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                  }
                },
                backgroundColor: ColorsApp.gold,
                child: Text(
                  "Login",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RegisterView.routeName);
                    },
                    child: Text(
                      "Create one",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: ColorsApp.gold,
                        decorationColor: ColorsApp.gold,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Expanded(child: Divider(color: ColorsApp.gold)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "OR",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: ColorsApp.gold,
                      ),
                    ),
                  ),
                  const Expanded(child: Divider(color: ColorsApp.gold)),
                ],
              ),
              const SizedBox(height: 15),
              CustomButtonWidget(
                onTap: () async {
                  final service = GoogleSignInService();
                  final user = await service.signInWithGoogle();
                  if (user != null) {
                    EasyLoading.showSuccess(
                        "Signed in: ${user.displayName}, ${user.email}");
                  } else {
                    EasyLoading.showError("Sign-in cancelled or failed");
                  }
                  Navigator.pushNamed(context, HomeView.routeName);
                },
                color: ColorsApp.gold,
                child: Row(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(ImagesPath.googleIcn, scale: -1),
                    Text(
                      "Login With Google",
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Image(
                image: AssetImage(ImagesPath.languageSwitchImg),
                width: 70,
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
