// show para usar una parte de una librería
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider {
  List<dynamic> opciones = [];
  // Constructor
  _MenuProvider() {
    // cargarData();
  }
  // Se usa un Future
  Future<List<dynamic>> cargarData() async {
    // Esto regresa un Future... Acá se procesa el Json
    final resp = await rootBundle.loadString('data/menu_opts.json');
    // Se guarda en un Map y se usa decode para almacenar la información del Json
    Map dataMap = json.decode(resp);
    // dataMap['Rutas'] => Es de donde proviene la información que me interesa del Json
    opciones = dataMap['rutas'];

    return opciones;
  }
}

// Para poder realizar las instancia a una función privada (_MenuProvider)
// se hace desde este mismo archivo

final menuProvider = _MenuProvider();
