
class LatestMovie {
  LatestMovie({
      this.adult, 
      this.backdropPath, 
      this.belongsToCollection, 
      this.budget,
      this.homepage, 
      this.id, 
      this.imdbId, 
      this.originalLanguage, 
      this.originalTitle, 
      this.overview, 
      this.popularity, 
      this.posterPath,
      this.releaseDate, 
      this.revenue, 
      this.runtime,
      this.status, 
      this.tagline, 
      this.title, 
      this.video, 
      this.voteAverage, 
      this.voteCount,
    this.code,
    this.message});

  LatestMovie.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'];
    budget = json['budget'];
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    code = json['code'];
    message = json['message'];
  }
  bool? adult;
  dynamic backdropPath;
  dynamic belongsToCollection;
  int? budget;
  List<dynamic>? genres;
  String? homepage;
  int? id;
  dynamic imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<dynamic>? productionCompanies;
  List<dynamic>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<dynamic>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  String? code;
  String? message;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['belongs_to_collection'] = belongsToCollection;
    map['budget'] = budget;
    map['homepage'] = homepage;
    map['id'] = id;
    map['imdb_id'] = imdbId;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['revenue'] = revenue;
    map['runtime'] = runtime;
    map['status'] = status;
    map['tagline'] = tagline;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    map['code'] = code;
    map['message'] = message;
    return map;
  }

}