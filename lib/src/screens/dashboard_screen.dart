import 'package:flutter/material.dart';
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
            accountName: Text('PÉREZ HERNÁNDEZ MARÍA ESTELA'), 
            accountEmail: Text('perez.estela@itcelaya.edu.mx'),
            currentAccountPicture: CircleAvatar(
              //Image.network('URL')
            child:  Image.asset('assets/logo.png', width: 150,),

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
            )
        ],
        ),
      ),
    );
  }
}
