import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final Map<dynamic, dynamic> data;
  Home({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(data['avatar_url'] ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(data['name'] ?? 'No Name Provided'),
            Text(data['bio'] ?? 'No Bio Provided'),
            Text(data['public_repos'].toString()),
          ],
        ),
      ),
    );
  }
}
