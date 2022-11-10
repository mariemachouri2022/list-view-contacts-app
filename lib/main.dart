import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ListView'),
        ),
        backgroundColor: Colors.indigo[100],
        body: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;

    return Container(
      width: sizeX,
      height: sizeY,
      child: ListView(
        children: _showContacts(),
      ),
    );
  }
}

List<Widget> createSquares(int numSquares) {
  int i = 0;
  List colors = [
    Colors.amber,
    Colors.deepPurple,
    Colors.deepOrange,
    Colors.indigo,
    Colors.lightBlue
  ];
  List<Widget> squares = [];
  while (i < numSquares) {
    Container square = Container(
      color: colors[i % 5],
      width: 100.0,
      height: 100.0,
      child: Text(i.toString()),
    );
    i++;
    squares.add(square);
  }
  return squares;
}

class Contact {
  String name;
  String subTitle;
  IconData icon;
  Contact(this.name, this.subTitle, this.icon);
}

List<Contact> _buildContacts() {
  List<Contact> contacts = [];
  contacts.add(Contact('Mohamed', 'Manager', Icons.sentiment_satisfied));
  contacts.add(Contact('Maryem', 'Directrice', Icons.sentiment_satisfied));
  contacts.add(Contact('Salah', 'RH', Icons.sentiment_neutral));
  return contacts;
}

List<ListTile> _showContacts() {
  List<Contact> contacts = _buildContacts();
  for (int i = 0; i < 20; i++) {
    contacts.addAll(_buildContacts());
  }
  List<ListTile> list = [];
  contacts.forEach((contact) {
    list.add(ListTile(
      title: Text(contact.name),
      subtitle: Text(contact.subTitle),
      leading: CircleAvatar(
        child: Icon(contact.icon),
        backgroundColor: Colors.amber[600],
      ),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () => true,
    ));
  });
  return list;
}
