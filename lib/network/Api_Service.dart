import 'package:dio/dio.dart';
import 'package:imdb_movie_app/network/models/MovieModel.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';


import 'constants.dart';
import 'models/MovieResponseModel.dart';

part 'Api_Service.g.dart';

@RestApi(baseUrl:baseUrl)
abstract class ApiService{
  factory ApiService(Dio dio,{String? baseUrl}) = _ApiService;
  static ApiService create(){
    final dio = Dio();
    // dio.interceptors.add(PrettyDioLogger());
    return ApiService(dio);
  }

  @GET("&s={searchValue}")
  Future<MovieResponseModel>getMovieBySearch(@Path("searchValue") String searchValue);

  @GET("&i={id}&plot={plotVal}")
  Future<MovieModel>getMovieById(@Path("id") String id, @Path("plotVal") String plotVal);
}