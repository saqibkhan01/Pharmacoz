class ModelData{
  String? name;
  String? form;
  String? company;
  String? drugs;
  int? price;


  ModelData({this.name,this.company,this.form,this.drugs,this.price});

  //receive data from server


  factory ModelData.fromMap(map){
    return ModelData(
      name: map['name'],
      form: map['form'],
      company: map['company'],
      drugs: map['drugs'],
      price: map['price'],

    );

  }


// send data to server

  Map<String , dynamic> toMap(){
    return {
      'name':name,
      'form':form,
      'company':company,
      'drugs':drugs,
      'price':price,

    };

  }

}