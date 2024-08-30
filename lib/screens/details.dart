import 'package:evoflix/constants.dart';
import 'package:evoflix/models/movieModel.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget{
  const Details({
    super.key,
    required this.movieModel,
  });
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar.large(
          leading: Container(
            height: 70,
            width: 70,
            margin: const EdgeInsets.only(
              top: 16,
              left: 16
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(134, 0, 0, 0),
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_rounded,
              ),
            )
          ),
          backgroundColor: Colors.transparent,
          expandedHeight: 500, //tamnho da area onde fica a imagem
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              //movieModel.title,
              '',//é o titulo do filme mas n preciso por agr
              ),
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                child: Image.network(
                  '${Constants.imagePath}${movieModel.posterPath}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(padding: EdgeInsets.all(12),
          child: Column(children: [
            Text(
              'OverView'
            ),
            const SizedBox(height: 16),
            Text(
              movieModel.overview
            )
          ],),
          ),
        )
      ],),
    );
  }
}