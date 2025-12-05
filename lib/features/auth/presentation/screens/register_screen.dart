import 'package:final_route_projcet_c16/features/auth/data/repositories_implemantation/auth_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_route_projcet_c16/core/routes/app_routes.dart';

import '../../data/data_sources/auth_remote_data_source.dart';
import '../../domain/use_cases/register_usecase.dart';
import '../blocs/register/register_bloc.dart';
import '../blocs/register/register_event.dart';
import '../blocs/register/register_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController(text: '+20');

  int selectedAvatar = 1;

  final List<String> avatars = [
    "assets/images/avatar1.png",
    "assets/images/avatar2.png",
    "assets/images/avatar3.png",
    "assets/images/avatar4.png",
    "assets/images/avatar5.png",
    "assets/images/avatar6.png",
    "assets/images/avatar7.png",
    "assets/images/avatar8.png",
    "assets/images/avatar9.png",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final remote = AuthRemoteDataSourceImpl();
        final repo = AuthRepositoryImpl(remote);
        final registerUseCase = RegisterUseCase(repo);
        return RegisterBloc(registerUseCase);
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF0A0A0A),
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFFF6BD00)),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            "Register",
            style: TextStyle(color: Color(0xFFF6BD00), fontSize: 22),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
          child: Column(
            children: [
             

              SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: avatars.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 15),
                  itemBuilder: (context, index) {
                    final id = index + 1;

                    return GestureDetector(
                      onTap: () => setState(() => selectedAvatar = id),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: selectedAvatar == id
                                ? const Color(0xFFF6BD00)
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: selectedAvatar == id ? 42 : 35,
                          backgroundImage: AssetImage(avatars[index]),
                        ),
                      ),
                    );
                  },
                ),
              ),
 const SizedBox(height: 10),

              const Text(
                "Avatar",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              const SizedBox(height: 12),
              const SizedBox(height: 25),

              /// Input Fields
              buildTextField(icon: Icons.perm_identity, hint: "Name", controller: nameController),
              const SizedBox(height: 20),
              buildTextField(icon: Icons.email_outlined, hint: "Email", controller: emailController),
              const SizedBox(height: 20),
              buildPasswordField(passwordController, "Password"),
              const SizedBox(height: 20),
              buildPasswordField(confirmPasswordController, "Confirm Password"),
              const SizedBox(height: 20),
              buildTextField(icon: Icons.phone, hint: "Phone Number (+20XXXXXXXXXX)", controller: phoneController),
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 5),
                child: Text(
                  'Phone number must start with +20 and contain exactly 10 digits',
                  style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 12),
                ),
              ),
              const SizedBox(height: 30),

              BlocConsumer<RegisterBloc, RegisterState>(
                listener: (context, state) {
                  if (state.errorMessage != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errorMessage!)),
                    );
                  }

                  if (state.successMessage != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.successMessage!)));

                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.login,
                      (route) => false,
                    );
                  }
                },
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: state.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(color: Color(0xFFF6BD00)))
                        : ElevatedButton(
                            onPressed: () {
                              final name = nameController.text.trim();
                              final email = emailController.text.trim();
                              final password = passwordController.text.trim();
                              final confirmPassword = confirmPasswordController.text.trim();
                              final phone = phoneController.text.trim();

                              if (name.isEmpty || email.isEmpty || password.isEmpty ||
                                  confirmPassword.isEmpty || phone.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Please fill all fields')),
                                );
                                return;
                              }

                              if (password != confirmPassword) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Passwords do not match')),
                                );
                                return;
                              }

                              if (!phone.startsWith('+20') || phone.length != 13) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Phone number must start with +20 and contain exactly 10 digits')),
                                );
                                return;
                              }

                              final digitsPart = phone.substring(3);
                              if (!RegExp(r'^\d{10}$').hasMatch(digitsPart)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Phone number must contain only digits after +20')),
                                );
                                return;
                              }

                              context.read<RegisterBloc>().add(
                                    RegisterSubmitted(
                                      name: name,
                                      email: email,
                                      password: password,
                                      confirmPassword: confirmPassword,
                                      phone: phone,
                                      avatarId: selectedAvatar,
                                    ),
                                  );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF6BD00),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            child: const Text(
                              "Create Account",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                  );
                },
              ),

              const SizedBox(height: 22),

              GestureDetector(
                onTap: () => Navigator.pushNamed(context, AppRoutes.login),
                child: const Text.rich(
                  TextSpan(
                    text: "Already Have Account ? ",
                    style: TextStyle(color: Colors.white70),
                    children: [
                      TextSpan(
                        text: "Login",
                        style: TextStyle(
                            color: Color(0xFFF6BD00),
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Color(0xFFF6BD00)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("assets/images/flag_usa.png", height: 22),
                      const SizedBox(width: 25),
                      Image.asset("assets/images/flag_egypt.png", height: 22),
                    ],
                  ),
                ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required IconData icon,
    required String hint,
    required TextEditingController controller,
  }) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white12,
        prefixIcon: Icon(icon, color: Colors.white),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Color(0xFFF6BD00), width: 2),
        ),
      ),
    );
  }

  Widget buildPasswordField(TextEditingController controller, String hint) {
    bool obscure = true;

    return StatefulBuilder(
      builder: (context, setState) {
        return TextField(
          controller: controller,
          obscureText: obscure,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white12,
            prefixIcon: const Icon(Icons.lock_outline, color: Colors.white),
            suffixIcon: GestureDetector(
              onTap: () => setState(() => obscure = !obscure),
              child: Icon(
                obscure ? Icons.visibility_off : Icons.visibility,
                color: Colors.white,
              ),
            ),
            hintText: hint,
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide:
                  const BorderSide(color: Color(0xFFF6BD00), width: 2),
            ),
          ),
        );
      },
    );
  }
}
