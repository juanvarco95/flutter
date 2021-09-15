import 'package:flutter/material.dart';
// Paquete para usar Flutter

class InputPage extends StatefulWidget {
  // Widget Full admite cambios en los valores definidos
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _apellido = '';
  String _correo = '';
  String _password = '';
  /* // Para la fecha se usa un TextEditingController que guarde la acción que se 
  y luego en la función se debe usar un onTap:(){} que tenga una función FocusScope
  para evitar que el usuario ingrese texto*/
  String _fecha = '';
  // Controlador de la fecha
  TextEditingController _inputFieldDateController = TextEditingController();

  // Se sobreescribe la función build para hacer la contrucción de la App
  @override
  Widget build(BuildContext context) {
    /* Scaffold: Base que dibuja la App
       AppBar: Barra superior */
    return Scaffold(
      appBar: AppBar(title: Text('Inputs'), backgroundColor: Colors.black87),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurpleAccent,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 50,
        ),
      ),
      // ListView: Se usa este tipo de Widget para hacer Scroll en la pantalla
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
          _inputFecha(context),
          Divider(),
          _mostrarTexto(),
        ],
      ),
    );
  }

  Widget _nombreInputs() {
    // TextField: Para capturar los datos del usuarios
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
      // onChanged: Para efectuar los valores que ingrese el usuario
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

  Widget _inputFecha(BuildContext context) {
    return TextField(
      // obscureText: true,

      controller: _inputFieldDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          // counter: Text('Letras: ${_password.length}'),
          hintText: 'Acá va fecha',
          labelText: 'Fecha',
          helperText: 'Sólo la fecha',
          suffixIcon: Icon(Icons.date_range),
          icon: Icon(Icons.date_range_sharp)),
      // onTap: Para cuando el usuario toque se realice una acción
      onTap: () {
        // FocusScope: Evita que se use como un TextField normal
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    // DateTime: Para capturar el valor dado por showDatePicker
    // showDatePicker: Retorna un future con un PopUp de la fecha
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2022)
        locale: Locale('es','ES'));
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }
}
