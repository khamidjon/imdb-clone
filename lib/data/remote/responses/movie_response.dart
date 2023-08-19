import 'package:json_annotation/json_annotation.dart';

part 'movie_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieResponse {
  const MovieResponse(
    this.id,
    this.title,
    this.voteAverage,
    this.posterPath,
  );

  final int id;
  final String title;
  final double voteAverage;
  final String posterPath;

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);
}

//      "adult": false,
//       "backdrop_path": "/4HodYYKEIsGOdinkGi2Ucz6X9i0.jpg",
//       "id": 569094,
//       "title": "Spider-Man: Across the Spider-Verse",
//       "original_language": "en",
//       "original_title": "Spider-Man: Across the Spider-Verse",
//       "overview": "After reuniting with Gwen Stacy, Brooklyn’s full-time, friendly neighborhood Spider-Man is catapulted across the Multiverse, where he encounters the Spider Society, a team of Spider-People charged with protecting the Multiverse’s very existence. But when the heroes clash on how to handle a new threat, Miles finds himself pitted against the other Spiders and must set out on his own to save those he loves most.",
//       "poster_path": "/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg",
//       "media_type": "movie",
//       "genre_ids": [
//         16,
//         28,
//         12,
//         878
//       ],
//       "popularity": 2517.658,
//       "release_date": "2023-05-31",
//       "video": false,
//       "vote_average": 8.457,
//       "vote_count": 3539
