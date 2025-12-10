import 'package:final_route_projcet_c16/core/constants/color_manager.dart';
import 'package:final_route_projcet_c16/features/main/browser/presentation/view/browse.dart';
import 'package:final_route_projcet_c16/features/main/home/presentation/view/home_screen.dart';
import 'package:final_route_projcet_c16/features/main/home/presentation/view_model/bloc/home_bloc.dart';
import 'package:final_route_projcet_c16/features/main/profile/presentation/view/profile_screen.dart';
import 'package:final_route_projcet_c16/features/main/profile/presentation/view_model/bloc/profile_bloc.dart';
import 'package:final_route_projcet_c16/features/main/search/presentation/view/search.dart';
import 'package:final_route_projcet_c16/features/main/search/presentation/view_model/bloc/search_bloc.dart';
import 'package:final_route_projcet_c16/features/update_profile/presentation/view_model/bloc/update_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/di/di.dart';
import 'browser/presentation/view_model/bloc/browse_bloc.dart';
import 'browser/presentation/view_model/bloc/browse_event.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});
  @override
  State<MainLayout> createState() => MainLayoutState();
}

class MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    BlocProvider<MoviesBloc>(
      create: (_) => sl<MoviesBloc>(),
      child: HomeScreen(),
    ),
    BlocProvider(create: (_) => sl<SearchBloc>(), child: Search()),
    BlocProvider(create: (_) =>
    sl<BrowseBloc>()..add(LoadMovieEvent()), child: Browse()),
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<ProfileBloc>()..add(LoadProfile())),
        BlocProvider(create: (_) => sl<UpdateProfileBloc>()),
      ],
      child: ProfileScreen(),
    ),
    BlocProvider(
      create: (_) => sl<BrowseBloc>()..add(LoadMovieEvent()),
      child: Browse(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_currentIndex],
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 18.w),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.h),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: ColorManager.border,
            selectedItemColor: ColorManager.primary,
            unselectedItemColor: ColorManager.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,

            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });

  //              if (_currentIndex == 0) {
  //   context.read<MoviesBloc>().add( ReloadGenres());
  // }
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore_outlined),
                activeIcon: Icon(Icons.explore),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
