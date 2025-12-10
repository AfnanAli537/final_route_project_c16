import 'package:bloc/bloc.dart';
import 'package:final_route_projcet_c16/features/update_profile/domain/use_cases/delete_profile_use_case.dart';
import 'package:final_route_projcet_c16/features/update_profile/presentation/view_model/bloc/update_profile_event.dart';
import 'package:final_route_projcet_c16/features/update_profile/presentation/view_model/bloc/update_profile_state.dart';
import 'package:final_route_projcet_c16/features/update_profile/reset_password/domain/use_cases/reset_password_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_cases/update_profile_use_case.dart';

@injectable
class UpdateProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  final UpdateProfileUseCase updateProfileUseCase;
  final DeleteProfile deleteProfileUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;

  UpdateProfileBloc(
    this.updateProfileUseCase,
    this.deleteProfileUseCase,
    this.resetPasswordUseCase,
  ) : super(UpdateProfileInitial()) {
    on<SubmitUpdateProfile>((event, emit) async {
      emit(UpdateProfileLoading());
      try {
        final message = await updateProfileUseCase(event.profile);
        emit(UpdateProfileSuccess(message));
      } catch (e) {
        emit(UpdateProfileError(e.toString()));
      }
    });

    on<SubmitDeleteProfile>((event, emit) async {
      emit(UpdateProfileLoading());
      try {
        final message = await deleteProfileUseCase();
        emit(UpdateProfileDeleted(message));
      } catch (e) {
        emit(UpdateProfileError(e.toString()));
      }
    });

    on<SubmitResetPassword>((event, emit) async {
      emit(UpdateProfileLoading());
      try {
        final message = await resetPasswordUseCase(
          event.oldPassword,
          event.newPassword,
        );
        emit(ResetPasswordSuccess(message));
      } catch (e) {
        emit(ResetPasswordError(e.toString().replaceAll("Exception: ", "")));
      }
    });
  }
}
