import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Avatar Page'),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10),
            // Circle Avatar: Imagen o avatar pequeño
            child: CircleAvatar(
              // NetworkImage: Forma de pedir imágen de Internet
              backgroundImage: NetworkImage(
                  'https://pbs.twimg.com/profile_images/1400828118169014281/Qsi3PeLh.jpg'),
            ),
          ),
          Container(
              child: CircleAvatar(
                  // CircleAvatar: Se puede usar cualquier Widget
                  child: Text('JM'),
                  backgroundColor: Colors.purpleAccent))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurpleAccent,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 50,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Center(
        // FadeInImage: Para poner un gif de carga o animación mientras cargas la imagen Web
        child: FadeInImage(
          image: NetworkImage(
              'https://www.futbolred.com/files/article_main/uploads/2021/08/18/611d7c9bf29a1.jpeg'),
          // AssetImage: Forma de pedir la imagen desde la carpeta que desee pedir
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
