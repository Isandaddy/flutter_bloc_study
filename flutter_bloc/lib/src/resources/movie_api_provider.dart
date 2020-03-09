import 'package:flutter_bloc/src/models/item_model.dart';
import 'package:http/http.dart' show Client, Response;
import 'dart:async';
import 'dart:convert';

class MovieApiProvider{
  Client client = Client();
  final _apiKey = '2574a110e56933b74befa6bd299ecf50';
  final _baseUrl = 'http://api.themoviedb.org/3/movie';

  Future<ItemModel> fetchMovieList() async {
    print("entered");
    Response response;
    if(_apiKey == '2574a110e56933b74befa6bd299ecf50') {
       response = await client.get("$_baseUrl/popular?api_key=$_apiKey");
    }else{
      throw Exception('Please add your API key');
    }
    print(response.body.toString());
    if(response.statusCode == 200){
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}