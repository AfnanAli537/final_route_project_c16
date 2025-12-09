import 'package:final_route_projcet_c16/features/onbording/domain/entities/onboarding_item_entity.dart';
import 'package:final_route_projcet_c16/features/onbording/domain/repositories_interface/onboarding_repository.dart';


class OnboardingRepositoryImpl implements OnboardingRepository {
  @override
  List<OnboardingItemEntity> getOnboardingData() {
    return const [
      OnboardingItemEntity(
        image: "assets/images/first_image.png",
        overlay: "assets/images/first_overlay.png",
        text: "Find Your Next Favorite Movie Here",
        subText: "Get access to a huge library of movies to suit all tastes. You will surely like it.",
      ),
      OnboardingItemEntity(
        image: "assets/images/second_image.png",
        overlay: "assets/images/second_overlay.png",
        text: "Discover Movies",
        subText: "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
      ),
      OnboardingItemEntity(
        image: "assets/images/third_image.png",
        overlay: "assets/images/third_overlay.png",
        text: "Watch Anytime, Anywhere",
        subText: "Stream your favorite movies on any device, anytime you want. Enjoy unlimited entertainment.",
      ),
      OnboardingItemEntity(
        image: "assets/images/fourth_image.png",
        overlay: "assets/images/fourth_overlay.png",
        text: "Personalized Recommendations",
        subText: "Get movie recommendations tailored just for you based on your preferences and watch history.",
      ),
      OnboardingItemEntity(
        image: "assets/images/fifth_image.png",
        overlay: "assets/images/fifth_overlay.png",
        text: "High Quality Streaming",
        subText: "Experience crystal clear video quality with our advanced streaming technology.",
      ),
      OnboardingItemEntity(
        image: "assets/images/sixth_image.png",
        overlay: "assets/images/sixth_overlay.png",
        text: "Join Our Community",
        subText: "Connect with fellow movie lovers, share reviews, and discover new favorites together.",
      ),
    ];
  }
}
