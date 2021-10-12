import 'package:json_annotation/json_annotation.dart';
part 'address.g.dart';

@JsonSerializable()
class Address{
  String city;
  String street;
  String house;
  int flat;

  Address({
    required this.city,
    required this.street,
    required this.house,
    required this.flat,
  });

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}