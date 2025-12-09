import 'package:final_route_projcet_c16/features/auth/login/domain/use_cases/login_usecase.dart';
import 'package:final_route_projcet_c16/features/auth/domain/use_cases/get_user_profile_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_route_projcet_c16/core/services/session_service.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final GetUserProfileUseCase getUserProfileUseCase;

  LoginBloc(this.loginUseCase, this.getUserProfileUseCase) : super(const LoginState()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, loginSuccess: false));

    try {
      final token = await loginUseCase(
        email: event.email,
        password: event.password,
      );

      await SessionService.setAuthToken(token);

      emit(state.copyWith(isLoading: false, token: token, loginSuccess: true));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString().replaceFirst('Exception: ', ''),
      ));
    }
  }
}
