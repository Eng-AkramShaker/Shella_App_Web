import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/item_search_model.dart'; // Adjust the path

class ItemSearchProvider extends ChangeNotifier {
  List<ItemModel> _items = [];
  bool _isLoading = false;
  String? _errorMessage;
  String _currentSearchQuery = '';

  // Placeholder for host_url. Replace with your actual base URL.
  final String _baseUrl = 'https://shalafood.com';

  List<ItemModel> get items => _items;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String get currentSearchQuery => _currentSearchQuery;

  // Method to update the search query
  void setSearchQuery(String query) {
    _currentSearchQuery = query;
    notifyListeners(); // Notify listeners to potentially update UI based on query
  }

  Future<void> searchItems({
    required String name,
    int storeId = 2, // Default value as per your request
    int categoryId = 1, // Default value as per your request
    int limit = 3, // Default value as per your request
    int offset = 1, // Default value as per your request
  }) async {
    if (name.trim().isEmpty) {
      _items = []; // Clear items if search query is empty
      _isLoading = false;
      _errorMessage = null;
      notifyListeners();
      return;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners(); // Notify listeners that loading has started

    try {
      final String url =
          '$_baseUrl/api/v1/items/item-or-store-search?name=$name';
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          // Headers specified in your request. Note: these look like query parameters.
          // If they need to be in headers, this is correct. Otherwise, they might go into URI.
          'store_id': storeId.toString(),
          'category_id': categoryId.toString(),
          'limit': limit.toString(),
          'offset': offset.toString(),
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        _items = ItemSearchResponse.fromJson(responseData).items;
        // Filter out items without a full image URL if necessary, similar to banners
        _items = _items
            .where((item) =>
                item.imageUrlFull != null && item.imageUrlFull!.isNotEmpty)
            .toList();
      } else {
        _errorMessage =
            'Failed to search items. Status code: ${response.statusCode}';
        print('--- API Error Response ---');
        print('Search Error Status Code: ${response.statusCode}');
        print('Search Error Response Body: ${response.body}');
        print('--------------------------');
      }
    } catch (e) {
      _errorMessage = 'An error occurred during search: $e';
      print('--- Search Fetch Error ---');
      print('Search Error Details: $e');
      print('--------------------------');
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners that loading has finished
    }
  }
}
