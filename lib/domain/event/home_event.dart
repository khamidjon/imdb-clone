import 'package:equatable/equatable.dart';

sealed class HomeEvent with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class FetchTrendingMoviesHomeEvent extends HomeEvent {}
