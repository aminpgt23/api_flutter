import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String api = "127.0.0.1:8082";

Future<http.Response> getUser() async {
  var result = await http.get(Uri.parse("http://${api}/api/user/getAll"));
  print(result.body);
  return result;
}

Future<http.Response> deleteUser(int id) async {
  var result =
      await http.delete(Uri.parse("http://${api}/api/user/delete/${id}"));
  print(result.body);
  return result;
}

Future<http.Response> insertUser(Map<String, String> data) async {
  var result = await http.post(Uri.parse("http://${api}/api/user/insert"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data));
  print(result.body);
  print(result.request);
  return result;
}

Future<http.Response> updateUser(int id, Map<String, String> data) async {
  var result = await http.put(Uri.parse("http://${api}/api/user/update/${id}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data));
  print(result.body);
  return result;
}
