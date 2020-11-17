import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Email App'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  var messages = const [
    {'subject': 'My first message', 'body': 'lorem ipsem'},
    {'subject': 'my seconf message', 'body': 'lorem ipsem'},
    {'subject': 'You won a lottery', 'body': 'lorem ipsem'},
    {'subject': 'You should read this messages', 'body': 'lorem ipsem'},
    {'subject': 'You have lottery again', 'body': 'lorem ipsem'},
  ];
  MyHomePage({this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(title)),
      ),
      body: ListView.separated(
        itemCount: messages.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          var message = messages[index];
          return ListTile(
            title: Text(message['subject']),
            isThreeLine: true,
            leading: CircleAvatar(
              child: Text('As'),
            ),
            subtitle: Text(message['body'],
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            ),
          );
        },
      ),
    );
  }
}
