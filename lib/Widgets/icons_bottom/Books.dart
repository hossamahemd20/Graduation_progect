import 'package:flutter/material.dart';


class Books extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BookPage(),
    );
  }
}

class BookPage extends StatelessWidget {
  final List<Map<String, String>> books = [
    {'title': 'Book 1', 'author': 'Author 1'},
    {'title': 'Book 2', 'author': 'Author 2'},
    {'title': 'Book 3', 'author': 'Author 3'},
    {'title': 'Book 4', 'author': 'Author 4'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: books.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.grey[300],
                    height: 120,
                    child: Center(child: Text('Book Image')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      books[index]['title']!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(books[index]['author']!),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
