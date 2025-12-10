import 'package:final_route_projcet_c16/features/onbording/domain/entities/onboarding_item_entity.dart';
import 'package:final_route_projcet_c16/features/onbording/domain/repositories_interface/onboarding_repository.dart';


class OnboardingRepositoryImpl implements OnboardingRepository {
  @override
  List<OnboardingItemEntity> getOnboardingData() {
    return const [
      OnboardingItemEntity(
        image: "assets/images/first_image.png",
        overlay: "assets/images/first_overlay.png",
        text: "Welcome to MovieHub",
        subText: "Your personal movie collection awaits. Browse thousands of films and find exactly what you're craving to watch.",
      ),
      OnboardingItemEntity(
        image: "assets/images/second_image.png",
        overlay: "assets/images/second_overlay.png",
        text: "Explore & Discover",
        subText: "From classics to new releases, dive into our curated collection. Filter by genre, year, or just browse what's popular.",
      ),
      OnboardingItemEntity(
        image: "assets/images/third_image.png",
        overlay: "assets/images/third_overlay.png",
        text: "Watch Your Way",
        subText: "Stream on your phone, tablet, or TV. Pick up where you left off, download for offline viewing, or cast to your big screen.",
      ),
      OnboardingItemEntity(
        image: "assets/images/fourth_image.png",
        overlay: "assets/images/fourth_overlay.png",
        text: "Made for You",
        subText: "Our smart recommendations learn what you love. The more you watch, the better we get at suggesting your next favorite.",
      ),
      OnboardingItemEntity(
        image: "assets/images/fifth_image.png",
        overlay: "assets/images/fifth_overlay.png",
        text: "Crystal Clear Quality",
        subText: "Enjoy movies in stunning HD and 4K. Our optimized streaming ensures smooth playback without interruptions.",
      ),
      OnboardingItemEntity(
        image: "assets/images/sixth_image.png",
        overlay: "assets/images/sixth_overlay.png",
        text: "Share the Experience",
        subText: "Rate movies, read reviews, and see what friends are watching. Join discussions and discover hidden gems together.",
      ),
    ];
  }
}
