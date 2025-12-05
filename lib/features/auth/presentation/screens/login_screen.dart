import 'package:final_route_projcet_c16/core/routes/app_routes.dart';
import 'package:final_route_projcet_c16/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:final_route_projcet_c16/features/auth/data/repositories_implemantation/auth_repository_impl.dart';
import 'package:final_route_projcet_c16/features/auth/domain/use_cases/login_usecase.dart';
import 'package:final_route_projcet_c16/features/auth/domain/use_cases/get_user_profile_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/login/login_bloc.dart';
import '../blocs/login/login_event.dart';
import '../blocs/login/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (_) {
        final remote = AuthRemoteDataSourceImpl();
        final repo = AuthRepositoryImpl(remote);
        final loginUseCase = LoginUseCase(repo);
        final getUserProfileUseCase = GetUserProfileUseCase(repo);
        return LoginBloc(loginUseCase, getUserProfileUseCase);
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF0A0A0A),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Image.asset("assets/images/app_logo.png", height: 210),
                const SizedBox(height: 30),
              
                _buildInputField(
                  controller: _emailController,
                  hint: "Email",
                  prefixIcon: Icons.email_outlined,
                ),
                const SizedBox(height: 15),

                _buildInputField(
                  controller: _passwordController,
                  hint: "Password",
                  prefixIcon: Icons.lock_outline,
                  isPassword: true,
                  suffixIcon: passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  onSuffixTap: () {
                    setState(() => passwordVisible = !passwordVisible);
                  },
                ),
                const SizedBox(height: 8),

                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to Forget password screen
                    },
                    child: const Text(
                      "Forget Password ?",
                      style: TextStyle(
                        color: Color(0xFFF6BD00),
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state.errorMessage != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errorMessage!)),
                      );
                    }

                    if (state.loginSuccess) {
                      print('Login successful, navigating to home...');
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.home,
                        (route) => false,
                      );
                    }
                  },
                  builder: (context, state) {
                    return SizedBox(
                      width: size.width,
                      height: 50,
                      child: state.isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Color(0xFFF6BD00),
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                context.read<LoginBloc>().add(
                                      LoginSubmitted(
                                        email: _emailController.text.trim(),
                                        password:
                                            _passwordController.text.trim(),
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
                                "Login",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                    );
                  },
                ),

                const SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don’t Have Account ? ",
                      style: TextStyle(color: Colors.white70),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.register);
                      },
                      child: const Text(
                        "Create One",
                        style: TextStyle(
                          color: Color(0xFFF6BD00),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(
                      child: Divider(color: Color(0xFFF6BD00), thickness: .7),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "OR",
                        style: TextStyle(color: Color(0xFFF6BD00),),
                      ),
                    ),
                    Expanded(
                      child: Divider(color: Color(0xFFF6BD00), thickness: .7),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                SizedBox(
                  width: size.width,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF6BD00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    icon: Image.asset("assets/images/google.png", height: 22),
                    label: const Text(
                      "Login With Google",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

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
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hint,
    required IconData prefixIcon,
    bool isPassword = false,
    IconData? suffixIcon,
    VoidCallback? onSuffixTap,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword ? !passwordVisible : false,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white12,
        prefixIcon: Icon(prefixIcon, color: Colors.white),
        suffixIcon: suffixIcon != null
            ? GestureDetector(
                onTap: onSuffixTap,
                child: Icon(suffixIcon, color: Colors.white),
              )
            : null,
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.6),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide:
              const BorderSide(color: Color(0xFFF6BD00), width: 1.5),
        ),
      ),
    );
  }
}
