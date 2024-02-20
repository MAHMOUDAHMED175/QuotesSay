import 'package:equatable/equatable.dart';
import 'package:windowappflutter/features/quotes/domain/entities/quotes_entity.dart';

/// q : "Life and the simple beauty of it is too good to pass up."
/// a : "Christopher McCandless"
/// c : "56"
/// h : "<blockquote>&ldquo;Life and the simple beauty of it is too good to pass up.&rdquo; &mdash; <footer>Christopher McCandless</footer></blockquote>"

class QuotesModel extends QuotesEntity with EquatableMixin {
  QuotesModel({
    this.q,
    this.a,
    this.c,
    this.h,
  }) : super(
          quote: q!,
          author: a!,
        );

  factory QuotesModel.fromJson(Map<String, dynamic> json) {
    return QuotesModel(
      q: json['q'],
      a: json['a'],
      c: json['c'],
      h: json['h'],
    );
  }

  String? q;
  String? a;
  String? c;
  String? h;

  QuotesModel copyWith({
    String? q,
    String? a,
    String? c,
    String? h,
  }) =>
      QuotesModel(
        q: q ?? this.q,
        a: a ?? this.a,
        c: c ?? this.c,
        h: h ?? this.h,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['q'] = q;
    map['a'] = a;
    map['c'] = c;
    map['h'] = h;
    return map;
  }

  @override
  List<Object?> get props => [
        q,
        a,
        c,
        h,
      ];
}
