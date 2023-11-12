import 'dart:developer';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/usermodel.dart';

class FetchDataProvider with ChangeNotifier {
  List<User> users = [];
  bool isLoading = false;

  getUsers() async {
    isLoading = true;
    users = await fetchUsers();
    isLoading = false;
    notifyListeners();
  }

  Future<List<User>> fetchUsers() async {
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        users = data.map((item) => User.fromJson(item)).toList();
        notifyListeners();

        return users;
      } else {
        throw Exception('Failed to load data!');
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
