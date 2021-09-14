import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _apellido = '';
  String _correo = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inputs'), backgroundColor: Colors.black87),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurpleAccent,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 50,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          _nombreInputs(),
          Divider(),
          _apellidoInputs(),
          Divider(),
          _correoInputs(),
          Divider(),
          _passwordInputs(),
          Divider(),
          _mostrarTexto(),
        ],
      ),
    );
  }

  Widget _nombreInputs() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          counter: Text('Letras: ${_nombre.length}'),
          hintText: 'Acá va el nombre',
          labelText: 'Nombre',
          helperText: 'Sólo el nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _apellidoInputs() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          counter: Text('Letras: ${_apellido.length}'),
          hintText: 'Acá va el apellido',
          labelText: 'Apellido',
          helperText: 'Sólo el apellido',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (valor) {
        setState(() {
          _apellido = valor;
        });
      },
    );
  }

  Widget _mostrarTexto() {
    return Container(
      height: 80,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.pink[50], borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(
        '$_nombre ... $_apellido ... $_correo',
        style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.dotted),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _correoInputs() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          // counter: Text('Letras: ${_correo.length}'),
          hintText: 'Acá va el correo',
          labelText: 'Correo',
          helperText: 'Sólo el correo',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.email_outlined)),
      onChanged: (valor) {
        setState(() {
          _correo = valor;
        });
      },
    );
  }

  Widget _passwordInputs() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          // counter: Text('Letras: ${_password.length}'),
          hintText: 'Acá va el password',
          labelText: 'Password',
          helperText: 'Sólo el password',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (valor) {
        setState(() {
          _password = valor;
        });
      },
    );
  }
}
