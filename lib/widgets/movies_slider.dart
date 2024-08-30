import 'package:evoflix/constants.dart';
import 'package:evoflix/models/movieModel.dart';
import 'package:evoflix/screens/details.dart';
import 'package:flutter/material.dart';

class MoviesSlider extends StatelessWidget{
    const MoviesSlider({
      super.key, required this.movies,
    });

    //final AsyncSnapshot snapshot;

    final List<MovieModel> movies;

    @override
    Widget build(BuildContext context){
      return SizedBox(
          height: 200,
          width: double.infinity,
          child:ListView.builder( 
          scrollDirection : Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: movies.length,

          //do jeito q ta acima ele pega todos 
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
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
                    height: 200,
                    width: 150,
                    child: Image.network(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      '${Constants.imagePath}${movies[index].posterPath}',
                    ),
                ),
                            ),
              )
            );
          }
          
          )
        );
  
    }
}


