import 'package:flutter/material.dart';
import 'package:imdb_clone/domain/entities/movie_data.dart';
import 'package:imdb_clone/library/resource/colors.dart';
import 'package:imdb_clone/library/resource/typography.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    required this.movie,
    required this.index,
    super.key,
  });

  final MovieData movie;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.0,
      height: 308.0,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.5),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            movie.posterUrl,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 4.0),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  index.toString(),
                  style: AppTypography.text,
                ),
                const SizedBox(height: 2.0),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 2.0),
                    Text(
                      movie.rating.toString(),
                      style: AppTypography.smallTextSecondary,
                    ),
                  ],
                ),
                const SizedBox(height: 4.0),
                Text(
                  movie.title,
                  maxLines: 2,
                  softWrap: true,
                  style: AppTypography.smallText,
                ),
              ],
            ),
          ),
          const SizedBox(height: 2.0),
        ],
      ),
    );
  }
}
