import 'package:flutter/material.dart';
import 'package:practica_2/src/utils/color_settings.dart';

class Opcion2Screen extends StatelessWidget {
  const Opcion2Screen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    TextEditingController txtPropina = TextEditingController();
    int propinas = 10;

    TextFormField txtPropinas = TextFormField(
      controller: txtPropina,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          hintText: 'Introduce la cantidad a pagar',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5)
      ),
    );

    ElevatedButton btnCalcular = ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: ColorSettings.colorButton2
        ),
        onPressed: (){
          double valor = double.parse(txtPropina.text);
          double totalp = (valor*propinas)/100;
          double total = totalp + valor;

          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertDialog(
                title: Text('El adeudo es de: '),
                content: Text(
                      'Total de la cuenta: ' + valor.toString() + '\n\n' +
                      'Porcentaje de propina: ' + propinas.toString() +'%\n\n' +
                      'TOTAL: ' + total.toString(),
                ),

                actions: <Widget> [
                  FlatButton(
                    child: Text('LIQUIDAR CUENTA'),
                    color: ColorSettings.colorPrimary,
                    onPressed: (){
                      Navigator.of(context).pop('Ok');
                      txtPropina.clear();
                    },
                  ),
                ],
              )
          );

        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.monetization_on),
            Text('CALCULAR TOTAL')
          ],
        )

    );

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: ColorSettings.colorPrimary,
              title: Text('CALCULADORA DE PROPINAS'),
            ),

          ),
        ),
        Card(
          margin: EdgeInsets.only(left: 20, right: 15, bottom: 200),
          color: Colors.white60,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                Text('INGRESA LA CANTIDAD A PAGAR'),
                SizedBox(height: 15,),
                txtPropinas,
                SizedBox(height: 5,),
                btnCalcular
              ],
            ),
          ),
        ),
        Positioned(
          child:
          Image.asset('assets/dinero.jpg', width: 500,),
          top: 120,
        ),
      ],
    );
  }
}

