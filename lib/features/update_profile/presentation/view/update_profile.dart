import 'package:final_route_projcet_c16/core/constants/assets_manager.dart';
import 'package:final_route_projcet_c16/core/constants/color_manager.dart';
import 'package:final_route_projcet_c16/features/profile/presentation/widgets/custom_elevated_button_red.dart';
import 'package:final_route_projcet_c16/features/search/presentation/widgets/custom_text_field.dart';
import 'package:final_route_projcet_c16/features/update_profile/presentation/widgets/avatar_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multiavatar/multiavatar.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  late TextEditingController nameController;
  late TextEditingController phoneController;
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

  // final seeds = [
  //   "avatar1",
  //   "avatar2",
  //   "avatar3",
  //   "avatar4",
  //   "avatar5",
  //   "avatar6",
  //   "avatar7",
  //   "avatar8",
  //   "avatar9",
  // ];
  final seeds = [
    "avatar6",
    "boy10",
    "boy3_smile",
    "girl1",
    "avatar9",
    "avatar8",
    "funny1",
    "funny2",
    "funny8",
  ];
  int? selected;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: REdgeInsets.all(8.0),
            child: Column(
              children: [
                if (selected != null &&
                    selected! >= 0 &&
                    selected! < seeds.length)
                  InkWell(
                    radius: 16.r,
                    onTap: showAvatarsBottomSheet,
                    child: CircleAvatar(
                      radius: 60,
                      child: SvgPicture.string(multiavatar(seeds[selected!])),
                    ),
                  )
                else
                  InkWell(
                    radius: 16.r,
                    onTap: showAvatarsBottomSheet,
                    child: CircleAvatar(
                      radius: 60,
                      child: SvgPicture.string(multiavatar(seeds[0])),
                    ),
                  ),
                SizedBox(height: 35.h),
                CustomTextField(
                  hintText: "Enter your name",
                  prefixIcon: Icon(Icons.person),
                  controller: TextEditingController(text: "John Safwat" ),
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  hintText: "Enter your phone",
                  prefixIcon: Icon(Icons.phone),
                  controller: TextEditingController(text: "01200000000" ),
                ),
                SizedBox(height: 30.h),
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Reset Password",
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                SizedBox(height: 230.h),
                SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButtonRed(
                    child: Text("Delete Account"),
                    onTap: () {},
                  ),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Update data"),
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
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
            itemCount: seeds.length,
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
                  widget: SvgPicture.string(multiavatar(seeds[index])),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
