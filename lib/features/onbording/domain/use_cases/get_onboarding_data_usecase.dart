import '../entities/onboarding_item_entity.dart';
import '../repositories_interface/onboarding_repository.dart';

class GetOnboardingDataUseCase {
  final OnboardingRepository repository;

  GetOnboardingDataUseCase(this.repository);

  List<OnboardingItemEntity> execute() {
    return repository.getOnboardingData();
  }
}
