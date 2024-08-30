import 'package:flutter/material.dart';

class MovieModel{
  String title;
  String backDropPath;
  String originalTitle;
  String overview;
  String posterPath;
  String releasesDate;
  double voteAverage;

MovieModel({
  required this.title,
  required this.backDropPath,
  required this.originalTitle,
  required this.overview,
  required this.posterPath,
  required this.releasesDate,
  required this.voteAverage,

});
  factory MovieModel.fromJson(Map<String, dynamic>json){
    return MovieModel(
      title: json ["title"].toString(),
      backDropPath: json ["backDrop_path"].toString(),
      originalTitle: json ["original_title"].toString(), 
      overview: json ["overview"].toString(),
      posterPath: json ["poster_path"].toString(),
      releasesDate: json ["releases_date"].toString(),
      voteAverage: json ["vote_average"] as double,
      );
  }

  
}