import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simple_movies_app/Models/MovieModel.dart';
import 'package:simple_movies_app/Models/MoviesDataModel.dart';

class MovieService {
  static Future<List<MoviesDataModel>> fetchMovie(String name) async {
    http.Response response = await http
        .get(Uri.parse("https://www.omdbapi.com/?s=$name&apikey=d13360e2"));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var dataKey = jsonResponse['Search'];
      if (dataKey == null) {
        return [];
      }
      List<MoviesDataModel> newData = MoviesDataModel.listFromJson(dataKey);
      print(newData);
      return newData;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return [];
    }
  }

  static Future<MovieDetails?> fetchMovieDetails(String id) async {
    http.Response response = await http
        .get(Uri.parse("https://www.omdbapi.com/?i=$id&apikey=d13360e2"));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      MovieDetails newData = MovieDetails.fromJson(jsonResponse);
      print(newData);
      return newData;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }
}
