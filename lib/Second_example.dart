import 'dart:convert';
import 'package:apischapter10/models/secondexpModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Second_Example extends StatefulWidget {
  const Second_Example({super.key});

  @override
  State<Second_Example> createState() => _Second_ExampleState();
}

class _Second_ExampleState extends State<Second_Example> {
  List<Photos> photolist = [];
  Future<List<Photos>> getPhotos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      print(data);
      for (Map i in data) {
        Photos photos = Photos(
          title: i['title'],
          url: i['url'],
          id: i['id'],
          thumbnailUrl: i['thumbnailUrl'],
        );
        photolist.add(photos);
      }
      return photolist;
    } else {
      return photolist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Example Api'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPhotos(),
              builder: (context, AsyncSnapshot<List<Photos>> snapshot) {
                return ListView.builder(
                  itemCount: photolist.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          snapshot.data![index].url.toString(),
                        ),
                      ),
                      title: Text(
                        'Notes ID' + snapshot.data![index].id.toString(),
                      ),
                      subtitle: Text(
                        snapshot.data![index].title.toString(),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
