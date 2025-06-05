import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel {
  final String name;
  final String id;
  final LatLng latLng;

  PlaceModel({required this.name, required this.id, required this.latLng});
}

List<PlaceModel> places = [
  PlaceModel(
      name: 'Orange Mall',
      id: '1',
      latLng: const LatLng(35.549508014886385, 35.76241935540856)),
  PlaceModel(
      name: 'Manara University',
      id: '2',
      latLng: const LatLng(35.552361854330805, 35.768137926108))
];
