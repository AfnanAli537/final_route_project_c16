import 'package:final_route_projcet_c16/features/auth/domain/use_cases/register_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterBloc(this.registerUseCase) : super(const RegisterState()) {
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }

  Future<void> _onRegisterSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final responseData = await registerUseCase(
        RegisterParams(
          name: event.name,
          email: event.email,
          password: event.password,
          confirmPassword: event.confirmPassword,
          phone: event.phone,
          avatarId: event.avatarId,
        ),
      );

      final message = responseData["message"] ?? "Registered successfully";

      emit(state.copyWith(isLoading: false, successMessage: message));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString().replaceFirst("Exception: ", ""),
      ));
    }
  }
}
