/// type : "search"
/// title : "building"

class TagsPreview {
  TagsPreview({
    this.type,
    this.title,
  });

  TagsPreview.fromJson(dynamic json) {
    type = json['type'];
    title = json['title'];
  }
  String? type;
  String? title;
  TagsPreview copyWith({
    String? type,
    String? title,
  }) =>
      TagsPreview(
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
