import 'package:evoflix/constants.dart';
import 'package:evoflix/models/movieModel.dart';
import 'package:evoflix/screens/details.dart';
import 'package:flutter/material.dart';

class MoviesSlider extends StatelessWidget {
  const MoviesSlider({
    super.key, 
    required this.movies,
  });

  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //  colunas
          //crossAxisSpacing: 0.0, // Espaço entre os  filmeshorizontal
          mainAxisSpacing: 60.0, // Espaço ente os filmes vertical
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Details(
                    movieModel: movies[index],
                  ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: SizedBox(
                height: 500,
                width: double.infinity,
                child: Image.network(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.contain,
                  '${Constants.imagePath}${movies[index].posterPath}',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
