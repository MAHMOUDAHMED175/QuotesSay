import 'package:equatable/equatable.dart';
import 'package:windowappflutter/features/quotes/data/models/image_quotes_model/Urls.dart';
import 'package:windowappflutter/features/quotes/domain/entities/imageEntity.dart';

import 'Exif.dart';
import 'Links.dart';
import 'Location.dart';
import 'Meta.dart';
import 'Tags.dart';
import 'TagsPreview.dart';
import 'TopicSubmissions.dart';
import 'User.dart';

class ImageQuotesModel extends ImageEntity with EquatableMixin {
  ImageQuotesModel({
    this.id,
    this.slug,
    this.createdAt,
    this.updatedAt,
    this.promotedAt,
    this.width,
    this.height,
    this.color,
    this.blurHash,
    this.description,
    this.altDescription,
    this.breadcrumbs,
    required this.urls,
    this.links,
    this.likes,
    this.likedByUser,
    this.currentUserCollections,
    this.sponsorship,
    this.topicSubmissions,
    this.user,
    this.exif,
    this.location,
    this.meta,
    this.publicDomain,
    this.tags,
    this.tagsPreview,
    this.views,
    this.downloads,
    this.topics,
  }) : super(image: urls!.full!);

  factory ImageQuotesModel.fromJson(Map<String, dynamic> json) {
    return ImageQuotesModel(
      urls: json['urls'] != null ? Urls.fromJson(json['urls']) : null,
      id: json['id'],
      downloads: json['downloads'],
    );

    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    // promotedAt = json['promoted_at'];
    // width = json['width'];
    // height = json['height'];
    // color = json['color'];
    // blurHash = json['blur_hash'];
    // description = json['description'];
    // altDescription = json['alt_description'];

    // links = json['links'] != null ? Links.fromJson(json['links']) : null;
    // likes = json['likes'];
    // likedByUser = json['liked_by_user'];
    // sponsorship = json['sponsorship'];
    // topicSubmissions = json['topic_submissions'] != null
    //     ? TopicSubmissions.fromJson(json['topic_submissions'])
    //     : null;
    // user = json['user'] != null ? User.fromJson(json['user']) : null;
    // exif = json['exif'] != null ? Exif.fromJson(json['exif']) : null;
    // location =
    //     json['location'] != null ? Location.fromJson(json['location']) : null;
    // meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    // publicDomain = json['public_domain'];
    // if (json['tags'] != null) {
    //   tags = [];
    //   json['tags'].forEach((v) {
    //     tags?.add(Tags.fromJson(v));
    //   });
    // }
    // if (json['tags_preview'] != null) {
    //   tagsPreview = [];
    //   json['tags_preview'].forEach((v) {
    //     tagsPreview?.add(TagsPreview.fromJson(v));
    //   });
    // }
    // views = json['views'];
  }

  String? id;
  String? slug;
  String? createdAt;
  String? updatedAt;
  String? promotedAt;
  int? width;
  int? height;
  String? color;
  String? blurHash;
  String? description;
  String? altDescription;
  List<dynamic>? breadcrumbs;
  Urls? urls;
  Links? links;
  int? likes;
  bool? likedByUser;
  List<dynamic>? currentUserCollections;
  dynamic sponsorship;
  TopicSubmissions? topicSubmissions;
  User? user;
  Exif? exif;
  Location? location;
  Meta? meta;
  bool? publicDomain;
  List<Tags>? tags;
  List<TagsPreview>? tagsPreview;
  int? views;
  int? downloads;
  List<dynamic>? topics;

  ImageQuotesModel copyWith({
    String? id,
    String? slug,
    String? createdAt,
    String? updatedAt,
    String? promotedAt,
    int? width,
    int? height,
    String? color,
    String? blurHash,
    String? description,
    String? altDescription,
    List<dynamic>? breadcrumbs,
    Urls? urls,
    Links? links,
    int? likes,
    bool? likedByUser,
    List<dynamic>? currentUserCollections,
    dynamic sponsorship,
    TopicSubmissions? topicSubmissions,
    User? user,
    Exif? exif,
    Location? location,
    Meta? meta,
    bool? publicDomain,
    List<Tags>? tags,
    List<TagsPreview>? tagsPreview,
    int? views,
    int? downloads,
    List<dynamic>? topics,
  }) =>
      ImageQuotesModel(
        id: id ?? this.id,
        slug: slug ?? this.slug,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        promotedAt: promotedAt ?? this.promotedAt,
        width: width ?? this.width,
        height: height ?? this.height,
        color: color ?? this.color,
        blurHash: blurHash ?? this.blurHash,
        description: description ?? this.description,
        altDescription: altDescription ?? this.altDescription,
        breadcrumbs: breadcrumbs ?? this.breadcrumbs,
        urls: urls ?? this.urls,
        links: links ?? this.links,
        likes: likes ?? this.likes,
        likedByUser: likedByUser ?? this.likedByUser,
        currentUserCollections:
            currentUserCollections ?? this.currentUserCollections,
        sponsorship: sponsorship ?? this.sponsorship,
        topicSubmissions: topicSubmissions ?? this.topicSubmissions,
        user: user ?? this.user,
        exif: exif ?? this.exif,
        location: location ?? this.location,
        meta: meta ?? this.meta,
        publicDomain: publicDomain ?? this.publicDomain,
        tags: tags ?? this.tags,
        tagsPreview: tagsPreview ?? this.tagsPreview,
        views: views ?? this.views,
        downloads: downloads ?? this.downloads,
        topics: topics ?? this.topics,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['slug'] = slug;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['promoted_at'] = promotedAt;
    map['width'] = width;
    map['height'] = height;
    map['color'] = color;
    map['blur_hash'] = blurHash;
    map['description'] = description;
    map['alt_description'] = altDescription;
    if (breadcrumbs != null) {
      map['breadcrumbs'] = breadcrumbs?.map((v) => v.toJson()).toList();
    }
    if (urls != null) {
      map['urls'] = urls?.toJson();
    }
    if (links != null) {
      map['links'] = links?.toJson();
    }
    map['likes'] = likes;
    map['liked_by_user'] = likedByUser;
    if (currentUserCollections != null) {
      map['current_user_collections'] =
          currentUserCollections?.map((v) => v.toJson()).toList();
    }
    map['sponsorship'] = sponsorship;
    if (topicSubmissions != null) {
      map['topic_submissions'] = topicSubmissions?.toJson();
    }
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (exif != null) {
      map['exif'] = exif?.toJson();
    }
    if (location != null) {
      map['location'] = location?.toJson();
    }
    if (meta != null) {
      map['meta'] = meta?.toJson();
    }
    map['public_domain'] = publicDomain;
    if (tags != null) {
      map['tags'] = tags?.map((v) => v.toJson()).toList();
    }
    if (tagsPreview != null) {
      map['tags_preview'] = tagsPreview?.map((v) => v.toJson()).toList();
    }
    map['views'] = views;
    map['downloads'] = downloads;
    if (topics != null) {
      map['topics'] = topics?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  List<Object?> get props => [
        id,
        slug,
        createdAt,
        updatedAt,
        promotedAt,
        width,
        height,
        color,
        blurHash,
        description,
        altDescription,
        breadcrumbs,
        urls,
        links,
        likes,
        likedByUser,
        currentUserCollections,
        sponsorship,
        topicSubmissions,
        user,
        exif,
        location,
        meta,
        publicDomain,
        tags,
        tagsPreview,
        views,
        downloads,
        topics,
      ];
}
