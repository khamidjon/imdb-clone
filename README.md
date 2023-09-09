# imdb_clone

IMDB clone app.

## Quick start

After cloning the repository you should:
- register in https://www.themoviedb.org and get read access token
- create .env file in project root and save token as TEMP_TOKEN, refer to [video](https://youtu.be/MseP-BXzSuc?t=90)
- then you can get started by using the Flutter version specified in
the [pubspec.yaml](pubspec.yaml) file and by running:

```
flutter packages pub run build_runner build --delete-conflicting-outputs
cd packages/imdb_localization && flutter pub get && flutter pub run slang && cd ../../
```


