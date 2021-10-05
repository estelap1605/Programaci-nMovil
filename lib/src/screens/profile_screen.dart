import 'package:flutter/material.dart';
import 'package:practica_2/src/database/database_helper.dart';
import 'package:practica_2/src/models/notas_model.dart';
import 'package:practica_2/src/models/profile_model.dart';
import 'package:practica_2/src/utils/color_settings.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
 ProfileModel? profile;

  ProfileScreen({Key? key,this.profile}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  late DatabaseHelper _databaseHelper;

  // controladores
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerMaterno = TextEditingController();
  TextEditingController _controllerPaterno = TextEditingController();
  TextEditingController _controllerTelefono = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  var imagen;
  final picker = ImagePicker();
  var pickedFile;


  @override
  void initState() {
    // super.initState();
    if (widget.profile != null) {
      _controllerName.text = widget.profile!.nombre!;
      _controllerPaterno.text = widget.profile!.apaterno!;
      _controllerMaterno.text = widget.profile!.amaterno!;
      _controllerTelefono.text = widget.profile!.telefono!;
      _controllerEmail.text = widget.profile!.email!;
      pickedFile.path = widget.profile!.avatar!;
    }
    _databaseHelper = DatabaseHelper();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: ColorSettings.colorPrimary2,
        title: Text('User Profile'),
      ),
      body:
      Column(
          children: [
            _MostrarFoto(),
            _EditarNombre(),
            _EditarApellidoPaterno(),
            _EditarApellidoMaterno(),
            _EditarNumeroTel(),
            _EditarEmail(),
              ElevatedButton(onPressed: () {
                ProfileModel profile = ProfileModel(
                  id: 1,
                    nombre: _controllerName.text,
                    apaterno: _controllerPaterno.text,
                    amaterno: _controllerMaterno.text,
                    telefono: _controllerTelefono.text,
                    email: _controllerEmail.text,
                    avatar: pickedFile.path
                );

                _databaseHelper.update2(profile.toMap()).then(
                        (value) {
                      if (value > 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(
                                'Registro Actualizado correctamente')));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('No se completo la solicitud')));
                      }
                    }
                );
              },
                child: Text('Edit profile'),),
            ElevatedButton(onPressed: () {
              ProfileModel profile = ProfileModel(
                  nombre: _controllerName.text,
                  apaterno: _controllerPaterno.text,
                  amaterno: _controllerMaterno.text,
                  telefono: _controllerTelefono.text,
                  email: _controllerEmail.text,
                  avatar: pickedFile.path
              );

              _databaseHelper.insert2(profile.toMap()).then(
                      (value) {
                    if (value > 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(
                              'Registro insertado correctamente')));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('No se completo la solicitud')));
                    }
                  }
              );
            },
              child: Text('Save profile'),),
          ]
      ),

    );
  }

  Widget _EditarNombre() {
    return TextField(
      controller: _controllerName,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        labelText: "Nombre del Usuario",
        errorText: "Este campo es obligatorio",
      ),
      onChanged: (value) {},
    );
  }

  Widget _EditarApellidoPaterno() {
    return TextField(
      controller: _controllerPaterno,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        labelText: "Apellido Paterno del Usuario",
        errorText: "Este campo es obligatorio",
      ),
      onChanged: (value) {},
    );
  }

  Widget _EditarApellidoMaterno() {
    return TextField(
      controller: _controllerMaterno,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        labelText: "Apellido Materno del Usuario",
        errorText: "Este campo es obligatorio",
      ),
      onChanged: (value) {},
    );
  }

  Widget _EditarNumeroTel() {
    return TextField(
      controller: _controllerTelefono,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        labelText: "Numero de telefono del Usuario",
        errorText: "Este campo es obligatorio",
      ),
      onChanged: (value) {},
    );
  }

  Widget _EditarEmail() {
    return TextField(
      controller: _controllerEmail,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        labelText: "Correo electronico del Usuario",
        errorText: "Este campo es obligatorio",
      ),
      onChanged: (value) {},
    );
  }

//cambiar imagen de la galeria o de la camara
  opcionesPosibles(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  //propiedad inkwell
                  InkWell(
                    onTap: () {
                      setImagen(1);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(width: 1, color: Colors.grey))
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text('Tomar Foto ',
                                style: TextStyle(fontSize: 16)),
                          ),
                          Icon(Icons.camera_alt, color: Colors.blue)
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setImagen(2);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text('Seleccionar Foto ',
                                style: TextStyle(fontSize: 16)),
                          ),
                          Icon(Icons.image, color: Colors.blue)
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text('Cancelar', style: TextStyle(
                                fontSize: 16, color: Colors.white),
                              textAlign: TextAlign.center,),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
    );
  }

  Widget _MostrarFoto() {
    return Row(
        children: <Widget>[
          Expanded(
              child: Column(
                children: [
                  imagen == null ? Center() : Image.file(imagen),
                  ElevatedButton(
                      onPressed: () {
                        opcionesPosibles(context);
                      },
                      child: Text('Selecciona una imagen perfil')
                  ),

                ],
              )
          ),
        ]
    );
  }

  Future setImagen(opcion) async {
    if (opcion == 1) {
      pickedFile = await picker.getImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.getImage(source: ImageSource.gallery);
    }
    setState(() {
      if (pickedFile != null) {
        imagen = File(pickedFile.path);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('No se selecciono una imagen'))
        );
      }
    });
    Navigator.of(context).pop();
  }

  Widget _listado(List<ProfileModel> profiles){
    return ListView.builder(
      itemBuilder: (BuildContext context, index){
        ProfileModel profile = profiles[index];
        return Card(
          child: Column(
            children : [
              Text('Usuario'),
              Text(profile.nombre!, style: TextStyle(fontWeight: FontWeight.bold),),
              Text(profile.email!, style: TextStyle(fontWeight: FontWeight.normal),),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen(profile: profile),
                          )
                      );
                    },
                    icon: Icon(Icons.edit),
                    iconSize: 18,
                  ),

                ],
              )
            ],
          ),
        );
      },
      itemCount: profiles.length,
    );
  }

}
