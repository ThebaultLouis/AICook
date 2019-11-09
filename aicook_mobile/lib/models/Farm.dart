class Farm {
  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final double lat;
  final double lng;

  Farm(
      {this.id,
      this.name,
      this.description,
      this.city,
      this.address,
      this.lat,
      this.lng});

  factory Farm.fromJson(Map<String, dynamic> json) {
    return Farm(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      city: json['city'],
      address: json['address'],
      lat: json['lat'].toDouble(),
      lng: json['lng'].toDouble(),
    );
  }
}
