import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_clone/domain/bloc/base_bloc.dart';
import 'package:imdb_clone/domain/event/home_event.dart';
import 'package:imdb_clone/domain/repositories/movie_repository.dart';
import 'package:imdb_clone/domain/state/home_state.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc(
    this._movieRepository,
  ) : super(InitialHomeState()) {
    on<FetchTrendingMoviesHomeEvent>(_handleFetchTrendingMovies);
    on<FetchTopRatedMoviesHomeEvent>(_handleFetchTopRatedMovies);
  }

  final MovieRepository _movieRepository;

  Future<void> _handleFetchTrendingMovies(
    FetchTrendingMoviesHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(FetchingTrendingMoviesHomeState());
    try {
      final data = await _movieRepository.getTrendingMoviesOfThisWeek();
      emit(FetchedTrendingMoviesHomeState(data));
    } on Object catch (_) {
      emit(FetchFailTrendingMoviesHomeState());
    }
  }

  Future<void> _handleFetchTopRatedMovies(
    FetchTopRatedMoviesHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(FetchingTopRatedMoviesHomeState());
    try {
      final data = await _movieRepository.getTopRatedMovies();
      emit(FetchedTopRatedMoviesHomeState(data));
    } on Object catch (_) {
      emit(FetchFailTopRatedMoviesHomeState());
    }
  }
}
