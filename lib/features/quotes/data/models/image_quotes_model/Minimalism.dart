/// status : "rejected"

class Minimalism {
  Minimalism({
    this.status,
  });

  Minimalism.fromJson(dynamic json) {
    status = json['status'];
  }
  String? status;
  Minimalism copyWith({
    String? status,
  }) =>
      Minimalism(
        status: status ?? this.status,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    return map;
  }
}
