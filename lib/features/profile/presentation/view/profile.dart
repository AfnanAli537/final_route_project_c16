import 'package:final_route_projcet_c16/core/constants/assets_manager.dart';
import 'package:final_route_projcet_c16/core/constants/color_manager.dart';
import 'package:final_route_projcet_c16/core/routes/app_routes.dart';
import 'package:final_route_projcet_c16/features/profile/presentation/widgets/custom_elevated_button_red.dart';
import 'package:final_route_projcet_c16/features/profile/presentation/widgets/custom_watch_history_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 14,
            child: Container(
              //height: 356.h,
              padding: REdgeInsets.only( left: 12, right: 12),
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
                              backgroundImage: AssetImage(ImageAssets.avatar1),
                            ),
                            SizedBox(height: 15.h),
                            Text(
                              "John Safwat",
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
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.updateProfile,
                              );
                            },
                            child: Text("Edit Profile"),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          flex: 3,
                          child: CustomElevatedButtonRed(
                            child: Row(
                              spacing: 5.sp,
                              children: [
                                Text(
                                  "Exit",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                Icon(Icons.logout),
                              ],
                            ),
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
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
            ),
          ),
          Expanded(
            flex: 17,
            child: currentIndex == 0
                ? Center(child: Image.asset(ImageAssets.emptySearch))
                : Center(
                    child: Text(
                      "No movies in History List",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
