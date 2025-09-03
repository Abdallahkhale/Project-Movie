import 'package:flutter/material.dart';



class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121312),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF121312),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFFFBB3B)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Forget Password',
          style: TextStyle(
            color: Color(0xFFFFBB3B),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),

              Center(
                child: Container(
                  child: Image.asset(
                    'assets/images/forgot_password.png',
                    fit: BoxFit.cover,

                  ),
                ),
              ),

              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF1D1E1D),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                    border: InputBorder.none,
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.white54),
                    prefixIcon: Icon(Icons.email, color: Colors.white54, size: 20),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFBB3B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text(
                    'Verify Email',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}