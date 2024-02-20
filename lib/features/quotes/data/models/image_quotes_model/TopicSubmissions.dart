import 'Minimalism.dart';

/// minimalism : {"status":"rejected"}

class TopicSubmissions {
  TopicSubmissions({
    this.minimalism,
  });

  TopicSubmissions.fromJson(dynamic json) {
    minimalism = json['minimalism'] != null
        ? Minimalism.fromJson(json['minimalism'])
        : null;
  }
  Minimalism? minimalism;
  TopicSubmissions copyWith({
    Minimalism? minimalism,
  }) =>
      TopicSubmissions(
        minimalism: minimalism ?? this.minimalism,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (minimalism != null) {
      map['minimalism'] = minimalism?.toJson();
    }
    return map;
  }
}
