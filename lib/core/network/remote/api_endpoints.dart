import 'package:windowappflutter/core/utils/constants_manager.dart';

class ApiEndPoints {
  static const String domainLink = "https://zenquotes.io/api/";
  static const String quotesEndPoint = "${domainLink}quotes";
  static const String todayEndPoint = "${domainLink}today";
  static const String randomEndPoint = "${domainLink}random";

  static const String imageQuoteEndpoint =
      "https://api.unsplash.com/photos/random?client_id=${AppConstants.accessKey}";
}
