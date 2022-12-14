import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);


    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas en cines'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate() ), 
            )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            //tarjetas principales
            CardSwiper( movies: moviesProvider.onDisplayMovies),

            //SLider de películas
            MovieSlider(
              movies: moviesProvider.popularMovies, // populares
              title: 'Populares', //opcional
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),
            
          ],
        )
      )
    );
  }
}