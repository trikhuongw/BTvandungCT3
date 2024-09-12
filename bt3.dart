import 'dart:io';

int giaiThua(int n) {
  if (n == 0 || n == 1) {
    return 1;
  } else {
    return n * giaiThua(n - 1);
  }
}

int fibonacci(int n) {
  if (n <= 1) {
    return n;
  } else {
    return fibonacci(n - 1) + fibonacci(n - 2);
  }
}

bool isPrime(int n) {
  if (n <= 1) {
    return false;
  }
  if (n <= 3) {
    return true;
  }
  if (n % 2 == 0 || n % 3 == 0) {
    return false;
  }
  for (var i = 5; i * i <= n; i += 6) {
    if (n % i == 0 || n % (i + 2) == 0) {
      return false;
    }
  }
  return true;
}

void main() {
  print('Nhập số lượng phần tử của dãy: ');
  int n = int.parse(stdin.readLineSync()!);

  // List<int> numbers = [];
  // print('Nhập các phần tử của dãy: ');
  //
  // for (int i = 0; i < n; i++) {
  //   numbers.add(int.parse(stdin.readLineSync()!));
  // }
  print('Nhập các phần tử của dãy (cách nhau bởi dấu phẩy): ');
  String input = stdin.readLineSync()!;
  List<String> numbersStr = input.split(',');

  List<int> numbers = [];
  for (String numberStr in numbersStr) {
    try {
      int number = int.parse(numberStr.trim());
      numbers.add(number);
    } catch (e) {
      print('Lỗi: $e');
    }

    //Sắp xếp giảm dần
    numbers.sort((a, b) => b - a);

    if (numbers.length < 2) {
      print('NO');
    } else {
      int soThu2LonNhat = numbers[1];
      print('Số thứ hai lớn nhất là: $soThu2LonNhat');

      //Kiểm tra tính chất
      print('Số lớn thứ hai là số ${soThu2LonNhat % 2 == 0 ? 'Chẳn' : 'lẻ'}');
      print(
          'Số lơn thứ hai ${isPrime(soThu2LonNhat)
              ? 'là'
              : 'không phải là'} số nguyên tố');
      print('Giai thừa của số lớn thứ hai là: ${giaiThua(soThu2LonNhat)}');
      print(
          'Số Fibonacci thứ ${soThu2LonNhat} là: ${fibonacci(soThu2LonNhat)}');
    }
  }
}



