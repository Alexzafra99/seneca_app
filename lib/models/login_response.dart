// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromMap(jsonString);

import 'dart:convert';

class LoginResponse {
    LoginResponse({
        required this.results,
    });

    List<Result> results;

    factory LoginResponse.fromJson(String str) => LoginResponse.fromMap(json.decode(str));

    factory LoginResponse.fromMap(Map<dynamic, dynamic> json) => LoginResponse(
        results: List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
    );
}

class Result {
    Result({
        required this.id,
        required this.user,
        required this.password,
    });

    String id;
    String user;
    String password;

    factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

    factory Result.fromMap(Map<dynamic, dynamic> json) => Result(
        id: json["ID"],
        user: json["USER"],
        password: json["PASSWORD"],
    );
}
 