import 'package:flutter/material.dart';
import 'package:practica_2/src/screens/profile_screen.dart';
import 'package:practica_2/src/utils/color_settings.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DASHBOARD'),
          backgroundColor: ColorSettings.colorPrimary,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
          UserAccountsDrawerHeader(
            accountName:
            Row(
              children: <Widget>[
                Expanded(
                  child: Text('PÉREZ HERNÁNDEZ MARÍA ESTELA'),
                )
              ],
            ),
            accountEmail:
            Row(
            children: <Widget>[
              Expanded(
                  child: Text('perez.estela@itcelaya.edu.mx'),
              ),
              Expanded(
                child:  IconButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()
                        )
                    );
                  },
                  icon: Icon(Icons.edit, color: Colors.red),
                  iconSize: 25,

                ),
              ),
            ],
            ),
            currentAccountPicture: Row(
              children: <Widget>[
                Expanded(
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/logo.png"),
                    backgroundColor: Colors.green,
                    radius: 100,
                  ),
                ),

              ],
              mainAxisAlignment: MainAxisAlignment.end,

            ),
            decoration: BoxDecoration(
              color: ColorSettings.colorPrimary
            ),

          ),
            ListTile(
              title: Text('Opcion 1'),
              subtitle: Text('descripcion'),
              leading: Icon(Icons.thermostat),
              trailing: Icon(Icons.chevron_right),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context,'/opc1');

              },
            ),
            ListTile(
              title: Text('Propinas'),
              subtitle: Text('calculadora de propinas'),
              leading: Icon(Icons.monetization_on),
              trailing: Icon(Icons.chevron_right),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context,'/opc2');

              },
            ),
            ListTile(
              title: Text('Intenciones'),
              subtitle: Text('Intenciones implicitas'),
              leading: Icon(Icons.phone_android),
              trailing: Icon(Icons.chevron_right),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context,'/intenciones');
              },
            ),
            ListTile(
              title: Text('Notas'),
              subtitle: Text('CRUD Notas'),
              leading: Icon(Icons.note),
              trailing: Icon(Icons.chevron_right),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context,'/notas');
              },
            )
        ],
        ),
      ),
    );
  }
}
