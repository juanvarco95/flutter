import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = ScrollController();

  List<int> _listaNumeros = [];
  // ignore: unused_field
  int _ultimoItem = 0;

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // print(_ultimoItem);
        _agregar10();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Page'),
      ),
      body: _crearLista(),
    );
  }

  Widget _crearLista() {
    // Todo método Builder es porque será dibujado en la pantalla
    return ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int i) {
          final imagen = _listaNumeros[i];
          print(i);
          return FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: NetworkImage(
                  'https://picsum.photos/500/300?imagen=$imagen[i]'));
        });
  }

  void _agregar10() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {});
  }
}
