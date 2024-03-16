class Values{
  String? value;
  int? id;

  Values({
    required this.value, required this.id
});
  Values.fromJson(Map<String , dynamic>json){
    value = json['value']??"0";
    id = json['id']??0;
  }
}