
// class PerSon{
//   int age = 0;
//   String name = '';
//   PerSon(this.name, this.age);

//   prinInfo() {
//     print("nam = $name,  age = $age");
//   }
// }

abstract class PerSon{
  int age = 0;
  String name = '';
  PerSon(this.name, this.age);

  prinInfo();
  printSomething(){
    print('helo');
  }
}

class Employee {
  bool isEmployee  = false;
}

class User extends PerSon with Spaceman, Employee {
  String email = "";
  User(String name, int age, this.email):super(name, age);
  
  @override
  prinInfo() {
    print('name: $name, age: $age, email: $email');
  }

  printSomething() {
    super.printSomething();
    print('xin chào');
  }
}

class Spaceman {
  bool isFlying = false;
  
  fly() {
    print('Flying');
  }
}

void main(List<String> args) {
  var user1 = User("loi", 20, "loinguyen050267@gmail.com");
  user1.prinInfo();
  user1.printSomething();
  user1.fly();
  print(user1.isEmployee);
}