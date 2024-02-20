/// instagram_username : "uranwang"
/// portfolio_url : null
/// twitter_username : null
/// paypal_email : null

class Social {
  Social({
    this.instagramUsername,
    this.portfolioUrl,
    this.twitterUsername,
    this.paypalEmail,
  });

  Social.fromJson(dynamic json) {
    instagramUsername = json['instagram_username'];
    portfolioUrl = json['portfolio_url'];
    twitterUsername = json['twitter_username'];
    paypalEmail = json['paypal_email'];
  }
  String? instagramUsername;
  dynamic portfolioUrl;
  dynamic twitterUsername;
  dynamic paypalEmail;
  Social copyWith({
    String? instagramUsername,
    dynamic portfolioUrl,
    dynamic twitterUsername,
    dynamic paypalEmail,
  }) =>
      Social(
        instagramUsername: instagramUsername ?? this.instagramUsername,
        portfolioUrl: portfolioUrl ?? this.portfolioUrl,
        twitterUsername: twitterUsername ?? this.twitterUsername,
        paypalEmail: paypalEmail ?? this.paypalEmail,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['instagram_username'] = instagramUsername;
    map['portfolio_url'] = portfolioUrl;
    map['twitter_username'] = twitterUsername;
    map['paypal_email'] = paypalEmail;
    return map;
  }
}
