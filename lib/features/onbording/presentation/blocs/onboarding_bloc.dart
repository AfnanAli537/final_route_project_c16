import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/use_cases/get_onboarding_data_usecase.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final GetOnboardingDataUseCase getOnboardingDataUseCase;

  OnboardingBloc(this.getOnboardingDataUseCase) : super(const OnboardingState()) {
    on<LoadOnboardingData>(_onLoadOnboardingData);
    on<NextPage>(_onNextPage);
    on<PreviousPage>(_onPreviousPage);
    on<SkipOnboarding>(_onSkipOnboarding);
    on<CompleteOnboarding>(_onCompleteOnboarding);
  }

  Future<void> _onLoadOnboardingData(
    LoadOnboardingData event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final items = getOnboardingDataUseCase.execute();
      emit(state.copyWith(items: items, isLoading: false));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }

  void _onNextPage(NextPage event, Emitter<OnboardingState> emit) {
    final nextPage = state.currentPage + 1;
    if (nextPage < state.items.length) {
      emit(state.copyWith(currentPage: nextPage));
    }
  }

  void _onPreviousPage(PreviousPage event, Emitter<OnboardingState> emit) {
    if (state.currentPage > 0) {
      emit(state.copyWith(currentPage: state.currentPage - 1));
    }
  }

  void _onSkipOnboarding(SkipOnboarding event, Emitter<OnboardingState> emit) {
    // Skip to the last page
    emit(state.copyWith(currentPage: state.items.length - 1));
  }

  void _onCompleteOnboarding(CompleteOnboarding event, Emitter<OnboardingState> emit) {
    // Onboarding completed - this can be used to navigate or mark as completed
    emit(state.copyWith(currentPage: state.items.length - 1));
  }
}
