/// latitude : 0.0
/// longitude : 0.0

class Position {
  Position({
    this.latitude,
    this.longitude,
  });

  Position.fromJson(dynamic json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
  double? latitude;
  double? longitude;
  Position copyWith({
    double? latitude,
    double? longitude,
  }) =>
      Position(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    return map;
  }
}
