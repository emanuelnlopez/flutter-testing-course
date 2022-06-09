import 'dart:convert';
import 'package:http/http.dart' as http;

String fetchBooksURL =
    'https://raw.githubusercontent.com/Richa0305/mock-json/main/book.json';

Future<List<BooksListModel>> fetchBooks(http.Client client) async {
  final response = await client.get(Uri.parse(fetchBooksURL)); // Call API

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return List<BooksListModel>.from(
        json.decode(response.body).map((x) => BooksListModel.fromJson(x)));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class BooksListModel {
  BooksListModel({
    this.amazon,
    required this.auther,
    this.decription,
    required this.name,
  });

  String? amazon;
  String auther;
  String? decription;
  String name;

  factory BooksListModel.fromJson(Map<String, dynamic> json) => BooksListModel(
        amazon: json["amazon"],
        auther: json["auther"],
        decription: json["decription"],
        name: json["name"],
      );
}
