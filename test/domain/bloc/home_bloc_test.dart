import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:imdb_clone/domain/bloc/home_bloc.dart';
import 'package:imdb_clone/domain/event/home_event.dart';
import 'package:imdb_clone/domain/repositories/movie_repository.dart';
import 'package:imdb_clone/domain/state/home_state.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_data/mock_data.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
  });

  group('HomeBloc', () {
    blocTest(
      'HomeBloc - fetch trending movies - success',
      build: () {
        when(() => mockMovieRepository.getTrendingMoviesOfThisWeek())
            .thenAnswer((invocation) => Future.value(fakeMovies));
        return HomeBloc(mockMovieRepository);
      },
      act: (bloc) => bloc.add(FetchTrendingMoviesHomeEvent()),
      expect: () => [
        FetchingTrendingMoviesHomeState(),
        FetchedTrendingMoviesHomeState(fakeMovies),
      ],
    );

    blocTest(
      'HomeBloc - fetch trending movies - fail',
      build: () {
        when(() => mockMovieRepository.getTrendingMoviesOfThisWeek())
            .thenThrow(Exception());
        return HomeBloc(mockMovieRepository);
      },
      act: (bloc) => bloc.add(FetchTrendingMoviesHomeEvent()),
      expect: () => [
        FetchingTrendingMoviesHomeState(),
        FetchFailTrendingMoviesHomeState(),
      ],
    );

    blocTest(
      'HomeBloc - fetch top rated movies - success',
      build: () {
        when(() => mockMovieRepository.getTopRatedMovies())
            .thenAnswer((invocation) => Future.value(fakeMovies));
        return HomeBloc(mockMovieRepository);
      },
      act: (bloc) => bloc.add(FetchTopRatedMoviesHomeEvent()),
      expect: () => [
        FetchingTopRatedMoviesHomeState(),
        FetchedTopRatedMoviesHomeState(fakeMovies),
      ],
    );

    blocTest(
      'HomeBloc - fetch top rated movies - fail',
      build: () {
        when(() => mockMovieRepository.getTrendingMoviesOfThisWeek())
            .thenThrow(Exception());
        return HomeBloc(mockMovieRepository);
      },
      act: (bloc) => bloc.add(FetchTopRatedMoviesHomeEvent()),
      expect: () => [
        FetchingTopRatedMoviesHomeState(),
        FetchFailTopRatedMoviesHomeState(),
      ],
    );
  });
}
