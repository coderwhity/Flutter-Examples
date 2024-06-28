import 'package:flutter/material.dart';
import 'package:simple_movies_app/Models/MoviesDataModel.dart';
import 'package:simple_movies_app/Screens/MovieInfoPage.dart';
import 'package:simple_movies_app/Services/MovieServices.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var movieName = TextEditingController();
  List<MoviesDataModel> movies = [];
  bool isLoading = false;

  void fetchinit() async {
    isLoading = true;
    setState(() {
      isLoading;
    });
    movies = await MovieService.fetchMovie("Pokemon");
    setState(() {
      movies;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchinit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: movieName,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21)),
                    label: Text("Enter Movie Name:")),
              ),
              SizedBox(
                height: 14,
              ),
              ElevatedButton(
                  onPressed: () async {
                    isLoading = true;
                    setState(() {
                      isLoading;
                    });
                    movies = await MovieService.fetchMovie(movieName.text);
                    setState(() {
                      movies;
                      isLoading = false;
                    });
                  },
                  child: Text("Search")),
              isLoading
                  ? CircularProgressIndicator()
                  : Expanded(
                      child: ListView.builder(
                          itemCount: movies.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MovieInfoPage(movieId: movies[index].id,)));
                                  print(movies[index].id);
                                },
                                title: Text("Movie: ${movies[index].title}"),
                                subtitle: Text("Movie: ${movies[index].year}"),
                                leading: Image.network(movies[index].poster),
                                // leading: Text("Movie: ${movies[index].poster}")
                              ),
                            );
                          }),
                    )
            ],
          ),
        ));
  }
}