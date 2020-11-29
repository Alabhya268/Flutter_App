import 'dart:async';

import 'package:email_application/model/Contact.dart';
import 'package:email_application/service/ContactService.dart';


class ContactManager {
  final StreamController<int> _contactCounter = StreamController<int>();
  Stream<int> get ContactCounter => _contactCounter.stream;

  Stream<List<Contact>> get contactListView async* {
    yield await ContactService.browse();
  }


  ContactManager() {
    contactListView.listen((list) {
        _contactCounter.add(list.length);
      },
    );
  }
}
