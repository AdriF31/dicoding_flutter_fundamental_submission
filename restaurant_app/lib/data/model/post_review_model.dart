// To parse this JSON data, do
//
//     final postReviewModel = postReviewModelFromJson(jsonString);

import 'dart:convert';

PostReviewModel postReviewModelFromJson(String str) => PostReviewModel.fromJson(json.decode(str));

String postReviewModelToJson(PostReviewModel data) => json.encode(data.toJson());

class PostReviewModel {
  bool? error;
  String? message;
  List<CustomerReview>? customerReviews;

  PostReviewModel({
    this.error,
    this.message,
    this.customerReviews,
  });

  factory PostReviewModel.fromJson(Map<String, dynamic> json) => PostReviewModel(
    error: json["error"],
    message: json["message"],
    customerReviews: json["customerReviews"] == null ? [] : List<CustomerReview>.from(json["customerReviews"]!.map((x) => CustomerReview.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "customerReviews": customerReviews == null ? [] : List<dynamic>.from(customerReviews!.map((x) => x.toJson())),
  };
}

class CustomerReview {
  String? name;
  String? review;
  String? date;

  CustomerReview({
    this.name,
    this.review,
    this.date,
  });

  factory CustomerReview.fromJson(Map<String, dynamic> json) => CustomerReview(
    name: json["name"],
    review: json["review"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "review": review,
    "date": date,
  };
}
