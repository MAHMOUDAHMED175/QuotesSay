/// make : "Leica Camera AG"
/// model : "LEICA M11"
/// name : "Leica Camera AG, LEICA M11"
/// exposure_time : "1/180"
/// aperture : "9.5"
/// focal_length : "35.0"
/// iso : 80

class Exif {
  Exif({
    this.make,
    this.model,
    this.name,
    this.exposureTime,
    this.aperture,
    this.focalLength,
    this.iso,
  });

  Exif.fromJson(dynamic json) {
    make = json['make'];
    model = json['model'];
    name = json['name'];
    exposureTime = json['exposure_time'];
    aperture = json['aperture'];
    focalLength = json['focal_length'];
    iso = json['iso'];
  }
  String? make;
  String? model;
  String? name;
  String? exposureTime;
  String? aperture;
  String? focalLength;
  int? iso;
  Exif copyWith({
    String? make,
    String? model,
    String? name,
    String? exposureTime,
    String? aperture,
    String? focalLength,
    int? iso,
  }) =>
      Exif(
        make: make ?? this.make,
        model: model ?? this.model,
        name: name ?? this.name,
        exposureTime: exposureTime ?? this.exposureTime,
        aperture: aperture ?? this.aperture,
        focalLength: focalLength ?? this.focalLength,
        iso: iso ?? this.iso,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['make'] = make;
    map['model'] = model;
    map['name'] = name;
    map['exposure_time'] = exposureTime;
    map['aperture'] = aperture;
    map['focal_length'] = focalLength;
    map['iso'] = iso;
    return map;
  }
}
