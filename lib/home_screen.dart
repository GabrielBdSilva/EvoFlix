import 'package:evoflix/api/api.dart';
import 'package:evoflix/models/movieModel.dart';
import 'package:evoflix/screens/search.dart';
import 'package:evoflix/widgets/movies_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<MovieModel>> popularMovies;
  //List<MovieModel> filteredMovies = [];
  //String searchQuery = '';

  @override
  void initState() {
    super.initState();
    popularMovies = Api().getPopularMovies();
  }

  // void _filterMovies(String query, List<MovieModel>? movies) {
  //   if (movies != null) {
  //     setState(() {
  //       searchQuery = query;
  //       filteredMovies = movies.where((movie) {
  //         return movie.title.toLowerCase().contains(query.toLowerCase());
  //       }).toList();
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: TextField(
          onSubmitted: (query) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Search(query: query),
              ),
            );
          },
          // onChanged: (query) async {
          //   final movies = await popularMovies;
          //   _filterMovies(query, movies);
          // },

          decoration: InputDecoration(
            hintText: 'Pesquisar Filme',
            hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          ),
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Text('THE BEST EVO FILMS'),
          const SizedBox(height: 30),
          Expanded(
            child: FutureBuilder(
              future: popularMovies,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  //final moviesToShow = searchQuery.isEmpty ? snapshot.data! : filteredMovies;

                  // moviesToShow.sort((a, b) {
                  //   final yearComparison = a.releasesDate.compareTo(b.releasesDate);
                  //   if (yearComparison != 0) {
                  //     return yearComparison;
                  //   }
                  //  return a.title.compareTo(b.title);
                 
                  return MoviesSlider(movies: snapshot.data!);

                 // });

                 // return MoviesSlider(movies: moviesToShow);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
