import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_api/tmdb_api.dart';

class MediaSearchController extends GetxController {
  SearchCategory _selectedCategory = SearchCategory.movies;


  SearchCategory get selectedCategory => _selectedCategory;

  void updateSelectedCategory(final SearchCategory category) {
    _selectedCategory = category;
    update();
  }
}

enum SearchCategory {
  movies,
  tvShows
}