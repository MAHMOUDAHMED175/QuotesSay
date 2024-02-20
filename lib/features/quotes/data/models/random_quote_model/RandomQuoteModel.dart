import 'package:equatable/equatable.dart';
import 'package:windowappflutter/features/quotes/domain/entities/random_quote.dart';

/// q : "Selfishness and greed, individual or national, cause most of our troubles."
/// a : "Harry S. Truman"
/// h : "<blockquote>&ldquo;Selfishness and greed, individual or national, cause most of our troubles.&rdquo; &mdash; <footer>Harry S. Truman</footer></blockquote>"

class RandomQuoteModel extends RandomQuoteEntity with EquatableMixin {
  RandomQuoteModel({
    this.q,
    this.a,
    this.h,
  }) : super(author: a!, quote: q!);

  factory RandomQuoteModel.fromJson(Map<String, dynamic> json) {
    return RandomQuoteModel(
      q: json['q'],
      a: json['a'],
      h: json['h'],
    );
  }
  String? q;
  String? a;
  String? h;
  RandomQuoteModel copyWith({
    String? q,
    String? a,
    String? h,
  }) =>
      RandomQuoteModel(
        q: q ?? this.q,
        a: a ?? this.a,
        h: h ?? this.h,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['q'] = q;
    map['a'] = a;
    map['h'] = h;
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        q,
        a,
        h,
      ];
}
