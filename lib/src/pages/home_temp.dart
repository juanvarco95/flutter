import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = [
    'Uno',
    'Dos',
    'Tres',
    'Cuatro',
    'Cinco',
    'Seis',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temporales'),
      ),
      body: ListView(
        children: _crearItemsCorta(),
      ),
    );
  }

  // List<Widget> _crearItems() {
  //   // El constructor de listas es con: []
  //   List<Widget> lista = [];
  //   for (var opt in opciones) {
  //     final tempList = ListTile(
  //       title: Text(opt),
  //     );
  //     lista
  //       ..add(tempList)
  //       ..add(Divider(
  //         color: Colors.cyan[100],
  //         height: 12.0,
  //         thickness: 2.0,
  //       ));
  //   }
  //   return lista;
  // }

  List<Widget> _crearItemsCorta() {
    return opciones.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item + " Prueba"),
            subtitle: Text(item + " Subtitulo"),
            trailing: Icon(Icons.keyboard_arrow_right_sharp),
            leading: Icon(Icons.adb),
            onTap: () {},
          ),
          Divider(
            color: Colors.cyan[100],
            height: 12.0,
            thickness: 2.0,
          ),
        ],
      );
    }).toList();
  }
}
