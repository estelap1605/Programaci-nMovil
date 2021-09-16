import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:practica_2/src/utils/color_settings.dart';

import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var isLoading = false;
  TextEditingController txtEmailCon = TextEditingController();
  TextEditingController txtPwdCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //la caja de texto
    TextFormField txtEmail = TextFormField(
      controller: txtEmailCon,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Introduce el email',
          //cambiar bordes con out es la parte de fuera
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5)
      ),
    );

    TextFormField txtPwd = TextFormField(
      controller: txtPwdCon,
      keyboardType: TextInputType.visiblePassword,
      maxLength: 5,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Introduce el password',
          hintStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          //cambiar bordes con out es la parte de fuera
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5)
      ),
    );

    ElevatedButton btnLogin = ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: ColorSettings.colorButton,
      ),
        onPressed: (){
          print(txtEmailCon.text);
          isLoading = true;
          setState(() {});
          Future.delayed(Duration(seconds: 15),(){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DashBoardScreen())
            );
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.login),
            Text('Validar Usuario')
          ],
        )
    );
    return 
     Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          //nos permite mostrar la imagen estirada y completa
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/imagen.jpg'),
              fit: BoxFit.fill
              )
          ),
        ),
       // LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
        //  return SingleChildScrollView(
       //         child:
       Card(
            margin: EdgeInsets.only(left: 15,right: 15,bottom: 20),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  txtEmail,
                  SizedBox(height: 5,),
                  txtPwd,
                  btnLogin
                ],
              ),
          ),
        ),
        Positioned(
          child: Image.asset('assets/logo.png', width: 150,),
          top: 120,
        ),
        Positioned(
          child: isLoading == true ? CircularProgressIndicator() : Container(),
          top: 350,
        )
      ],
   );
}
}