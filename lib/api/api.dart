import 'dart:convert';

import 'package:evoflix/constants.dart';
import 'package:evoflix/models/movieModel.dart';
import 'package:http/http.dart' as http;

class Api{
  static const _PopularUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apiKey}';

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
