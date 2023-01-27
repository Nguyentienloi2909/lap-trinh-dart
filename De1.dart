import 'dart:io';

class PerSon{
  String _HoDem = '';
  String _Ten = '';
  int _ngay = 0;
  int _thang = 0;
  int _nam = 0;

  void nhap(){
    stdout.write('Nhập Họ Đệm: ');
    this._HoDem = stdin.readLineSync()!;
    stdout.write('Nhập Tên: ');
    this._Ten = stdin.readLineSync()!;
    stdout.write('Nhập Ngay Tháng Năm: ');
    this._ngay = int.parse(stdin.readLineSync()!);
    this._thang = int.parse(stdin.readLineSync()!);
    this._nam = int.parse(stdin.readLineSync()!);
  }

  void show(){
    print('${this._HoDem}\t ${this._Ten}\t ${this._ngay}/ ${this._thang}/ ${this._nam}');
  }
}

void main(List<String> args) {
  var a = PerSon();
  a.nhap();
  a.show();
}