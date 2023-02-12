import 'dart:convert';
import 'package:apischapter10/models/thirdexpModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Third_Example extends StatefulWidget {
  const Third_Example({super.key});

  @override
  State<Third_Example> createState() => _Third_ExampleState();
}

class _Third_ExampleState extends State<Third_Example> {
  Future<ThirdExample> getProductsApi() async {
    final response = await http.get(Uri.parse(
        'https://webhook.site/d24f9761-dfbRa-4759-bcda-f42f3dd539b7'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ThirdExample.fromJson(data);
    } else {
      return ThirdExample.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<ThirdExample>(
              future: getProductsApi(),
              builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(index.toString()),
                        ],
                      );
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}
