import 'package:flutter/material.dart';
import 'package:movies/Core/Custom_widget/CustomTextFormField.dart';
import 'package:movies/Core/Custom_widget/custombutton.dart';
import 'package:movies/Core/assets/Colors/Colors.dart';
import 'package:movies/Core/assets/images/imagesPath.dart';
import 'package:movies/UI/authentication/login_view.dart';

class RegisterView extends StatefulWidget {
  static const routeName = '/register_view';

  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: ColorsApp.gold,
        ),
        title: const Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(ImagesPath.avatarListImg, height: 100),
                Text(
                  "Avatar",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleSmall!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 24.0),
                CustomTextFormField(
                  hintText: "Name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: ImageIcon(
                      AssetImage(ImagesPath.nameIcn),
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                CustomTextFormField(
                  hintText: "Email",
                  validator: (value) {
                    final emailRegExp = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                    );
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!emailRegExp.hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: ImageIcon(
                      AssetImage(ImagesPath.emailIcn),
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                CustomTextFormField(
                  hintText: "Password",
                  isPassword: true,
                  validator: (value) {
                    final passwordRegExp = RegExp(
                      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
                    );
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (!passwordRegExp.hasMatch(value)) {
                      return 'Please enter a valid password';
                    }
                    return null;
                  },
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: ImageIcon(
                      AssetImage(ImagesPath.passwordIcn),
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                CustomTextFormField(
                  hintText: "Re-Password",
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please re-enter your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: ImageIcon(
                      AssetImage(ImagesPath.passwordIcn),
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                CustomTextFormField(
                  hintText: "Phone Number",
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: ImageIcon(
                      AssetImage(ImagesPath.phoneIcn),
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                CustomButtonWidget(
                  color: ColorsApp.gold,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  backgroundColor: ColorsApp.gold,
                  child: Text(
                    "Create Account",
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Already Have Account ? ",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(LoginView.routeName);
                      },
                      child: Text("Login", style: theme.textTheme.bodyLarge),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
