
class Book {
  static int MAlE = 1;
  static int FEMAlE = 2;
  var _name = '';
  var _price = 0;
  var _content = '';


  // Book (name, price, content){
  //   this.name = name;
  //   this.price = price;
  //   this.content = content;
  // } = (Book(this.name, this.price, this.content);

  
  // Book({required this.name,this.price = 0, this.content = ''});
  // Book.nothing() {
  //   this.content = "loi nguyen";
  // }

  // sử dụng nhiều contructor có thể sử dụng cách sau.
  Book.Male(){
    _name = "loi";
  }
  Book.Female(){
    _name = "Hoai";
  }
  factory Book(type) {
    if(type == MAlE){
      return Book.Male();
    }
    return Book.Female();
  }

  set price(price) => _price = price;
  String get name => _name;

}

void main(List<String> args) {
  // var book1 = Book("sach vui", 1000, "nha gia kim");
  var book1 = Book(1);
  print(book1._name);

  var boo2 = Book.Female();
  print(boo2._name);
}