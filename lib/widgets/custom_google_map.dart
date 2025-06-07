import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_app/models/place_model.dart';
import 'package:map_app/utils/map_styles/map_styles.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late GoogleMapController controllerMap;
  @override
  void initState() {
    initMarkers();
    initPolyines();
    initPolygons();
    initCircles();
    super.initState();
  }

  @override
  void dispose() {
    controllerMap.dispose();
    super.dispose();
  }

  initMarkers() async {
    var customMarkerIcon = await BitmapDescriptor.asset(
        const ImageConfiguration(), 'assest/images/location_icon.png');
    var markerPlaces = places
        .map(
          (placeModel) => Marker(
              icon: customMarkerIcon,
              infoWindow: InfoWindow(title: placeModel.name),
              markerId: MarkerId(placeModel.id),
              position: placeModel.latLng),
        )
        .toSet();
    markers.addAll(markerPlaces);
    setState(() {});
  }

  void initPolyines() {
    Polyline polyline1 = const Polyline(
        polylineId: PolylineId('1'),
        color: Colors.amber,
        width: 3,
        zIndex: 2,
        endCap: Cap.roundCap,
        startCap: Cap.roundCap,
        patterns: [
          PatternItem.dot
        ],
        points: [
          LatLng(35.797051237681686, 35.855634675913436),
          LatLng(35.68800738462491, 36.14234464053335),
          LatLng(35.60080126465717, 36.03447051937835),
        ]);
    Polyline polyline2 = const Polyline(
        polylineId: PolylineId('1'),
        color: Colors.green,
        zIndex: 1,
        width: 3,
        endCap: Cap.roundCap,
        startCap: Cap.roundCap,
        patterns: [
          PatternItem.dot
        ],
        points: [
          LatLng(35.67040134381008, 35.90810643727991),
          LatLng(35.92515457568684, 35.97862641212384),
        ]);
    polylines.add(polyline1);
    polylines.add(polyline2);
  }

  void initPolygons() {
    Polygon polygon = Polygon(
      polygonId: const PolygonId('1'),
      holes: const [
        [
          LatLng(35.34123506760006, 36.08787527223856),
          LatLng(35.34714090917797, 36.08627406666285),
          LatLng(35.34733524771533, 36.07281243367429)
        ]
      ],
      fillColor: Colors.red.withOpacity(.5),
      strokeColor: Colors.red,
      strokeWidth: 3,
      points: const [
        LatLng(35.397608246647025, 36.079574464452115),
        LatLng(35.33785076813531, 36.00561468238587),
        LatLng(35.31736812654332, 36.123000391536884),
      ],
    );
    polygons.add(polygon);
  }

  void initCircles() {
    Circle circle = Circle(
        circleId: const CircleId('1'),
        center: const LatLng(35.36084575282103, 35.92373261140384),
        radius: 3000,
        fillColor: Colors.cyanAccent.withOpacity(.5),
        strokeColor: Colors.cyanAccent);
    circles.add(circle);
  }

  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  Set<Polygon> polygons = {};

  Set<Circle> circles = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GoogleMap(
            zoomControlsEnabled: false,
            markers: markers,
            polylines: polylines,
            polygons: polygons,
            circles: circles,
            style: MapStyles.mapLightStyle,
            onMapCreated: (controller) {
              controllerMap = controller;
            },
            initialCameraPosition: const CameraPosition(
              zoom: 10,
              target: LatLng(35.57291505236658, 35.97656937765481),
            ),
          ),
          SizedBox(
            height: 50,
            width: 250,
            child: ElevatedButton(
              onPressed: () {
                controllerMap.animateCamera(CameraUpdate.newLatLng(
                  const LatLng(33.51517710518676, 36.28563778621559),
                ));
              },
              child: const Center(child: Text('another location')),
            ),
          ),
        ],
      ),
    );
  }
}
