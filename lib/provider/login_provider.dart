import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seneca_app/models/login_response.dart';

class LoginProvider extends ChangeNotifier {

  List<Result> resultados = [];

  LoginProvider(){ 
    print("LoginProvider inicializado");
    this.getLoginData();
  }

  Future<String> _getJsonData() async{
    
    final url = Uri.parse('https://opensheet.vercel.app/149zzcYE1utXnOeawKTjh2p7bFuPNNb8nL3xcXVInRcg/1');

    // Await the http get response, then decode the json-formatted respo
    final response = await http.get(url);

    return response.body;
  }

  getLoginData() async{
    
    final jsonData = await this._getJsonData();
   
    final loginData = LoginResponse.fromJson('{"results":'+jsonData+'}');
    //final loginData = LoginResponse.fromJson('{"results":[{"ID":"1","USER":"a","PASSWORD":"a"},{"ID":"2","USER":"b","PASSWORD":"b"},{"ID":"3","USER":"c","PASSWORD":"c"}]}');

    resultados = loginData.results;
    //print(resultados);
    notifyListeners();  
  }
  
}