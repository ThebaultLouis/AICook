class City {
  final String id;
  final String name;
  final String dep;
  final double lat;
  final double lng;

  City({this.id, this.name, this.dep, this.lat, this.lng});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
        id: json['_id'],
        name: json['name'],
        dep: json['dep'],
        lat: json['lat'].toDouble(),
        lng: json['long'].toDouble());
  }
}
