class NotasModel{
int? id;
String? titulo;
String? detalle;

/*NotasModel( int id, String titulo, String detalle ){
  this.id = id;
  this. titulo = titulo;
  this.detalle = detalle;
}*/
// este esquema sirve para obtener un tipo de dato y lo transforma en un objeto
NotasModel({this.id, this.titulo, this.detalle});

//Map -> object
factory NotasModel.fromMap(Map<String, dynamic> map){
return NotasModel(
  id: map['id'],
  titulo: map['titulo'],
  detalle: map['detalle']
);
}

//object -> Map
  //servira cuando queremos llenar con datos en la BD
Map<String,dynamic> toMap(){
  return {
    'id' : id,
    'titulo' : titulo,
    'detalle' : detalle
  };
}

}