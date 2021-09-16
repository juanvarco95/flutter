import 'package:flutter/material.dart';

// En los StateFulWidget se usa el SetState
class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 50;
  bool _bloquearSlider = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Page'),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(child: _crearSlider()),
            _crearCheckbox(),
            _crearSwitch(),
            Padding(padding: EdgeInsets.only(top: 100)),
            _crearImagen(),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
        activeColor: Colors.amberAccent,
        label: 'Tamaño',
        min: 10,
        max: 500,
        value: _valorSlider,
        // En onChanged el (valor) es el que se captura por pantalla del móvil
        onChanged: (_bloquearSlider)
            ? null
            : (valor) {
                setState(() {
                  _valorSlider = valor;
                });
              });
  }

  Widget _crearImagen() {
    return FadeInImage(
        fit: BoxFit.fill,
        placeholder: AssetImage('assets/jar-loading.gif'),
        width: _valorSlider,
        image: NetworkImage(
          'https://periodicopeligrodegol.com/wp-content/uploads/2021/03/alexis-marquez.jpeg',
        ));
  }

  Widget _crearCheckbox() {
    return CheckboxListTile(
        value: _bloquearSlider,
        title: Text('Bloquear Slider'),
        onChanged: (valor) {
          setState(() {
            _bloquearSlider = valor!;
          });
        });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        value: _bloquearSlider,
        title: Text('Bloquear Slider'),
        onChanged: (valor) {
          setState(() {
            _bloquearSlider = valor;
          });
        });
  }
}
