/// type : "search"
/// title : "building"

class Tags {
  Tags({
    this.type,
    this.title,
  });

  Tags.fromJson(dynamic json) {
    type = json['type'];
    title = json['title'];
  }
  String? type;
  String? title;
  Tags copyWith({
    String? type,
    String? title,
  }) =>
      Tags(
        type: type ?? this.type,
        title: title ?? this.title,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['title'] = title;
    return map;
  }
}
