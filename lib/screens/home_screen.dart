import 'package:blog_app/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List articles = [];

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  // Function to fetch news articles
  Future<void> fetchNews() async {
    final response = await http.get(
      Uri.parse('https://newsapi.org/v2/top-headlines?country=us&apiKey=2a7819997f254b039e83e7c701f43cf4'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      setState(() {
        articles = data['articles'];
      });
    } else {
      throw Exception('Failed to load news');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News List'),
      ),
      body: articles.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return
          //   Row(
          //   children: [
          //   Container(
          //     height: 100,
          //     child:   article['urlToImage'] != null
          //       ? Image.network(
          //     article['urlToImage'],
          //     width: 100,
          //     fit: BoxFit.cover,
          //   )
          //       : Center(child: Icon(Icons.error)),),
          //     Column(children: [
          //      Text(article['title'] ?? 'No Title', style: AppTextStyles.heading,),
          //       Text(article['description'] ?? 'No Description', style: AppTextStyles.btnTextBlack,),
          //     ],),
          //   ],
          // );

            ListTile(
            leading: article['urlToImage'] != null
                ? Image.network(
              article['urlToImage'],
              width: 100,
              fit: BoxFit.cover,
            )
                : null,
            title: Text(article['title'] ?? 'No Title'),
            subtitle: Text(article['description'] ?? 'No Description'),
            onTap: () {
              // Handle article tap, e.g., open the article URL
              final url = article['url'];
              if (url != null) {
                _launchURL(url);
              }
            },
          );
        },
      ),
    );
  }

  // Method to open URLs in browser
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

}
