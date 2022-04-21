// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MovieModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      Title: json['Title'],
      Actors: json['Actors'],
      Director: json['Director'],
      Genre: json['Genre'],
      Ratings: json['Ratings'],
      imdbRatings: json['imdbRatings'],
      Language: json['Language'],
      Poster: json['Poster'],
      Rated: json['Rated'],
      Released: json['Released'],
      Runtime: json['Runtime'],
      Writer: json['Writer'],
      Year: json['Year'],
      imdbID: json['imdbID'],
      Awards: json['Awards'],
      Country: json['Country'],
      Type: json['Type'],
      Plot: json['Plot'],
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'Title': instance.Title,
      'Year': instance.Year,
      'Rated': instance.Rated,
      'Released': instance.Released,
      'Runtime': instance.Runtime,
      'Genre': instance.Genre,
      'Director': instance.Director,
      'Writer': instance.Writer,
      'Actors': instance.Actors,
      'Language': instance.Language,
      'Country': instance.Country,
      'Awards': instance.Awards,
      'Poster': instance.Poster,
      'Ratings': instance.Ratings,
      'imdbRatings': instance.imdbRatings,
      'Type': instance.Type,
      'imdbID': instance.imdbID,
      'Plot': instance.Plot,
    };
