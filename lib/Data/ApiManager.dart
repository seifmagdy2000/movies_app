import 'package:dio/dio.dart';
import 'package:movies_app/Data/new_movies.dart';
import 'package:movies_app/Data/popular_movies.dart';
import 'package:movies_app/Data/related_movies.dart';
import 'package:movies_app/Data/search.dart';
import 'genres.dart';
import 'latest_movie.dart';
import 'movie_details.dart';
class ApiManager {
  static const String apiKey = '804472a0b17ddae55a8d33fd5d6044e7';
  static String mainUrl = "https://api.themoviedb.org/3";
  static var getPopularUrl = '$mainUrl/movie/top_rated';
  static var getLatestUrl = '$mainUrl/movie/latest';
  static var getNewUrl = '$mainUrl/movie/upcoming';
  static int id = 585245;
  static var getDetailsUrl = '$mainUrl/movie/$id';
  static var getSimilarUrl = '$mainUrl/movie/$id/similar';
  static var getSearchUrl = '$mainUrl/search/movie';
  static var getGeneresUrl = '$mainUrl/genre/movie/list';
  static var getVideoUrl = '$mainUrl/movie/$id/videos';
  static Dio _dio = Dio();


  static Future<PopularMovies> loadPopularMovies(int page) async {
    var params = {
      'api_key': apiKey,
      'language': "en-US",
      'page': page,
    };
    Response response = await _dio.get(getPopularUrl,queryParameters: params);
    if (response.statusCode==200){
      return PopularMovies.fromJson(response.data);
    }else{
      if(response.data.message!=null)
        throw Exception(response.data.message);
      else
        throw Exception("error loading the movie");
    }
  }

  static Future<LatestMovie> loadLatestMovie() async {
    var params = {
      'api_key': apiKey,
      'language': "en-US",
    };
    Response response = await _dio.get(getLatestUrl,queryParameters: params);
    if (response.statusCode==200){
      return LatestMovie.fromJson(response.data);
    }else{
      if(response.data.message!=null)
        throw Exception(response.data.message);
      else
        throw Exception("error loading the movie");
    }
  }
  static Future<NewMovies> loadNewMovie(int page) async {
    var params = {
      'api_key': apiKey,
      'page': page,
    };
    Response response = await _dio.get(getNewUrl,queryParameters: params);
    if (response.statusCode==200){
      return NewMovies.fromJson(response.data);
    }else{
      if(response.data.message!=null)
        throw Exception(response.data.message);
      else
        throw Exception("error loading the movie");
    }
  }

  static Future<MovieDetails> loadMovieDetails(id) async {
    getDetailsUrl = '$mainUrl/movie/$id';
    var params = {
      'api_key': apiKey,
      'language': "en-US",
    };
    Response response = await _dio.get(getDetailsUrl,queryParameters: params);
    if (response.statusCode==200){
      return MovieDetails.fromJson(response.data);
    }else{
      if(response.data.message!=null)
        throw Exception(response.data.message);
      else
        throw Exception("error loading the movie");
    }
  }
  static Future<RelatedMovies> loadRelatedMovie(int page, id) async {
    getSimilarUrl = '$mainUrl/movie/$id/similar';
    var params = {
      'api_key': apiKey,
      'page': page,
    };
    Response response = await _dio.get(getSimilarUrl,queryParameters: params);
    if (response.statusCode==200){
      return RelatedMovies.fromJson(response.data);
    }else{
      if(response.data.message!=null)
        throw Exception(response.data.message);
      else
        throw Exception("error loading the movie");
    }
  }
  static Future<Search> loadSearchedItems(int page,String name) async {
    var params = {
      'api_key': apiKey,
      'language': "en-US",
      'page': page,
      'include_adult': false,
      'query': name
    };
    Response response = await _dio.get(getSearchUrl,queryParameters: params);
    if (response.statusCode==200){
      return Search.fromJson(response.data);
    }else{
      if(response.data.message!=null)
        throw Exception(response.data.message);
      else
        throw Exception("error loading the movie");
    }
  }
  static Future<Generes> loadGeneres() async {
    var params = {
      'api_key': apiKey,
      'language': "en-US",
    };
    Response response = await _dio.get(getGeneresUrl,queryParameters: params);
    if (response.statusCode==200){
      return Generes.fromJson(response.data);
    }else{
      if(response.data.message!=null)
        throw Exception(response.data.message);
      else
        throw Exception("error loading the movie");
    }
  }
}


