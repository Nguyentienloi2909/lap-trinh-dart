
import 'dart:io';

abstract class LaoDong {
  String _masv = '';
  String _HoTen = '';
  int _ngay = 0;
  int  _thang = 0;
  int _nam = 0;
  String _loaiHP = '';

  void Nhap(){
    stdout.write('Nhập mã nhân viên: ');
    _masv = stdin.readLineSync()!;
    stdout.write('Nhập họ và tên: ');
    _HoTen = stdin.readLineSync()!;
    stdout.write('Nhập ngày: ');
    _ngay = int.parse(stdin.readLineSync()!);
    stdout.write('Nhập thang: ');
    _thang = int.parse(stdin.readLineSync()!);
    stdout.write('Nhập năm: ');
    _nam = int.parse(stdin.readLineSync()!);
    stdout.write('Nhập loại hợp đồng: ');
    _loaiHP = stdin.readLineSync()!;
  }

  TinhLuong();

  String show(){
    return('$_masv  $_HoTen  ${_ngay}/${_thang}/${_nam}  $_loaiHP' );
  }
}

bool checkPerson(LaoDong a, LaoDong b){
  if((a._HoTen).compareTo(b._HoTen)>0){
    return true;
  }
  return false;
}


class LDThoiVu extends LaoDong {
  double _TienLuongNC = 0;
  double _soNgayCong = 0;
  
  void nhap(){
    super.Nhap();
    stdout.write('Nhập tiền lương ngày công: ');
    _TienLuongNC = double.parse(stdin.readLineSync()!);
    stdout.write('Nhập số ngày công: ');
    _soNgayCong = double.parse(stdin.readLineSync()!);
  }

  @override
  double TinhLuong() {
    if (_soNgayCong >= 25){
      return _soNgayCong * _TienLuongNC + 1000000;
    }
    return _soNgayCong * _TienLuongNC;
  }

  void xuat(){
    print( '${super.show()}  $_TienLuongNC  $_soNgayCong  ${TinhLuong()}');
  }
}

class NVChinhThuc extends LaoDong {
  num _heSoLuong = 0;
  String _ChucVu = '';
  
  void nhap(){
    super.Nhap();
    stdout.write('Nhập hệ số lương: ');
    _heSoLuong = num.parse(stdin.readLineSync()!);
    stdout.write('Chức vụ: ');
    while (true){
      _ChucVu = stdin.readLineSync()!;
      if (_ChucVu.toUpperCase() == "NHÂN VIÊN" || _ChucVu.toUpperCase() == "NHAN VIEN" || _ChucVu.toUpperCase() == "PHÓ PHÒNG"
      || _ChucVu.toUpperCase() == 'PHO PHONG' || _ChucVu.toUpperCase() == 'TRƯỞNG PHÒNG' || _ChucVu.toUpperCase() =='TRUONG PHONG'){
        break;
      }
      print('Chức vụ chỉ bao gồm: nhan vien, pho phong, truong phong');

    }
  }
  

  @override
  double TinhLuong() {
    if (_ChucVu.toUpperCase() == 'NHÂN VIÊN' || _ChucVu.toUpperCase() == 'NHAN VIEN'){
      return (1500000 * _heSoLuong + 500000);
    }
    else if(_ChucVu.toUpperCase() == 'PHÓ PHÒNG' || _ChucVu.toUpperCase() == 'PHO PHONG'){
      return (1500000 * _heSoLuong + 700000);
    }
    else if(_ChucVu.toUpperCase() == 'TRƯỞNG PHÒNG' || _ChucVu.toUpperCase() == 'TRUONG PHONG'){
      return (1500000 * _heSoLuong + 1000000);
    }
    return 0;
  }

  void xuat(){
    print(super.show() + '  $_heSoLuong  ${TinhLuong()}');
  }
}

void sapxep(List<LaoDong> a, int n){
  for(int i =0 ; i<n-1; i++){
    for(int j =i+1; j<n; j++){
      if(checkPerson(a[i], a[j])){
        var tamp = a[i];
        a[i] = a[j];
        a[j] = tamp;
      }
    }
  }
}

void main(List<String> args) {
  int a= 0, n =0, n1 = 0;
  List <LDThoiVu> LDTV = [];
  List <NVChinhThuc> NVCT = [];
  do {
    print('\n1. Nhập Lao Động Thời Vụ');
    print('2. Nhập Lao Động Chính Thức');
    print('3. Xuất Thông Tin Các Lao Động Trong Công Ty');
    print('4. Thống Kê Các Lao Động Theo Từng Loại Hợp Đồng');
    print('5. Sắp Xếp Danh Sách Lao Động Theo Tên');
    print('0. Thoát');

    stdout.write('\nMời Nhập Lựa Chọn: ');
    a = int.parse(stdin.readLineSync()!);

    switch (a) {
      case 1:
        stdout.write('Nhập số lượng lao động thời vụ: ');
        n = int.parse(stdin.readLineSync()!);
        for (int i = 0; i<n; i++){
          print('');
          var ldtv = LDThoiVu();
          ldtv.nhap();
          LDTV.add(ldtv);      
        }
        break;
      case 2:
        stdout.write('Nhập số lượng lao động chinh thuc: ');
        n1 = int.parse(stdin.readLineSync()!);
        for (int i = 0; i<n1; i++){
          print('');
          var ldct = NVChinhThuc();
          ldct.nhap();
          NVCT.add(ldct);       
        }
        break;
      case 3:
        for(int i = 0; i < n; i++){
          LDTV[i].xuat();
        }
        for(int i = 0; i < n1; i++){
          NVCT[i].xuat();
        }
        break;
      case 4:
        
        break;
      case 5:
        
        break;
      case 0:
        break;
      default:
        print('Nhập Khônng chính xác! vui lòng nhập lại');
    }
  }while(a != 0);
}