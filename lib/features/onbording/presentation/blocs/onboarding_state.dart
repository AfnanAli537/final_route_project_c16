import 'package:equatable/equatable.dart';
import '../../domain/entities/onboarding_item_entity.dart';

class OnboardingState extends Equatable {
  final List<OnboardingItemEntity> items;
  final int currentPage;
  final bool isLoading;
  final String? error;

  const OnboardingState({
    this.items = const [],
    this.currentPage = 0,
    this.isLoading = false,
    this.error,
  });

  OnboardingState copyWith({
    List<OnboardingItemEntity>? items,
    int? currentPage,
    bool? isLoading,
    String? error,
  }) {
    return OnboardingState(
      items: items ?? this.items,
      currentPage: currentPage ?? this.currentPage,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [items, currentPage, isLoading, error];
}
