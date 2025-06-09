import 'package:json_annotation/json_annotation.dart';
import 'address.dart';
part 'user_address.g.dart';

@JsonSerializable(explicitToJson: true)
class UserAddress {
  UserAddress(this.name, this.address);
  String name;
  Address address;

  factory UserAddress.fromJson(Map<String, dynamic> json) => _$UserAddressFromJson(json);
  Map<String, dynamic> toJson() => _$UserAddressToJson(this);
}
