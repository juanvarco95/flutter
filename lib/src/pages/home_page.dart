import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';

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
    // FutureBuilder: Se usa para leer el Json
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot snapshot) =>
          ListView(children: _listaItems(snapshot.data, context)),
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    // Forma de recorrer el Json
    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(
          Icons.arrow_right_alt_rounded,
          color: Colors.lime,
        ),
        onTap: () {
          Navigator.pushNamed(context, opt['ruta']);
          // final route = MaterialPageRoute(builder: (context) => AlertPage());

          // Navigator.push(context, route);
        },
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
