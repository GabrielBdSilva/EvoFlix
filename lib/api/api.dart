import 'dart:convert';

import 'package:evoflix/constants.dart';
import 'package:evoflix/models/movieModel.dart';
import 'package:http/http.dart' as http;

class Api{
  static const _PopularUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apiKey}';
  static const _searchUrl = 'https://api.themoviedb.org/3/search/movie?api_key=${Constants.apiKey}&query=';

  Future<List<MovieModel>> searchMovies(String query) async {
    final response = await http.get(Uri.parse('$_searchUrl$query'));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      
      //return decodedData.map((movie) => MovieModel.fromJson(movie)).toList();
      
      return decodedData.map((movie) => MovieModel.fromJson(movie)).where((movie) {
        return movie.title.isNotEmpty && movie.posterPath.isNotEmpty && movie.posterPath != null;
      }).toList();

    } else {
      throw Exception('Falha na pesquisa');
    }
  }


  Future <List<MovieModel>> getPopularMovies () async{
    final response = await http.get(Uri.parse(_PopularUrl));
    if(response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie)=> MovieModel.fromJson(movie)).toList();
    }else{
      throw Exception('deu erro -_-');
    }
  }


}
