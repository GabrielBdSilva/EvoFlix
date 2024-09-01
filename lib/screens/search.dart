import 'package:evoflix/api/api.dart';
import 'package:evoflix/models/movieModel.dart';
import 'package:evoflix/widgets/movies_slider.dart';
import 'package:flutter/material.dart';


class Search extends StatefulWidget {
  final String query;

  const Search({Key? key, required this.query}) : super(key: key);

  @override
  _SearchResultsScreenState createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<Search> {
  late Future<List<MovieModel>> searchResults;

  @override
  void initState() {
    super.initState();
    searchResults = _searchMovies(widget.query);
  }

  Future<List<MovieModel>> _searchMovies(String query) async {
    final response = await Api().searchMovies(query);
    //return response;

    final filteredMovies = response.where((movie) {
      return movie.posterPath != null && movie.posterPath.isNotEmpty && movie.posterPath != "null";
    }).toList();


    filteredMovies.sort((a, b) {
      final yearComparison = (b.releasesDate ?? '').compareTo(a.releasesDate ?? '');
      if (yearComparison != 0) {
        return yearComparison;
      }
      return (b.title).compareTo(a.title);
    });

    return filteredMovies;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultados para "${widget.query}"'),
      ),
      body: FutureBuilder<List<MovieModel>>(
        future: searchResults,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return Center(child: Text('Nenhum filme encontrado.'));
            }

            return MoviesSlider(movies: snapshot.data!);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
