import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = ScrollController();

  List<int> _listaNumeros = [];
  // ignore: unused_field
  // Item para cargar más imágenes
  int _ultimoItem = 0;
  // Para hacer luego una condición y pregunta
  bool _isLoading = false;

  // initState para generar un estado inicial en la página de la aplicación
  @override
  void initState() {
    super.initState();
    _agregar10();
    // Todos los controladores tienen un Listener
    _scrollController.addListener(() {
      // Posicion en pixeles del scroll actual == Posición máxima del scroll
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // Función que se usa para cargar las imágenes
        fetchData();
      }
    });
  }

  // dispose(): Se hace para que el controlador deje de usar el Listener
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List Page'),
        ),
        // Stack: Widger que se usa para poner Widgets uno encima del otro
        body: Stack(
          children: [
            _crearLista(),
            _crearLoading(),
          ],
        ));
  }

  Widget _crearLista() {
    // Todo método Builder es porque será dibujado en la pantalla y el ListView contiene un Scroll
    return RefreshIndicator(
      color: Colors.amberAccent,
      onRefresh: _obtenerPagina1,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: _listaNumeros.length,
          itemBuilder: (BuildContext context, int i) {
            final imagen = _listaNumeros[i];
            // print(i);
            return FadeInImage(
                fit: BoxFit.fill,
                placeholder: AssetImage('assets/jar-loading.gif'),
                image: NetworkImage(
                    'https://picsum.photos/500/300?imagen=$imagen[i]'));
          }),
    );
  }

  Future _obtenerPagina1() async {
    final duration = Duration(seconds: 2);
    Timer(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });
    // Retornar demora de la función para que se pueda ver
    return Future.delayed(duration);
  }

  void _agregar10() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {});
  }

  // Función para dejar una espera y hacer una ejecución en dos segundos
  Future fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = Duration(seconds: 2);
    // Retorna un Timer, el cual es Future
    return Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;

    _agregar10();
    // Para generar una animación en la entrada del scroll
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: Colors.amberAccent,
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
