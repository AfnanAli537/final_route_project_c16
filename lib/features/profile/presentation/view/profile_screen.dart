import 'package:final_route_projcet_c16/core/constants/color_manager.dart';
import 'package:final_route_projcet_c16/core/di/di.dart';
import 'package:final_route_projcet_c16/core/routes/app_routes.dart';
import 'package:final_route_projcet_c16/core/services/session_service.dart';
import 'package:final_route_projcet_c16/features/favorites/presentation/view_model/bloc/favorite_bloc.dart';
import 'package:final_route_projcet_c16/features/favorites/presentation/view_model/bloc/favorite_event.dart';
import 'package:final_route_projcet_c16/features/favorites/presentation/view_model/bloc/favorite_state.dart';
import 'package:final_route_projcet_c16/features/profile/domain/entities/profile.dart';
import 'package:final_route_projcet_c16/features/profile/presentation/view_model/bloc/profile_bloc.dart';
import 'package:final_route_projcet_c16/features/profile/presentation/view_model/history/history_bloc.dart';
import 'package:final_route_projcet_c16/features/profile/presentation/view_model/history/history_event.dart';
import 'package:final_route_projcet_c16/features/profile/presentation/view_model/history/history_state.dart';
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
  int wishListCount = 0;

  ValueNotifier<int> historyCountNotifier = ValueNotifier<int>(0);
  ValueNotifier<int> wishListCountNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    context.read<FavoriteBloc>().add(LoadFavoritesEvent());
    context.read<ProfileBloc>().add(LoadProfile());
    context.read<HistoryBloc>().add(LoadHistory());
  }

  Future<void> openUpdateProfile() async {
    final updatedProfile = await Navigator.push<Profile>(
      context,
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => sl<UpdateProfileBloc>()),
            BlocProvider(create: (_) => sl<ProfileBloc>()..add(LoadProfile())),
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
      context.read<ProfileBloc>().add(LoadProfile());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<FavoriteBloc, FavoriteState>(
          listener: (context, state) {
            if (state is FavoritesLoaded) {
              setState(() {
                wishListCount = state.items.length;
              });
            }
          },
        ),

        BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileLoaded) {
              profile = state.profile;
              setState(() {});
            }
          },
        ),
      ],
      child: Scaffold(
        body: Column(
          children: [
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                final isLoading = state is ProfileLoading;
                return Container(
                  height: 356.h,
                  padding: EdgeInsets.only(top: 13.h, left: 12.w, right: 12.w),
                  decoration: BoxDecoration(color: ColorManager.border),
                  child: SafeArea(
                    bottom: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    ? SizedBox(width: 66.w)
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
                            BlocBuilder<FavoriteBloc, FavoriteState>(
                              builder: (context, state) {
                                final count = state is FavoritesLoaded ? state.items.length : 0;
                                return Column(
                                  children: [
                                    Text("$count", style: Theme.of(context).textTheme.displayLarge),
                                    SizedBox(height: 15.h),
                                    Text("Wish List", style: Theme.of(context).textTheme.displaySmall),
                                  ],
                                );
                              },
                            ),

                            BlocBuilder<HistoryBloc, HistoryState>(
                              builder: (context, state) {
                                int historyCount = 0;
                                if (state is HistoryLoaded)
                                  historyCount = state.history.length;
                                return Column(
                                  children: [
                                    Text(
                                      "$historyCount",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.displayLarge,
                                    ),
                                    SizedBox(height: 15.h),
                                    Text(
                                      "History",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.displaySmall,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 7,
                              child: ElevatedButton(
                                onPressed: isLoading ? null : openUpdateProfile,
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
                                onTap: () async {
                                  await SessionService.clearAuthToken();
                                  Navigator.pushReplacementNamed(
                                    context,
                                    AppRoutes.login,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomWatchHistoryList(
                                onTap: () {
                                  setState(() => currentIndex = 0);
                                },
                                icon: Icons.list,
                                colorSelected: currentIndex == 0
                                    ? ColorManager.primary
                                    : Colors.transparent,
                                text: "Watch List",
                              ),
                            ),
                            Expanded(
                              child: CustomWatchHistoryList(
                                onTap: () {
                                  setState(() => currentIndex = 1);
                                },
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
      ),
    );
  }
}
