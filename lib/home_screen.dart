import 'dart:typed_data';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final imageUrl =
      'https://cricbuzz-cricket.p.rapidapi.com/img/v1/i1/c548593/i.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: FutureBuilder<Uint8List>(
          future: getApi(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else if (snapshot.hasData) {
              return Image.memory(snapshot.data!);
            } else {
              return Text('unable to fetch data');
            }
          }),
    );
  }
}
