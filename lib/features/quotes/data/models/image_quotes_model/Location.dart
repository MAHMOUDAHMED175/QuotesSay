import 'Position.dart';

/// name : null
/// city : null
/// country : null
/// position : {"latitude":0.0,"longitude":0.0}

class Location {
  Location({
    this.name,
    this.city,
    this.country,
    this.position,
  });

  Location.fromJson(dynamic json) {
    name = json['name'];
    city = json['city'];
    country = json['country'];
    position =
        json['position'] != null ? Position.fromJson(json['position']) : null;
  }
  dynamic name;
  dynamic city;
  dynamic country;
  Position? position;
  Location copyWith({
    dynamic name,
    dynamic city,
    dynamic country,
    Position? position,
  }) =>
      Location(
        name: name ?? this.name,
        city: city ?? this.city,
        country: country ?? this.country,
        position: position ?? this.position,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['city'] = city;
    map['country'] = country;
    if (position != null) {
      map['position'] = position?.toJson();
    }
    return map;
  }
}
