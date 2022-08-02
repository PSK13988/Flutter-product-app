import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  final int id;

  final String name;

  final String category;

  final num mrp;

  final num discount;

  final num price;

  late int quantity;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.mrp,
    required this.discount,
    required this.price,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  List<Object?> get props => [name, category, mrp, discount, price, quantity];
}
