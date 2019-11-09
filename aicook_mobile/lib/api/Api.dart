import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

// import '../models/City.dart';
import '../models/Farm.dart';
import '../models/Recipe.dart';

class Api {
  static String url = "http://142.93.104.190:4248/api/";

  // Farm
  static Future<List<Farm>> getFarmsByLocalization(
      double lat, double lng, int page) async {
    final response =
        await http.get(url + 'farm?lat={lat}&lng={lng}&page={page}');

    if (response.statusCode == 200) {
      return (json.decode(response.body)['farms'] as List)
          .map((farm) => new Farm.fromJson(farm))
          .toList();
    } else {
      throw Exception('Failed to load farms');
    }
  }

  static Future<List<Farm>> getFarmsByName(String name, int page) async {
    final response =
        await http.get(url + 'farms/search?name={name}&page={page}');

    if (response.statusCode == 200) {
      return (json.decode(response.body)['farms'] as List)
          .map((farm) => new Farm.fromJson(farm))
          .toList();
    } else {
      throw Exception('Failed to load farms');
    }
  }

  // Recipes
  static Future<List<Recipe>> getRecipes(String name) async {
    final response = await http.get(url + 'recipes/search?name={name}');

    if (response.statusCode == 200) {
      return (json.decode(response.body)['recipes'] as List)
          .map((recipe) => new Recipe.fromJson(recipe))
          .toList();
    } else {
      throw Exception('Failed to load recipes');
    }
  }

  static Future<List<Recipe>> getRecipesByName(String name, int page) async {
    final response =
        await http.get(url + 'recipes/search?name={name}&page={page}');

    if (response.statusCode == 200) {
      return (json.decode(response.body)['recipes'] as List)
          .map((recipe) => new Recipe.fromJson(recipe))
          .toList();
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}
