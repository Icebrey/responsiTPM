import 'package:flutter/material.dart';
import 'package:responsi/list_news_model.dart';
import 'package:responsi/base_network.dart';

class DaerahPage extends StatefulWidget {
  @override
  _DaerahPageState createState() => _DaerahPageState();
}

class _DaerahPageState extends State<DaerahPage> {
  List<Posts> _newsList = [];

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    try {
      Map<String, dynamic> response =
          await BaseNetwork.get('daerah');

      ListNewsModel newsModel = ListNewsModel.fromJson(response);
      if (newsModel.data?.posts != null) {
        setState(() {
          _newsList = newsModel.data!.posts!;
        });
      }
    } catch (error) {
      print('Error fetching news: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daerah'),
      ),
      body: ListView.builder(
        itemCount: _newsList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailPage(news: _newsList[index]),
                ),
              );
            },
            leading: Image.network(_newsList[index].thumbnail ?? ''),
            title: Text(_newsList[index].title ?? ''),
            
          );
        },
      ),
    );
  }
}

class NewsDetailPage extends StatelessWidget {
  final Posts news;

  NewsDetailPage({required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(news.thumbnail ?? ''),
            SizedBox(height: 16.0),
            Text(
              news.title ?? '',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(news.description ?? ''),
          ],
        ),
      ),
    );
  }
}
