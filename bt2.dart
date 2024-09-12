import "dart:io";

void main() {
  //Nhập dữ liệu
  print('Nhập số nguyên dương a: ');
  int a = int.parse(stdin.readLineSync()!);

  print('Nhập số nguyên dương b: ');
  int b = int.parse(stdin.readLineSync()!);

  //Khởi tạo biến đếm và tổng
  int count = 0;
  int sum = 0;

  //Duyệt và kiểm tra
  for (var i = a; i <= b; i++) {
    if (i % 2 == 0 && i % 3 == 0) {
      count++;
      sum += i;
    }
  }

  //Kết quả
  print('số lượng số chẵn chia hết cho 3 trong đoạn [$a; $b] là: $count');
  print('Tổng của chúng là: $sum');
}

