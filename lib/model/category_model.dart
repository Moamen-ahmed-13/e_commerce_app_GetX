class CategoryModel {
  String? name, image;
CategoryModel({this.name, this.image});


CategoryModel.fromJson(Map<dynamic,dynamic> map){
  if (map == null) {
    return;
    
  }

  name = map['name'];
  image = map['image'];

}
tiJson(){
  return {
    'name': name,
    'image': image
    };
    }

}