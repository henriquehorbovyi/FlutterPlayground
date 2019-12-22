import 'dart:async';
import 'dart:convert';
import 'package:bloc_pattern/model/search_mode.dart';
import 'package:http/http.dart' as http;

class HomeBlock {

  final StreamController<String> _streamController = StreamController<String>.broadcast();
  
  Sink<String> get input =>_streamController.sink; 
  Stream<SearchResponse> get output => _streamController
  .stream
  .where((cep) => cep.length > 7)
  .asyncMap((cep) => _searchCep(cep));

  String _url(String cep) => "https://viacep.com.br/ws/$cep/json";

  Future<SearchResponse> _searchCep(String cep) async {
      var response = await http.get(_url(cep));
      if (response.statusCode != 400)
        return SearchResponse.fromJson(jsonDecode(response.body));
      return SearchResponse();
  } 

}