import 'package:windowappflutter/features/quotes/domain/entities/today_quote.dart';

class TodayQuoteModel extends TodayQuoteEntity {
  TodayQuoteModel({
    this.q,
    this.a,
    this.h,
  }) : super(author: a!, quote: q!);

  factory TodayQuoteModel.fromJson(dynamic json) {
    return TodayQuoteModel(
      q: json['q'],
      a: json['a'],
      h: json['h'],
    );
  }
  String? q;
  String? a;
  String? h;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['q'] = q;
    map['a'] = a;
    map['h'] = h;
    return map;
  }
}
