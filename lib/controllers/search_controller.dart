import 'dart:convert';
import 'dart:developer';

import 'package:desktivo/models/movies_model.dart';
import 'package:desktivo/services/api/api_client.dart';
import 'package:desktivo/services/global.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchPageController extends GetxController {
  final TextEditingController searchTextController = TextEditingController();
  List searchResults = [].obs;
  var searchResultsData = [].obs;
  var finalSearchData = [].obs;
  var loading = false.obs;
  var data = [];
  var selectedHorizontalSlider = 0.obs;

  Future<void> performSearch(String query) async {
    try {
      clearData();
      loading.value = true;
      final Dio.Response response =
          await Global.apiClient.getData('s=${query.trim()}&page=1');

      if (response.statusCode == 200) {
        data = response.data['Search'];
        searchResults = response.data['Search'];
        for (var search in searchResults) {
          await getSingleMovieData(search["imdbID"]);
        }
        finalSearchData = searchResultsData;
      } else {
        log('Search failed: ${response.statusCode}');
        clearData();
      }
      loading.value = false;
    } catch (e) {
      clearData();
      loading.value = false;
      log('Error: $e');
    }
  }

  void clearData() {
    finalSearchData.clear();
    searchResults.clear();
    searchResultsData.clear();
  }

  Future<void> getSingleMovieData(imdbId) async {
    try {
      final Dio.Response response = await Global.apiClient.getData('i=$imdbId');

      if (response.statusCode == 200) {
        searchResultsData.add(response.data);
      } else {
        log('Search failed: ${response.statusCode}');
      }
    } catch (e) {
      log('Error: $e');
    }
  }
}
