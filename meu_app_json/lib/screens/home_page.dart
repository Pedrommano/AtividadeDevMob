import 'package:flutter/material.dart';
import '../models/user_address.dart';
import '../models/address.dart';
import 'dart:convert';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userMap = {
      "name": "João",
      "address": {
        "street": "Rua das Flores",
        "city": "São Paulo"
      }
    };

    final userJson = jsonEncode(userMap);
    final userDecoded = jsonDecode(userJson);
    final user = UserAddress.fromJson(userDecoded);

    return Scaffold(
      appBar: AppBar(title: const Text("User Address")),
      body: Center(
        child: Text('${user.name} mora em ${user.address.street}, ${user.address.city}'),
      ),
    );
  }
}
