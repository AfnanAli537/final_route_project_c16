import 'package:final_route_projcet_c16/core/constants/assets_manager.dart';
import 'package:final_route_projcet_c16/core/constants/color_manager.dart';
import 'package:final_route_projcet_c16/features/main/search/presentation/view_model/bloc/search_bloc.dart';
import 'package:final_route_projcet_c16/features/main/search/presentation/view_model/bloc/search_event.dart';
import 'package:final_route_projcet_c16/features/main/search/presentation/view_model/bloc/search_state.dart';
import 'package:final_route_projcet_c16/features/main/search/presentation/widgets/custom_text_field.dart';
import 'package:final_route_projcet_c16/core/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late TextEditingController controller ;
  bool showClearButton = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {
      setState(() {
        showClearButton = controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  void _clearSearch() {
    controller.clear();
    context.read<SearchBloc>().add(SearchMovieEvent(query: ''));
    setState(() {
      showClearButton = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Column(
            children: [
              CustomTextField(
                controller: controller,
                hintText: 'Search',
                prefixIcon: Icon(Icons.search, color: ColorManager.white),
                suffixIcon: showClearButton
                    ? IconButton(
                  icon: Icon(Icons.clear, color: ColorManager.white),
                  onPressed: _clearSearch,
                )
                    : null,
                onChanged: (text) {
                  if (text != null) {
                    context.read<SearchBloc>().add(SearchMovieEvent(query: text));
                    setState(() {
                      showClearButton = text.isNotEmpty;
                    });
                  }
                },
              ),
              SizedBox(height: 10.h,),
              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state is SearchLoading) {
                      if (controller.text.isNotEmpty) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return Image.asset(ImageAssets.emptySearch);
                      }
                    }
                    if (controller.text.isEmpty) {
                      return Image.asset(ImageAssets.emptySearch);
                    }
                    if (state is SearchError) {
                      return Center(child: Text(state.message));
                    }
                    if (state is SearchInitial) {
                      return Image.asset(ImageAssets.emptySearch);
                    }
                    if (state is SearchLoaded) {
                      if (state.movies.isEmpty) {
                        return Image.asset(ImageAssets.emptySearch);
                      }
                      print('Movies count: ${state.movies.length}');

                      return GridView.builder(
                        padding: REdgeInsets.all(12),
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.65,
                        ),
                        itemCount: state.movies.length,
                        itemBuilder: (context, index) => MovieCard(
                          ratingText: state.movies[index].rating.toString(),
                          imageNetwork: state.movies[index].image,
                          movie: state.movies[index].id,
                        ),
                      );
                    }
                    return Image.asset(ImageAssets.emptySearch);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
