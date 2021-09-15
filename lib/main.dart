import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // Material App para ejecutar al aplicación
  @override
  Widget build(BuildContext context) {
    // Material App
    return MaterialApp(
      title: 'Componentes App',
      // Para quitar la banda de Modo Debug
      debugShowCheckedModeBanner: false,
      // Para cambiar el idioma de los pop ups usados
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'), // English, no country code
        Locale('es', 'ES'), // Spanish, no country code
      ],
      // Ruta inicial
      initialRoute: '/',
      // Routes: Obtener de donde provienen las rutas
      routes: getApplicationRoutes(),
      // Generar una ruta la cual no está definida
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },
    );
  }
}
