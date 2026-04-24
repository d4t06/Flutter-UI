// To parse this JSON data, do
//
//     final productItem = productItemFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'product_item.freezed.dart';
part 'product_item.g.dart';

ProductItem productItemFromJson(String str) => ProductItem.fromJson(json.decode(str));

String productItemToJson(ProductItem data) => json.encode(data.toJson());

@freezed
abstract class ProductItem with _$ProductItem {
    const factory ProductItem({
        @JsonKey(name: "id")
        required int id,
        @JsonKey(name: "title")
        required String title,
        @JsonKey(name: "price")
        required double price,
        @JsonKey(name: "description")
        required String description,
        @JsonKey(name: "category")
        required String category,
        @JsonKey(name: "image")
        required String image,
        @JsonKey(name: "rating")
        required Rating rating,
    }) = _ProductItem;

    factory ProductItem.fromJson(Map<String, dynamic> json) => _$ProductItemFromJson(json);
}

@freezed
abstract class Rating with _$Rating {
    const factory Rating({
        @JsonKey(name: "rate")
        required double rate,
        @JsonKey(name: "count")
        required int count,
    }) = _Rating;

    factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
}
