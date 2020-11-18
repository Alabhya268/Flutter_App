import 'package:flutter/material.dart';

class MessageCompose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compose Message'),
      ),
      body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Compose New Message',
                style: Theme.of(context).textTheme.headline6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    child: Text('Love'),
                    onPressed: () {},
                  ),
                  RaisedButton(
                    child: Text('Hate'),
                    onPressed: () {},
                  )
                ],
              )
            ],
          )),
    );
  }
}
