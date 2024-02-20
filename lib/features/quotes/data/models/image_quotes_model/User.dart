import 'Links.dart';
import 'ProfileImage.dart';
import 'Social.dart';

/// id : "k4_7Jz4-104"
/// updated_at : "2024-02-10T07:02:01Z"
/// username : "uranwang"
/// name : "Uran Wang"
/// first_name : "Uran"
/// last_name : "Wang"
/// twitter_username : null
/// portfolio_url : null
/// bio : "Designer and photographer. Founder and Creative Director of rdateam.com"
/// location : "Shanghai / Auckland"
/// links : {"self":"https://api.unsplash.com/users/uranwang","html":"https://unsplash.com/@uranwang","photos":"https://api.unsplash.com/users/uranwang/photos","likes":"https://api.unsplash.com/users/uranwang/likes","portfolio":"https://api.unsplash.com/users/uranwang/portfolio","following":"https://api.unsplash.com/users/uranwang/following","followers":"https://api.unsplash.com/users/uranwang/followers"}
/// profile_image : {"small":"https://images.unsplash.com/profile-1706185252231-a150070d3c4b?ixlib=rb-4.0.3&crop=faces&fit=crop&w=32&h=32","medium":"https://images.unsplash.com/profile-1706185252231-a150070d3c4b?ixlib=rb-4.0.3&crop=faces&fit=crop&w=64&h=64","large":"https://images.unsplash.com/profile-1706185252231-a150070d3c4b?ixlib=rb-4.0.3&crop=faces&fit=crop&w=128&h=128"}
/// instagram_username : "uranwang"
/// total_collections : 2
/// total_likes : 4
/// total_photos : 198
/// total_promoted_photos : 34
/// accepted_tos : true
/// for_hire : false
/// social : {"instagram_username":"uranwang","portfolio_url":null,"twitter_username":null,"paypal_email":null}

class User {
  User({
    this.id,
    this.updatedAt,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    this.bio,
    this.location,
    this.links,
    this.profileImage,
    this.instagramUsername,
    this.totalCollections,
    this.totalLikes,
    this.totalPhotos,
    this.totalPromotedPhotos,
    this.acceptedTos,
    this.forHire,
    this.social,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    updatedAt = json['updated_at'];
    username = json['username'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    twitterUsername = json['twitter_username'];
    portfolioUrl = json['portfolio_url'];
    bio = json['bio'];
    location = json['location'];
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    profileImage = json['profile_image'] != null
        ? ProfileImage.fromJson(json['profile_image'])
        : null;
    instagramUsername = json['instagram_username'];
    totalCollections = json['total_collections'];
    totalLikes = json['total_likes'];
    totalPhotos = json['total_photos'];
    totalPromotedPhotos = json['total_promoted_photos'];
    acceptedTos = json['accepted_tos'];
    forHire = json['for_hire'];
    social = json['social'] != null ? Social.fromJson(json['social']) : null;
  }
  String? id;
  String? updatedAt;
  String? username;
  String? name;
  String? firstName;
  String? lastName;
  dynamic twitterUsername;
  dynamic portfolioUrl;
  String? bio;
  String? location;
  Links? links;
  ProfileImage? profileImage;
  String? instagramUsername;
  int? totalCollections;
  int? totalLikes;
  int? totalPhotos;
  int? totalPromotedPhotos;
  bool? acceptedTos;
  bool? forHire;
  Social? social;
  User copyWith({
    String? id,
    String? updatedAt,
    String? username,
    String? name,
    String? firstName,
    String? lastName,
    dynamic twitterUsername,
    dynamic portfolioUrl,
    String? bio,
    String? location,
    Links? links,
    ProfileImage? profileImage,
    String? instagramUsername,
    int? totalCollections,
    int? totalLikes,
    int? totalPhotos,
    int? totalPromotedPhotos,
    bool? acceptedTos,
    bool? forHire,
    Social? social,
  }) =>
      User(
        id: id ?? this.id,
        updatedAt: updatedAt ?? this.updatedAt,
        username: username ?? this.username,
        name: name ?? this.name,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        twitterUsername: twitterUsername ?? this.twitterUsername,
        portfolioUrl: portfolioUrl ?? this.portfolioUrl,
        bio: bio ?? this.bio,
        location: location ?? this.location,
        links: links ?? this.links,
        profileImage: profileImage ?? this.profileImage,
        instagramUsername: instagramUsername ?? this.instagramUsername,
        totalCollections: totalCollections ?? this.totalCollections,
        totalLikes: totalLikes ?? this.totalLikes,
        totalPhotos: totalPhotos ?? this.totalPhotos,
        totalPromotedPhotos: totalPromotedPhotos ?? this.totalPromotedPhotos,
        acceptedTos: acceptedTos ?? this.acceptedTos,
        forHire: forHire ?? this.forHire,
        social: social ?? this.social,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['updated_at'] = updatedAt;
    map['username'] = username;
    map['name'] = name;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['twitter_username'] = twitterUsername;
    map['portfolio_url'] = portfolioUrl;
    map['bio'] = bio;
    map['location'] = location;
    if (links != null) {
      map['links'] = links?.toJson();
    }
    if (profileImage != null) {
      map['profile_image'] = profileImage?.toJson();
    }
    map['instagram_username'] = instagramUsername;
    map['total_collections'] = totalCollections;
    map['total_likes'] = totalLikes;
    map['total_photos'] = totalPhotos;
    map['total_promoted_photos'] = totalPromotedPhotos;
    map['accepted_tos'] = acceptedTos;
    map['for_hire'] = forHire;
    if (social != null) {
      map['social'] = social?.toJson();
    }
    return map;
  }
}
