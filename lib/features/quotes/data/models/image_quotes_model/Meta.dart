/// index : true

class Meta {
  Meta({
    this.index,
  });

  Meta.fromJson(dynamic json) {
    index = json['index'];
  }
  bool? index;
  Meta copyWith({
    bool? index,
  }) =>
      Meta(
        index: index ?? this.index,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['index'] = index;
    return map;
  }
}
