import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ualet/router/router.gr.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/ualet-character/basic1-shadow.png"),
              )),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            child: Text("HOLA, STIVEN",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0)),
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.person_pin, size: 30.0),
              title: Text("Mi Perfil"),
              onTap: () => ExtendedNavigator.rootNavigator
                  .pushNamed(Routes.profilePage)),
          Divider(),
          ListTile(
            leading: Icon(Icons.chat, size: 30.0),
            title: Text("Notificaciones"),
            onTap: () => ExtendedNavigator.rootNavigator
                .pushNamed(Routes.notificationsPage),
          ),
          Divider(),
          ListTile(
            title: Text("Acerca de Ualet"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text("Preguntas Frecuentes"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
              leading: Icon(
                Icons.insert_drive_file,
                size: 30.0,
              ),
              title: Text("Extractos"),
              onTap: () => ExtendedNavigator.rootNavigator
                  .pushNamed(Routes.extractsPage)),
          Divider(),
          Container(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Divider(),
                    ListTile(
                        leading: Icon(Icons.power_settings_new),
                        onTap: () => ExtendedNavigator.rootNavigator
                            .pushNamed(Routes.indexPage),
                        title: Text('Cerrar Sesión')),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
