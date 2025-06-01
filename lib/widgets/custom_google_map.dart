import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_app/utils/map_styles/map_styles.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late GoogleMapController controllerMap;

  @override
  void dispose() {
    controllerMap.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GoogleMap(
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
