
import 'package:json_annotation/json_annotation.dart';

part 'MovieModel.g.dart';

@JsonSerializable()
class MovieModel {
  var Title;
  var Year;
  var Rated;
  var Released;//date wise
  var Runtime;
  var Genre;
  var Director;
  var Writer;
  var Actors;
  var Language;
  var Country;
  var Awards;
  var Poster;
  var Ratings;
  var imdbRatings;
  var Type;
  var imdbID;
  var Plot;

  MovieModel(
      {this.Title,
        this.Actors,
        this.Director,
        this.Genre,
        this.Ratings,
        this.imdbRatings,
        this.Language,
        this.Poster,
        this.Rated,
        this.Released,
        this.Runtime,
        this.Writer,
        this.Year,
        this.imdbID,
        this.Awards,
        this.Country,
        this.Type,
        this.Plot
      });

  factory MovieModel.fromJson(Map<String,dynamic>json)=> _$MovieModelFromJson(json);
  Map<String,dynamic> toJson()=> _$MovieModelToJson(this);
}