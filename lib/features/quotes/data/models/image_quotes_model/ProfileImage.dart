/// small : "https://images.unsplash.com/profile-1706185252231-a150070d3c4b?ixlib=rb-4.0.3&crop=faces&fit=crop&w=32&h=32"
/// medium : "https://images.unsplash.com/profile-1706185252231-a150070d3c4b?ixlib=rb-4.0.3&crop=faces&fit=crop&w=64&h=64"
/// large : "https://images.unsplash.com/profile-1706185252231-a150070d3c4b?ixlib=rb-4.0.3&crop=faces&fit=crop&w=128&h=128"

class ProfileImage {
  ProfileImage({
    this.small,
    this.medium,
    this.large,
  });

  ProfileImage.fromJson(dynamic json) {
    small = json['small'];
    medium = json['medium'];
    large = json['large'];
  }
  String? small;
  String? medium;
  String? large;
  ProfileImage copyWith({
    String? small,
    String? medium,
    String? large,
  }) =>
      ProfileImage(
        small: small ?? this.small,
        medium: medium ?? this.medium,
        large: large ?? this.large,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['small'] = small;
    map['medium'] = medium;
    map['large'] = large;
    return map;
  }
}
