import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List videos = [];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getVideos();
  }

  Future getVideos() async {
    setState(() {
      isLoading = true;
    });

    const String url = 'https://www.googleapis.com/youtube/v3/'
        'search?order=date&part=snippet&'
        'channelId=UCs-4FDk4iSuJo0B0XAVqImA&maxResults=10&'
        'key=AIzaSyBZjD_Uhb-ten_cskaQFLE2pficxZ5rhxA';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);

      setState(() {
        videos.addAll(data['items']);
        isLoading = false;
      });
    } else {
      print('API failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YouTube Videos'),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: videos.length,
            itemBuilder: (BuildContext context, int index) {
              return VideoCard(
                video: videos[index],
              );
            },
          ),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}

class VideoCard extends StatelessWidget {
  final dynamic video;

  const VideoCard({required this.video});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(8.0),
      leading: CachedNetworkImage(
        imageUrl: video['snippet']['thumbnails']['default']['url'],
        width: 100,
        height: 56,
        fit: BoxFit.cover,
      ),
      title: Text(
        video['snippet']['title'],
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        video['snippet']['description'],
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),

    );
  }
}
