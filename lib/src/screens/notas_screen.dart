import 'package:flutter/material.dart';
import 'package:practica_2/src/database/database_helper.dart';
import 'package:practica_2/src/models/notas_model.dart';
import 'package:practica_2/src/utils/color_settings.dart';

import 'agregar_nota_screen.dart';

class NotasScreen extends StatefulWidget {
  const NotasScreen({Key? key}) : super(key: key);

  @override
  _NotasScreenState createState() => _NotasScreenState();
}

class _NotasScreenState extends State<NotasScreen>  {

  //indica que posterirormente sera inicializado late
 late DatabaseHelper _databaseHelper;

  @override
  void initState() {
    super.initState();
  _databaseHelper = DatabaseHelper();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:  AppBar(
        backgroundColor: ColorSettings.colorPrimary3,
        title: Text('Gestión de notas'),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pushNamed(context,'/agregar');
              },
              icon: Icon(Icons.note_add)
          )
        ],
      ),
      body: FutureBuilder(
        future: _databaseHelper.getAllNotes(),
        builder: (BuildContext context,AsyncSnapshot<List<NotasModel>> snapshot){
if ( snapshot.hasError ){
  return Center( child: Text('Ocurrio un error en la peticion'),);
}else {
  if( snapshot.connectionState == ConnectionState.done){
    return _listadoNotas(snapshot.data!);
  } else {
    return Center( child: CircularProgressIndicator(),);
  }
}
        },
      ),
    );
  }

  Widget _listadoNotas(List<NotasModel> notas){
    return ListView.builder(
      itemBuilder: (BuildContext context, index){
        NotasModel nota = notas[index];
        return Card(
          child: Column(
            children : [
              Text(nota.titulo!, style: TextStyle(fontWeight: FontWeight.bold),),
              Text(nota.detalle!, style: TextStyle(fontWeight: FontWeight.normal),),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AgregarNotaScreen(nota: nota,)
                        )
                      );
                    },
                    icon: Icon(Icons.edit),
                    iconSize: 18,
                  ),
                  IconButton(
                    onPressed: (){
                      //pedir una peticion
                      showDialog(
                          context: context,
                          builder: (context){
                            return AlertDialog(
                              title: Text('Ventana de Confirmación'),
                              content: Text('¿Estas seguro de eliminar esta nota'),
                                actions: [
                                  TextButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                      _databaseHelper.delete(nota.id!).then(
                                              (noRows ) {
                                                if( noRows > 0) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                       SnackBar(content: Text('El registro se elimino correctamente'))
                                                  );
                                                  setState(() {});
                                                }
                                              }
                                      );
                                    },
                                    child: Text('Si'),
                                  ),
                                  TextButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: Text('No'),
                                  )
                                ],
                            );
                          });
                    },
                    icon: Icon(Icons.delete),
                    iconSize: 18,
                  ),
                ],
              )
            ],
          ),
        );
      },
      itemCount: notas.length,
    );
  }
}
