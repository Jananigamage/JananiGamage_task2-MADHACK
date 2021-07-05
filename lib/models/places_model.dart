class PlaceModel{

  final String name;
  final String image;
  final String shortDetail;
  final String des;


  PlaceModel({required this.name, required this.image, required this.shortDetail,required this.des});

  factory PlaceModel.fromJson(Map<String, dynamic>json)=> PlaceModel(
      name: json['title'],
      image: json['image'],
      shortDetail: json['short-detail'],
      des: json['description']

  );


}