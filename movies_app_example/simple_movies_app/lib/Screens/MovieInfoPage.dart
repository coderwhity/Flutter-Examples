import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_movies_app/Models/MovieModel.dart';
import 'package:simple_movies_app/Services/MovieServices.dart';

class MovieInfoPage extends StatefulWidget {
  String movieId = "";
  MovieInfoPage({super.key, required this.movieId});
  @override
  State<MovieInfoPage> createState() => _MovieInfoPageState(movieId: movieId);
}

class _MovieInfoPageState extends State<MovieInfoPage> {
  bool isSearching = true;
  String movieId = "";
  late MovieDetails? movieDetail;
  _MovieInfoPageState({required this.movieId});

  void fetchMovieData() async {
    setState(() {
      isSearching = true;
    });
    movieDetail = await MovieService.fetchMovieDetails(movieId);
    setState(() {
      movieDetail;
      isSearching = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchMovieData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Details"),
      ),
      body: isSearching
          ? Center(child: CircularProgressIndicator(color: Colors.purple,))
          : SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(child: Image.network(movieDetail!.poster ?? "")),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20.0),
                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movieDetail!.title,
                            style: TextStyle(color: Colors.black, fontSize: 25,fontWeight: FontWeight.w500),
                          ),
                      Text("Director : ${movieDetail!.director}"),
                      Text("Writer : ${movieDetail!.writer}"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
