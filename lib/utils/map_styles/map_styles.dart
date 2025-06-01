abstract class MapStyles {
  static String mapLightStyle = '''
[
  {
    "featureType": "all",
    "elementType": "labels.text.fill",
    "stylers": [
      { "color": "#0741ed" },
      { "visibility": "on" },
      { "saturation": 0 }
    ]
  },
  {
    "featureType": "all",
    "elementType": "labels.icon",
    "stylers": [
      { "visibility": "on" }
    ]
  }
]
''';
}
