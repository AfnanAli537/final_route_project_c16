import 'package:final_route_projcet_c16/core/routes/app_routes.dart';
import 'package:final_route_projcet_c16/features/onbording/domain/use_cases/get_onboarding_data_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_route_projcet_c16/core/services/session_service.dart';
import '../../data/onboarding_repository_impl.dart';
import '../blocs/onboarding_bloc.dart';
import '../blocs/onboarding_event.dart';
import '../blocs/onboarding_state.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final repository = OnboardingRepositoryImpl();
        final useCase = GetOnboardingDataUseCase(repository);
        final bloc = OnboardingBloc(useCase);
        bloc.add(LoadOnboardingData());
        return bloc;
      },
      child: BlocConsumer<OnboardingBloc, OnboardingState>(
        listener: (context, state) {
          // Sync page controller with bloc state
          if (_pageController.hasClients &&
              _pageController.page?.round() != state.currentPage) {
            _pageController.animateToPage(
              state.currentPage,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const Scaffold(
              backgroundColor: Color(0xFF0A0A0A),
              body: Center(
                child: CircularProgressIndicator(
                  color: Color(0xFFF6BD00),
                ),
              ),
            );
          }

          if (state.error != null) {
            return Scaffold(
              backgroundColor: const Color(0xFF0A0A0A),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Error: ${state.error}',
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<OnboardingBloc>().add(LoadOnboardingData());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF6BD00),
                      ),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          }

          return Scaffold(
            backgroundColor: const Color(0xFF0A0A0A),
            body: Stack(
              children: [
                // PageView for onboarding screens
                PageView.builder(
                  controller: _pageController,
                  itemCount: state.items.length,
                  onPageChanged: (index) {
                    // Update BLoC state when user swipes
                    if (index != state.currentPage) {
                      // Determine if user swiped forward or backward
                      if (index > state.currentPage) {
                        context.read<OnboardingBloc>().add(NextPage());
                      } else {
                        context.read<OnboardingBloc>().add(PreviousPage());
                      }
                    }
                  },
                  itemBuilder: (context, index) {
                    final item = state.items[index];
                    return _buildOnboardingPage(context, item, index, state.items.length);
                  },
                ),

                // Skip button
                if (state.currentPage < state.items.length - 1)
                  Positioned(
                    top: 50,
                    right: 20,
                    child: TextButton(
                      onPressed: () async {
                        // Mark onboarding as completed and skip to login
                        await SessionService.markOnboardingCompleted();
                        print('Onboarding marked as completed'); // Debug log
                        if (context.mounted) {
                          Navigator.pushReplacementNamed(context, AppRoutes.login);
                        }
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),

              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildOnboardingPage(BuildContext context, item, int index, int totalPages) {
    // First screen has different layout
    if (index == 0) {
      return Stack(
        children: [
          // Background image with full screen
          Positioned.fill(
            child: Image.asset(
              item.image,
              fit: BoxFit.cover,
            ),
          ),
          // Overlay image
          Positioned.fill(
            child: Image.asset(
              item.overlay,
              fit: BoxFit.cover,
            ),
          ),
          // Content (text and button) on top of the image and overlay
          Positioned(
            left: 0,
            right: 0,
            bottom: 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Main Text (Heading)
                  Text(
                    item.text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  // SubText (Description)
                  Text(
                    item.subText,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  // Explore Now Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      width: 398,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<OnboardingBloc>().add(NextPage());
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                          backgroundColor: const Color(0xFFF6BD00),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          'Explore Now',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    } else {
      // Screens 2-6 have the bottom container design
      return Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              item.image,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Positioned.fill(
            child: Image.asset(
              item.overlay,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.9),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    item.text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item.subText,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (index < totalPages - 1) {
                            context.read<OnboardingBloc>().add(NextPage());
                          } else {
                            // Last screen - mark onboarding completed and navigate to login
                            await SessionService.markOnboardingCompleted();
                            print('Onboarding completed (last screen)'); // Debug log
                            Navigator.pushReplacementNamed(context, AppRoutes.login);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                          backgroundColor: const Color(0xFFF6BD00),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          index < totalPages - 1 ? 'Next' : 'Get Started',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<OnboardingBloc>().add(PreviousPage());
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                          backgroundColor: Color.fromARGB(255, 0, 0, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(color: Color(0xFFF6BD00)),
                          ),
                        ),
                        child: const Text(
                          'Back',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF6BD00),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
  }
}
