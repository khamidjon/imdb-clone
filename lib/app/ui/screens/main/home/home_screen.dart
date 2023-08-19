import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_clone/app/ui/screens/main/home/home_screen_view_model.dart';
import 'package:imdb_clone/app/ui/screens/main/home/widgets/movie_item.dart';
import 'package:imdb_clone/domain/bloc/home_bloc.dart';
import 'package:imdb_clone/domain/state/home_state.dart';
import 'package:imdb_clone/library/resource/typography.dart';
import 'package:imdb_localization/strings.g.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    required this.viewModel,
    super.key,
  });

  final HomeScreenViewModel viewModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      widget.viewModel.fetchTrendingMovies(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32.0),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                context.t.home.trendingThisWeek,
                style: AppTypography.title,
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 312.0,
              child: BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (_, state) => state is TrendingMoviesHomeState,
                builder: (context, state) {
                  if (state is FetchedTrendingMoviesHomeState) {
                    return ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.movies.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 8.0),
                      itemBuilder: (_, index) {
                        final movie = state.movies[index];
                        return Row(
                          children: [
                            if (index == 0) const SizedBox(width: 16.0),
                            MovieItem(
                              movie: movie,
                              index: index,
                            ),
                            if (index == state.movies.length - 1)
                              const SizedBox(width: 16.0),
                          ],
                        );
                      },
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
