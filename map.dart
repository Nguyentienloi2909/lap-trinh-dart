void main(List<String> args) {
  Map<String, int > map1 = Map <String, int>();
  map1 ={
    'age': 30,
    'age1': 40,
    'age2': 50,
  };
  map1.forEach((key, value) => print(value + 2) );
  // var b = map1.map((key, value) => null)
}