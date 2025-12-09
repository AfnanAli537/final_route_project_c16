import 'package:final_route_projcet_c16/core/constants/assets_manager.dart';
import 'package:final_route_projcet_c16/core/constants/color_manager.dart';
import 'package:final_route_projcet_c16/core/routes/app_routes.dart';
import 'package:final_route_projcet_c16/core/utils/validators/regex.dart';
import 'package:final_route_projcet_c16/features/profile/domain/entities/profile.dart';
import 'package:final_route_projcet_c16/features/profile/presentation/view_model/bloc/profile_bloc.dart';
import 'package:final_route_projcet_c16/features/profile/presentation/widgets/custom_elevated_button_red.dart';
import 'package:final_route_projcet_c16/features/search/presentation/widgets/custom_text_field.dart';
import 'package:final_route_projcet_c16/features/update_profile/presentation/view_model/bloc/update_profile_bloc.dart';
import 'package:final_route_projcet_c16/features/update_profile/presentation/view_model/bloc/update_profile_event.dart';
import 'package:final_route_projcet_c16/features/update_profile/presentation/view_model/bloc/update_profile_state.dart';
import 'package:final_route_projcet_c16/features/update_profile/presentation/widgets/avatar_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/services/session_service.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({
    super.key,
    required this.avatarId,
    required this.name,
    required this.phone,
  });

  final int avatarId;
  final String name;
  final String phone;

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController oldPasswordController;
  late TextEditingController newPasswordController;
  final List<String> avatars = [
    ImageAssets.avatar1,
    ImageAssets.avatar2,
    ImageAssets.avatar3,
    ImageAssets.avatar4,
    ImageAssets.avatar5,
    ImageAssets.avatar6,
    ImageAssets.avatar7,
    ImageAssets.avatar8,
    ImageAssets.avatar9,
  ];
  int selected = 0;
  bool showReset = false;
  bool showOldPassword = true;
  bool showNewPassword = true;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    phoneController = TextEditingController(text: widget.phone);
    selected = widget.avatarId - 1;
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    newPasswordController.dispose();
    oldPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileState = context.read<ProfileBloc>().state;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: ColorManager.primary),
        ),
        title: Text("Pick Avatar"),
        titleTextStyle: GoogleFonts.roboto(
          fontSize: 16.sp,
          color: ColorManager.primary,
          fontWeight: FontWeight.w400,
        ),
      ),
      body: BlocConsumer<UpdateProfileBloc, UpdateProfileState>(
        listener: (context, state) async {
          if (state is ResetPasswordSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
            setState(() {
              showReset = false;
              oldPasswordController.clear();
              newPasswordController.clear();
            });
          } else if (state is ResetPasswordError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is UpdateProfileSuccess) {
            final updatedProfile = Profile(
              id: profileState is ProfileLoaded ? profileState.profile.id : "0",
              email: profileState is ProfileLoaded
                  ? profileState.profile.email
                  : '',
              name: nameController.text,
              phone: phoneController.text,
              avaterId: selected + 1,
            );

            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));

            Navigator.pop(context, updatedProfile);
          } else if (state is UpdateProfileDeleted) {
            await SessionService.clearAuthToken();
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.register,
              (route) => false,
            );
          } else if (state is UpdateProfileError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Padding(
                padding: REdgeInsets.all(8.0),
                child: Column(
                  children: [
                    InkWell(
                      radius: 16.r,
                      onTap: showAvatarsBottomSheet,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(avatars[selected]),
                      ),
                    ),
                    SizedBox(height: 35.h),
                    CustomTextField(
                      hintText: "Enter your name",
                      prefixIcon: Icon(Icons.person),
                      controller: nameController,
                      validator: Regex.validateUsername,
                    ),
                    SizedBox(height: 20.h),
                    CustomTextField(
                      hintText: "Enter your phone",
                      prefixIcon: Icon(Icons.phone),
                      controller: phoneController,
                      validator: Regex.validatePhoneNumber,
                    ),
                    SizedBox(height: 30.h),
                    Align(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                        onPressed: _resetPassword,
                        child: Text(
                          "Reset Password",
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    if (showReset) ...[
                      SizedBox(height: 20.h),
                      CustomTextField(
                        hintText: "Enter your old password",
                        prefixIcon: Icon(Icons.lock),
                        controller: oldPasswordController,
                        validator: Regex.validatePassword,
                        suffixIcon: IconButton(
                          icon: Icon(
                            showOldPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              showOldPassword = !showOldPassword;
                            });
                          },
                        ),
                        obscureText: showOldPassword,
                      ),
                      SizedBox(height: 20.h),
                      CustomTextField(
                        hintText: "Enter your new password",
                        prefixIcon: Icon(Icons.lock),
                        controller: newPasswordController,
                        validator: Regex.validatePassword,
                        suffixIcon: IconButton(
                          icon: Icon(
                            showNewPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              showNewPassword = !showNewPassword;
                            });
                          },
                        ),

                        obscureText: showNewPassword,
                      ),
                    ],
                    SizedBox(height: 190.h),
                    SizedBox(
                      width: double.infinity,
                      child: CustomElevatedButtonRed(
                        child:
                            BlocBuilder<UpdateProfileBloc, UpdateProfileState>(
                              builder: (context, state) {
                                if (state is UpdateProfileLoading) {
                                  return SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  );
                                }
                                return Text("Delete Account");
                              },
                            ),
                        onTap: () async {
                          final confirm = await showDialog<bool>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Confirm Deletion"),
                              content: Text(
                                "Are you sure you want to delete your account? This action cannot be undone.",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, false),
                                  child: Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, true),
                                  child: Text(
                                    "Delete",
                                    style: TextStyle(color: ColorManager.error),
                                  ),
                                ),
                              ],
                            ),
                          );

                          if (confirm == true) {
                            context.read<UpdateProfileBloc>().add(
                              SubmitDeleteProfile(),
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: state is UpdateProfileLoading
                            ? null
                            : () {
                                if (profileState is ProfileLoaded) {
                                  final currentProfile = profileState.profile;
                                  if (showReset &&
                                      oldPasswordController.text.isNotEmpty &&
                                      newPasswordController.text.isNotEmpty) {
                                    context.read<UpdateProfileBloc>().add(
                                      SubmitResetPassword(
                                        oldPasswordController.text.trim(),
                                        newPasswordController.text.trim(),
                                      ),
                                    );
                                    return;
                                  }
                                  final updatedProfile = Profile(
                                    id: currentProfile.id,
                                    email: currentProfile.email,
                                    name: nameController.text.trim().isNotEmpty
                                        ? nameController.text.trim()
                                        : currentProfile.name,
                                    phone:
                                        phoneController.text.trim().isNotEmpty
                                        ? phoneController.text.trim()
                                        : currentProfile.phone,
                                    avaterId:
                                        selected != currentProfile.avaterId - 1
                                        ? selected + 1
                                        : currentProfile.avaterId,
                                  );

                                  context.read<UpdateProfileBloc>().add(
                                    SubmitUpdateProfile(updatedProfile),
                                  );
                                }
                              },
                        child: state is UpdateProfileLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text("Update Profile"),
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void showAvatarsBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      //backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) => Padding(
        padding: REdgeInsets.all(16.0),
        child: SizedBox(
          height: 360.h,
          child: GridView.builder(
            itemCount: avatars.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() => selected = index);
                  Navigator.pop(context);
                },
                child: AvatarMenu(
                  isSelected: selected == index,
                  widget: Image.asset(avatars[index]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _resetPassword() {
    setState(() {
      showReset = !showReset;
    });
  }
}
