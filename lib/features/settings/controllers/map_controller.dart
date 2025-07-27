import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends ChangeNotifier {
  LatLng? _selectedLocation;
  double _zoomLevel = 16.0;
  final Completer<GoogleMapController> _mapController = Completer();

  LatLng? get selectedLocation => _selectedLocation;

  double get zoomLevel => _zoomLevel;

  GoogleMapController? get googleMapController {
    if (_mapController.isCompleted) {
      return _mapController.future as GoogleMapController?;
    }
    return null;
  }

  MapController({LatLng? initialLocation}) {
    _selectedLocation = initialLocation;
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('خدمات الموقع معطلة. يرجى تفعيلها');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('تم رفض أذونات الموقع');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('تم رفض أذونات الموقع بشكل دائم');
    }

    Position position = await Geolocator.getCurrentPosition();
    _selectedLocation = LatLng(position.latitude, position.longitude);
    notifyListeners();
    _moveToLocation(_selectedLocation!);
  }

  void pinCurrentLocation() {
    notifyListeners();
  }

  void zoomIn() async {
    if (await _mapController.future != null) {
      final controller = await _mapController.future;
      controller.animateCamera(CameraUpdate.zoomIn());
      _zoomLevel += 1;
      notifyListeners();
    }
  }

  void zoomOut() async {
    if (await _mapController.future != null) {
      final controller = await _mapController.future;
      controller.animateCamera(CameraUpdate.zoomOut());
      _zoomLevel -= 1;
      notifyListeners();
    }
  }

  void setSelectedLocation(LatLng location) {
    _selectedLocation = location;
    notifyListeners();
  }

  void _moveToLocation(LatLng location) async {
    if (await _mapController.future != null) {
      final controller = await _mapController.future;
      controller.animateCamera(
        CameraUpdate.newLatLngZoom(location, _zoomLevel),
      );
    }
  }

  void onMapCreated(GoogleMapController controller) {
    _mapController.complete(controller);
    if (_selectedLocation != null) {
      _moveToLocation(_selectedLocation!);
    }
  }

  @override
  void dispose() {
    _mapController.future.then((controller) => controller.dispose());
    super.dispose();
  }
}