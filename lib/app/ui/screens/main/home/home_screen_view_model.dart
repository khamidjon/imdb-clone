import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_clone/domain/bloc/home_bloc.dart';
import 'package:imdb_clone/domain/event/home_event.dart';

class HomeScreenViewModel {
  void fetchTrendingMovies(BuildContext context) {
    context.read<HomeBloc>().add(FetchTrendingMoviesHomeEvent());
  }
}
