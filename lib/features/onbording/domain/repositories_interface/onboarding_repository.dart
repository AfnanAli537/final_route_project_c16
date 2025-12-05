import '../entities/onboarding_item_entity.dart';

abstract class OnboardingRepository {
  List<OnboardingItemEntity> getOnboardingData();
}
