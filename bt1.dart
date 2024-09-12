// import 'dart:io';
//
// String encode(String input) {
//   String result = '';
//   int count = 1;
//   for (var i = 1; i < input.length; i++) {
//     if (input[i] == input[i - 1]) {
//       count++;
//     } else {
//       result += count.toString() + input[i - 1];
//       count = 1;
//     }
//   }
//   result += count.toString() + input[input.length - 1];
//   return result;
// }
//
// // Tim so M ban dau sinh ra so N
// String findM(String N) {
//   String start = "1"; //Gia tri bat dau nho nhat co the cua M
//   while (encode(start) != N) {
//     start = encode(start);
//   }
//   return start; //Tra lai M ban dau
// }
//
// void main() {
//   print('Nhập vào số N:');
//   String? N = stdin.readLineSync(); //nhap du lieu N tu ban phim
//   if (N != null && N.isNotEmpty) {
//     String M = findM(N);
//     print('Kết quả số M là: $M');
//   } else {
//     print('Dữ liệu không hợp lệ');
//   }
// }

import 'dart:io';

// Function to encode a number based on the "look-and-say" process
String encode(String input) {
  String result = "";
  int count = 1;
  for (int i = 1; i < input.length; i++) {
    if (input[i] == input[i - 1]) {
      count++;
    } else {
      result += count.toString() + input[i - 1];
      count = 1;
    }
  }
  result += count.toString() + input[input.length - 1];
  return result;
}

// Function to find the initial number M that generated N
String findM(String N) {
  String current = "1"; // Start with "1", as the smallest possible initial value of M

  while (encode(current) != N) {
    current = encode(current); // Keep applying the encoding process
  }

  return current; // Return the original M
}

void main() {
  // Input number N
  print("Enter number N:");
  String N = stdin.readLineSync()!;

  // Find the corresponding M
  String M = findM(N);

  // Output the result
  print("The number M is: $M");
}

