/// adult : false
/// backdrop_path : "/zBkHCpLmHjW2uVURs5uZkaVmgKR.jpg"
/// belongs_to_collection : null
/// budget : 0
/// genres : [{"id":16,"name":"Animation"},{"id":35,"name":"Comedy"},{"id":10751,"name":"Family"}]
/// homepage : ""
/// id : 585245
/// imdb_id : "tt2397461"
/// original_language : "en"
/// original_title : "Clifford the Big Red Dog"
/// overview : "As Emily struggles to fit in at home and at school, she discovers a small red puppy who is destined to become her best friend. When Clifford magically undergoes one heck of a growth spurt, becomes a gigantic dog and attracts the attention of a genetics company, Emily and her Uncle Casey have to fight the forces of greed as they go on the run across New York City. Along the way, Clifford affects the lives of everyone around him and teaches Emily and her uncle the true meaning of acceptance and unconditional love."
/// popularity : 2734.004
/// poster_path : "/ygPTrycbMSFDc5zUpy4K5ZZtQSC.jpg"
/// production_companies : [{"id":4,"logo_path":"/fycMZt242LVjagMByZOLUGbCvv3.png","name":"Paramount","origin_country":"US"},{"id":8147,"logo_path":"/q6HOAdSNgCbeOqwoMVRc6REgbXF.png","name":"Entertainment One","origin_country":"CA"},{"id":7311,"logo_path":null,"name":"Kerner Entertainment Company","origin_country":""},{"id":30246,"logo_path":null,"name":"Scholastic Entertainment","origin_country":"US"},{"id":114732,"logo_path":"/tNCbisMxO5mX2X2bOQxHHQZVYnT.png","name":"New Republic Pictures","origin_country":"US"},{"id":10221,"logo_path":"/99VfWRgKasZoyK9UVB39gnYvFrZ.png","name":"Walden Media","origin_country":"US"}]
/// production_countries : [{"iso_3166_1":"CA","name":"Canada"},{"iso_3166_1":"GB","name":"United Kingdom"},{"iso_3166_1":"US","name":"United States of America"}]
/// release_date : "2021-11-10"
/// revenue : 51000000
/// runtime : 97
/// spoken_languages : [{"english_name":"English","iso_639_1":"en","name":"English"}]
/// status : "Released"
/// tagline : "Adventure has never been bigger."
/// title : "Clifford the Big Red Dog"
/// video : false
/// vote_average : 7.6
/// vote_count : 464

class MovieDetails {
  MovieDetails({
      this.adult, 
      this.backdropPath, 
      this.belongsToCollection, 
      this.budget, 
      this.genres, 
      this.homepage, 
      this.id, 
      this.imdbId, 
      this.originalLanguage, 
      this.originalTitle, 
      this.overview, 
      this.popularity, 
      required this.posterPath,
      this.productionCompanies, 
      this.productionCountries, 
      this.releaseDate, 
      this.revenue, 
      this.runtime, 
      this.spokenLanguages, 
      this.status, 
      this.tagline, 
      this.title, 
      this.video, 
      this.voteAverage, 
      this.voteCount,
    this.code,
    this.message});

  MovieDetails.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'];
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    code = json['code'];
    message = json['message'];
    if (json['production_companies'] != null) {
      productionCompanies = [];
      json['production_companies'].forEach((v) {
        productionCompanies?.add(Production_companies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = [];
      json['production_countries'].forEach((v) {
        productionCountries?.add(Production_countries.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = [];
      json['spoken_languages'].forEach((v) {
        spokenLanguages?.add(Spoken_languages.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
  bool? adult;
  String? backdropPath;
  dynamic belongsToCollection;
  int? budget;
  List<Genres>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String posterPath=" ";
  List<Production_companies>? productionCompanies;
  List<Production_countries>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<Spoken_languages>? spokenLanguages;
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
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    map['homepage'] = homepage;
    map['id'] = id;
    map['imdb_id'] = imdbId;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    map['code'] = code;
    map['message'] = message;
    if (productionCompanies != null) {
      map['production_companies'] = productionCompanies?.map((v) => v.toJson()).toList();
    }
    if (productionCountries != null) {
      map['production_countries'] = productionCountries?.map((v) => v.toJson()).toList();
    }
    map['release_date'] = releaseDate;
    map['revenue'] = revenue;
    map['runtime'] = runtime;
    if (spokenLanguages != null) {
      map['spoken_languages'] = spokenLanguages?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['tagline'] = tagline;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

}

/// english_name : "English"
/// iso_639_1 : "en"
/// name : "English"

class Spoken_languages {
  Spoken_languages({
      this.englishName, 
      this.iso6391, 
      this.name,});

  Spoken_languages.fromJson(dynamic json) {
    englishName = json['english_name'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }
  String? englishName;
  String? iso6391;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['english_name'] = englishName;
    map['iso_639_1'] = iso6391;
    map['name'] = name;
    return map;
  }

}

/// iso_3166_1 : "CA"
/// name : "Canada"

class Production_countries {
  Production_countries({
      this.iso31661, 
      this.name,});

  Production_countries.fromJson(dynamic json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }
  String? iso31661;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iso_3166_1'] = iso31661;
    map['name'] = name;
    return map;
  }

}

/// id : 4
/// logo_path : "/fycMZt242LVjagMByZOLUGbCvv3.png"
/// name : "Paramount"
/// origin_country : "US"

class Production_companies {
  Production_companies({
      this.id, 
      this.logoPath, 
      this.name, 
      this.originCountry,});

  Production_companies.fromJson(dynamic json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['logo_path'] = logoPath;
    map['name'] = name;
    map['origin_country'] = originCountry;
    return map;
  }

}

/// id : 16
/// name : "Animation"

class Genres {
  Genres({
      this.id, 
      this.name,});

  Genres.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}