class ProfileModel{
  int? id;
  String? nombre;
  String? apaterno;
  String? amaterno;
  String? telefono;
  String? email;
  String? avatar;


// este esquema sirve para obtener un tipo de dato y lo transforma en un objeto
  ProfileModel({this.id, this.nombre, this.apaterno, this.amaterno, this.telefono, this.email, this.avatar});

//Map -> object
  factory ProfileModel.fromMap(Map<String, dynamic> map){
    return ProfileModel(
        id: map['id'],
        nombre: map['nombre'],
        apaterno: map['apaterno'],
      amaterno: map['amaterno'],
      telefono: map['telefono'],
      email: map['email'],
      avatar: map['avatar']
    );
  }

//object -> Map
  //servira cuando queremos llenar con datos en la BD
  Map<String,dynamic> toMap(){
    return {
      'id' : id,
      'nombre' : nombre,
      'apaterno' : apaterno,
      'amaterno' : amaterno,
      'telefono' : telefono,
      'email' : email,
      'avatar' : avatar
    };
  }

}