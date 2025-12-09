import 'package:final_route_projcet_c16/core/constants/color_manager.dart';
import 'package:final_route_projcet_c16/core/di/di.dart';
import 'package:final_route_projcet_c16/core/routes/app_routes.dart';
import 'package:final_route_projcet_c16/features/profile/domain/entities/profile.dart';
import 'package:final_route_projcet_c16/features/profile/presentation/view_model/bloc/profile_bloc.dart';
import 'package:final_route_projcet_c16/features/profile/presentation/widgets/custom_elevated_button_red.dart';
import 'package:final_route_projcet_c16/features/profile/presentation/widgets/custom_watch_history_list.dart';
import 'package:final_route_projcet_c16/features/profile/presentation/widgets/history_list.dart';
import 'package:final_route_projcet_c16/features/profile/presentation/widgets/watch_list.dart';
import 'package:final_route_projcet_c16/features/update_profile/presentation/view/update_profile_screen.dart';
import 'package:final_route_projcet_c16/features/update_profile/presentation/view_model/bloc/update_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int currentIndex = 0;
  Profile? profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BlocConsumer<ProfileBloc, ProfileState>(
            listener: (context, state) {
              if (state is ProfileLoaded) {
                profile = state.profile;
                setState(() {});
              }
            },
            builder: (context, state) {
              final isLoading = state is ProfileLoading;
              final isLoaded = state is ProfileLoaded;

              if (isLoaded) {
                profile = state.profile;
              }
              return Container(
                height: 356.h,
                padding: EdgeInsets.only(top: 13.h, left: 12.w, right: 12.w),
                decoration: BoxDecoration(color: ColorManager.border),
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 55.r,
                                backgroundImage: profile?.avaterId != null
                                    ? AssetImage(
                                        'assets/images/avatar${profile!.avaterId}.png',
                                      )
                                    : null,
                                child: profile?.avaterId == null
                                    ? CircularProgressIndicator()
                                    : null,
                              ),
                              SizedBox(height: 15.h),
                              isLoading
                                  ? SizedBox.shrink()
                                  : Text(
                                      profile?.name ?? "",
                                      style: GoogleFonts.roboto(
                                        color: ColorManager.textPrimary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "12",
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                              SizedBox(height: 15.h),
                              Text(
                                "Wish List",
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "10",
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                              SizedBox(height: 15.h),
                              Text(
                                "History",
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 14.h),
                      Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: ElevatedButton(
                              onPressed: isLoading
                                  ? null
                                  : () async {
                                      final updatedProfile =
                                          await Navigator.push<Profile>(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => MultiBlocProvider(
                                                providers: [
                                                  BlocProvider(
                                                    create: (context) =>
                                                        sl<UpdateProfileBloc>(),
                                                  ),
                                                  BlocProvider(
                                                    create: (context) =>
                                                        sl<ProfileBloc>()
                                                          ..add(LoadProfile()),
                                                  ),
                                                ],
                                                child: UpdateProfileScreen(
                                                  avatarId: profile!.avaterId,
                                                  name: profile!.name,
                                                  phone: profile!.phone,
                                                ),
                                              ),
                                            ),
                                          );
                                      if (updatedProfile != null) {
                                        setState(() {
                                          profile = updatedProfile;
                                        });
                                        context.read<ProfileBloc>().add(
                                          LoadProfile(),
                                        );
                                      }
                                    },
                              child: Text("Edit Profile"),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            flex: 3,
                            child: CustomElevatedButtonRed(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Exit"),
                                  SizedBox(width: 5.w),
                                  Icon(Icons.logout),
                                ],
                              ),
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  AppRoutes.login,
                                );
                              },
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 5.h),

                      Row(
                        children: [
                          Expanded(
                            child: CustomWatchHistoryList(
                              onTap: () => setState(() => currentIndex = 0),
                              icon: Icons.list,
                              colorSelected: currentIndex == 0
                                  ? ColorManager.primary
                                  : Colors.transparent,
                              text: "Watch List",
                            ),
                          ),
                          Expanded(
                            child: CustomWatchHistoryList(
                              onTap: () => setState(() => currentIndex = 1),
                              icon: Icons.folder,
                              colorSelected: currentIndex == 1
                                  ? ColorManager.primary
                                  : Colors.transparent,
                              text: "History",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Expanded(child: currentIndex == 0 ? WatchList() : HistoryList()),
        ],
      ),
    );
  }
}
