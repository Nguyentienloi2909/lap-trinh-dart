import 'dart:ffi';
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
    stdout.write('Nhập Ngày: ');
    this._ngay = int.parse(stdin.readLineSync()!);
    stdout.write('Nhập Tháng: ');
    this._thang = int.parse(stdin.readLineSync()!);
    stdout.write('Nhập Năm: ');
    this._nam = int.parse(stdin.readLineSync()!);
  }

  void show(){
    print('${this._HoDem}\t ${this._Ten}\t ${this._ngay}/ ${this._thang}/ ${this._nam}');
  }
}

class SinhVien extends PerSon{
  String _msv = '';
  num _avgDiem = 0.0;

  void nhap(){
    super.nhap();
    stdout.write('Nhập Ma Sinh Vien: ');
    this._msv = stdin.readLineSync()!;
    stdout.write('Diem Trung Binh: ');
    this._avgDiem = num.parse(stdin.readLineSync()!);
  }



  void show(){ 
    print('${super._HoDem}\t ${super._Ten}\t ${super._ngay}/${super._ngay}/${super._nam}\t ${this._msv}\t ${this._avgDiem}');
  }
  String MSV(){
    return this._msv;
  }

  num AVGDiem(){
    return this._avgDiem;
  }
}

void main(List<String> args) {
  stdout.write('Nhập số lượng phần tử: ');
  int n = int.parse(stdin.readLineSync()!);
  List <SinhVien> SV = [];
  for(int i = 0; i<n; i++){
    var a = SinhVien();
    a.nhap();
    SV.add(a);
  }

  for(int i = 0; i<n; i++){
    SV[i].show();
  }
}