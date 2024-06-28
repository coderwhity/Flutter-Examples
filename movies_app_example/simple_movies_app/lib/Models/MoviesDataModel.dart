class MoviesDataModel{
  String title;
  String year;
  String poster;
  String id;

  factory MoviesDataModel.fromJson(Map<String, dynamic> json) {
    return MoviesDataModel(
      title: json['Title'] ?? '',
      year: json['Year'] ?? '',
      poster: json['Poster'] ?? '',
      id: json['imdbID'] ?? '',
    );
  }

  MoviesDataModel({
    required this.title,
    required this.year,
    required this.poster,
    required this.id,
});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'year': year,
      'poster': poster,
      'Id':id,
    };
  }

  static List<MoviesDataModel> listFromJson(List<dynamic> data){
    List<MoviesDataModel> modelData = [];
    for(int i=0;i<data.length;i++){
      Map<String,dynamic> mapData = data[i];
      modelData.add(MoviesDataModel.fromJson(mapData));
    }
    return modelData;
  }
}