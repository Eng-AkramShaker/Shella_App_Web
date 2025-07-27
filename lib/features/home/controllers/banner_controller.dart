import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shella_design/features/home/domain/models/banner_model.dart';

class BannerProvider extends ChangeNotifier {
  List<BannerModel> _banners = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<BannerModel> get banners => _banners;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchBanners() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners(); // Notify listeners that loading has started

    try {
      final String url = 'https://shellafood.com/api/v1/banners';
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'zoneId': '[2]',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final List<dynamic> bannersJson = responseData['banners'];

        _banners = bannersJson
            .map((json) => BannerModel.fromJson(json))
            // --- Crucial Filtering Step ---
            .where((banner) =>
                banner.imageUrlFull != null && banner.imageUrlFull!.isNotEmpty)
            // ------------------------------
            .toList();
      } else {
        _errorMessage =
            'Failed to load banners. Status code: ${response.statusCode}';
        print('--- API Error Response ---');
        print('Error Status Code: ${response.statusCode}');
        print('Error Response Body: ${response.body}');
        print('--------------------------');
      }
    } catch (e) {
      _errorMessage = 'An unexpected error occurred: $e';
      print('--- Fetch/Parsing Error ---');
      print('Error Details: $e');
      print('---------------------------');
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners that loading has finished
    }
  }
}
