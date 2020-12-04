import 'package:json_annotation/json_annotation.dart';
part 'popular.g.dart';

@JsonSerializable()
class Popular {
  double popularity;
  @JsonKey(name: "vote_count")
  int voteCount;
  bool video;
  @JsonKey(name: "poster_path")
  String posterPath;
  int id;
  bool adult;
  @JsonKey(name: "backdrop_path")
  String backdropPath;
  @JsonKey(name: "original_language")
  String originalLanguage;
  @JsonKey(name: "original_title")
  String originalTitle;
  @JsonKey(name: "genre_ids")
  List<int> genreIds;
  String title;
  @JsonKey(name: "vote_average")
  double voteAverage;
  String overview;
  @JsonKey(name: "release_date")
  String releaseDate;

  Popular(
      [this.popularity,
        this.voteCount,
        this.video,
        this.posterPath,
        this.id,
        this.adult,
        this.backdropPath,
        this.originalLanguage,
        this.originalTitle,
        this.genreIds,
        this.title,
        this.voteAverage,
        this.overview,
        this.releaseDate]);

  factory Popular.fromJson(Map<String, dynamic> json) => _$PopularFromJson(json);
  Map<String, dynamic> toJson() => _$PopularToJson(this);
}

