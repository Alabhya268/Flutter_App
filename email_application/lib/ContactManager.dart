import 'dart:async';

import 'package:email_application/model/Contact.dart';
import 'package:email_application/service/ContactService.dart';

import 'package:rxdart/rxdart.dart';

class ContactManager {
  final BehaviorSubject<int> _contactCounter = BehaviorSubject<int>();
  Stream<int> get ContactCounter => _contactCounter.stream;

  Stream<List<Contact>> get contactListView async* {
    yield await ContactService.browse();
  }

  Stream<List<Contact>> filteredCollection({query}) async* {
    yield await (ContactService.browse(query: query));
  }

  ContactManager() {
    contactListView.listen(
      (list) {
        _contactCounter.add(list.length);
      },
    );
  }
}
