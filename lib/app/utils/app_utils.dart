const _baseImageUrl = 'https://image.tmdb.org/t/p/w500';

class AppUtils {
  AppUtils._();

  static String addBaseImageUrl(String path) => _baseImageUrl + path;
}
