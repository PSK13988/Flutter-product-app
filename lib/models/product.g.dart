// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int,
      name: json['name'] as String,
      category: json['category'] as String,
      mrp: json['mrp'] as num,
      discount: json['discount'] as num,
      price: json['price'] as num,
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'mrp': instance.mrp,
      'discount': instance.discount,
      'price': instance.price,
      'quantity': instance.quantity,
    };
