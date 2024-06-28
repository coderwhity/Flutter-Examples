class MovieDetails {
  String title;
  String director;
  String writer;
  String poster;

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(
      title: json['Title'] ?? '',
      director: json['Director'] ?? '',
      writer: json['Writer'] ?? '',
      poster:json["Poster"] ?? ""
    );
  }

  MovieDetails({
    required this.title,
    required this.director,
    required this.writer,
    required this.poster
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'director': director,
      'writer': writer,
      'poster':poster,
    };
  }

  static List<MovieDetails> listFromJson(List<dynamic> data) {
    List<MovieDetails> modelData = [];
    for (int i = 0; i < data.length; i++) {
      Map<String, dynamic> mapData = data[i];
      modelData.add(MovieDetails.fromJson(mapData));
    }
    return modelData;
  }
}
