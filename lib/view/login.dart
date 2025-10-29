import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:live_test/view/home.dart';

class Login extends StatelessWidget {
  TextEditingController userNameController = TextEditingController();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: userNameController,
            decoration: InputDecoration(hintText: 'Username'),
            // on: (value) => validateUsername(value, context),
          ),
          ElevatedButton(
            onPressed: () => validateUsername(userNameController.text, context),
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}

validateUsername(String username, BuildContext context) async {
  if (username.isNotEmpty) {
    final Map<String, dynamic> data = await get(username) ?? {};
    if (data.containsKey('name')) {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => Home(data: data)));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('User not found')));
    }
  }
}

Future<Map<String, dynamic>>? get(String user) async {
  final uri = Uri.parse('https://api.github.com/users/$user');
  var response = await http.get(uri);

  var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
  if (jsonResponse.containsKey('name')) {
    print(jsonResponse);
    return jsonResponse;
  } else {
    return {};
  }

  // return jsonResponse;

  // return
  // print('Request failed with status: ${response.statusCode}.');
}
