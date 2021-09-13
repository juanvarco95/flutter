import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Card'),
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          children: [
            _cardTipo1(),
            SizedBox(height: 30.0),
            _cardTipo2(),
            SizedBox(height: 30.0),
            _cardTipo1(),
            SizedBox(height: 30.0),
            _cardTipo2(),
            SizedBox(height: 30.0),
            _cardTipo1(),
            SizedBox(height: 30.0),
            _cardTipo2(),
            SizedBox(height: 30.0)
          ]),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurpleAccent,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 50,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_alert_rounded),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.add_box_sharp),
            title: Text('Texto de prueba'),
            subtitle: Text('Texto de prueba pero del subtítulo'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {}, child: Text('Cancelar')),
              TextButton(onPressed: () {}, child: Text('Ok'))
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
        child: Column(
      children: [
        FadeInImage(
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(
                'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2020/02/spider-man-1876543.jpg')),
        Container(
          padding: EdgeInsets.all(10),
          child: Text('Spiderman'),
        ),
      ],
    ));

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                color: Colors.black45,
                offset: Offset(2, 10),
                spreadRadius: 2)
          ]),
      child: ClipRRect(child: card, borderRadius: BorderRadius.circular(30)),
    );
  }
}
