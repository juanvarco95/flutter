import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Colors.black87,
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot snapshot) =>
          ListView(children: _listaItems(snapshot.data)),
    );
  }

  List<Widget> _listaItems(List<dynamic> data) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(
          Icons.arrow_right_alt_rounded,
          color: Colors.lime,
        ),
        onTap: () {},
      );
      opciones
        ..add(widgetTemp)
        ..add(Divider(
          color: Colors.cyan[300],
          indent: 3.0,
          thickness: 1.0,
        ));
    });
    return opciones;
  }
}
