import 'package:final_route_projcet_c16/core/constants/color_manager.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      appBar: AppBar(
        backgroundColor: ColorManager.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ColorManager.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Forget Password",
          style: TextStyle(color: ColorManager.primary, fontSize: 20),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 15),
        child: Column(
          children: [
            const SizedBox(height: 20),

            /// Image
            SizedBox(
              height: 330,
              width: 330,
              child: Image.asset(
                "assets/images/forget_password.png", 
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 35),
            TextField(
              controller: emailController,
              style: TextStyle(color: ColorManager.textPrimary),
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorManager.surface,
                prefixIcon: Icon(Icons.email_outlined, color: ColorManager.textPrimary),
                hintText: "Email",
                hintStyle: TextStyle(color: ColorManager.textSecondary),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: ColorManager.border),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: ColorManager.primary, width: 2),
                ),
              ),
            ),

            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Verification Email Sent")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Verify Email",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
