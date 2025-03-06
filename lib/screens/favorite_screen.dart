import 'package:flutter/material.dart';
import 'package:pilem/models/movie.dart';
import 'package:pilem/screens/detail_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Movie> _favoriteMovies = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Movies'),
      ),
      body: ListView.builder(
        itemBuilder: (context,index){
          final Movie movie = _favoriteMovies[index];
          return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ListTile(
                        leading: Image.network(
                          movie.posterPath.trim() != ''
                              ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
                              : 'https://placehold.co/50x75?text=No+Image',
                          width: 50,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                        title: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(movie.title),
                        ),
                        onTap: () {
                          Navigator.push<dynamic>(
                            context,
                            MaterialPageRoute<dynamic>(
                              builder: (context) => DetailScreen(movie: movie),
                            ),
                          );
                        },
                      ),
                    );
        },
        ),
    );
  }
}