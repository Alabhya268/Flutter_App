// import 'package:email_application/ComposeButton.dart';
import 'package:email_application/Message.dart';
import 'package:email_application/MessageDetail.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'MessageCompose.dart';

class MessageList extends StatefulWidget {
  final String title;

  MessageList({this.title});

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  var future;
  List<Message> messages;

  void initState() {
    super.initState();
    fetch();
  }

  void fetch() async {
    future = Message.browse();
    messages = await future;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(widget.title)),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () async {
                var _messages = await Message.browse();
                setState(() {
                  messages = _messages;
                });
              },
            )
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountEmail: Text('Testmail@email.com'),
                accountName: Text('Alabhya'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://avatars2.githubusercontent.com/u/57143358?s=400&u=4d080b70a37b93171804f91ac2cd3fdbea951846&v=4'),
                ),
                otherAccountsPictures: [
                  GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(child: Icon(Icons.add)),
                  ),
                ],
              ),
              ListTile(
                title: Text("Inbox"),
                leading: Icon(FontAwesomeIcons.inbox),
              ),
              ListTile(
                title: Text("Draft"),
                leading: Icon(FontAwesomeIcons.edit),
              ),
              ListTile(
                title: Text("Archive"),
                leading: Icon(FontAwesomeIcons.archive),
              ),
              ListTile(
                title: Text("Sent"),
                leading: Icon(FontAwesomeIcons.paperPlane),
              ),
              ListTile(
                title: Text("Trash"),
                leading: Icon(FontAwesomeIcons.trash),
              ),
              Divider(),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ListTile(
                    title: Text("Settings"),
                    leading: Icon(FontAwesomeIcons.cog),
                  ),
                ),
              )
            ],
          ),
        ),
        body: FutureBuilder(
          future: future,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                if (snapshot.hasError)
                  return Text("There was an error: ${snapshot.error}");
                var messages = snapshot.data;
                return ListView.separated(
                  itemCount: messages.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    Message message = messages[index];
                    return ListTile(
                      title: Text(message.subject),
                      isThreeLine: true,
                      leading: CircleAvatar(
                        child: Text('As'),
                      ),
                      subtitle: Text(
                        message.body,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                MessageDetail(message.subject, message.body),
                          ),
                        );
                      },
                    );
                  },
                );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            Message message = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => MessageCompose(),
              ),
            );
            if (message != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Your message has been sent'),
                ),
              );
              messages.add(message);
              print(messages);
              print(messages.length);
            }
          },
        ),
      ),
    );
  }
}
