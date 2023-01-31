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

bool checkPerson(PerSon a, PerSon b){
  if(a._Ten == b._Ten){
    if((a._HoDem).compareTo(b._HoDem)>0){
      return true;
    }else{
      return false;
    }
  }
  else if((a._Ten).compareTo(b._Ten)>0){
    return true;
  }
  return false;
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

void sapxep(List <SinhVien> a, int n){
  for(int i = 0; i<n-1 ; i++){
    for(int j = i+1; j< n; j++){
      if(checkPerson(a[i], a[j])){
        dynamic tamp = a[i];
        a[i] = a[j];
        a[j] = tamp;
      }
    }
  }
}

num maxAvgDiem(List <SinhVien> a, int n){
  num max = 0;
  for(int i = 0; i<n; i++){
    if(a[i]._avgDiem > max)
      max = a[i]._avgDiem;
  }
  return max;
}


void hienthi(List <SinhVien> a, int n){
  for(int i = 0; i<n; i++){
    a[i].show();
  }
}

void main(List<String> args) {
  stdout.write('Nhập số lượng phần tử: ');
  int n = int.parse(stdin.readLineSync()!);
  List <SinhVien> SV = [];
  for(int i = 0; i<n; i++){
    print('');
    var a = SinhVien();
    a.nhap();
    SV.add(a);
  }
  print('Sinh viên vừa nhập là: ');
  hienthi(SV, n);
  sapxep(SV, n);
  print('\nhiển thị sinh viên theo tên và họ đệm tăng dần: ');
  print('');
  hienthi(SV, n);
  print('\nsinh vien có điểm trung bình cao nhất:');
  num b = maxAvgDiem( SV, n);
  for(int i =0; i<n; i++){
    if(SV[i]._avgDiem == b)
      SV[i].show();
  }
}