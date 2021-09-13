import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('Alert Page'), backgroundColor: Colors.black87),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurpleAccent,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 50,
        ),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Mostrar Alerta'),
          onPressed: () => _mostrarAlerta(context),
          style: ElevatedButton.styleFrom(
              primary: Colors.pinkAccent,
              shape: StadiumBorder(
                  side: BorderSide(color: Colors.transparent, width: 2.0))),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.ac_unit),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Título'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Contenido de la caja'),
                FlutterLogo(
                  size: 100,
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancelar')),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Ok'))
            ],
          );
        });
  }
}
