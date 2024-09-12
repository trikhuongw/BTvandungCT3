import 'dart:io';

String encode(String input) {
  String result = ""; // Biến lưu trữ kết quả sau khi mã hóa
  int count = 1; // Biến đếm số lần xuất hiện liên tiếp của các chữ số
  for (int i = 1; i < input.length; i++) {
    if (input[i] == input[i - 1]) { // Nếu chữ số hiện tại giống chữ số trước đó
      count++; // Tăng biến đếm
    } else {
      result += count.toString() + input[i - 1]; // Thêm số lần xuất hiện và chữ số vào kết quả
      count = 1; // Đặt lại biến đếm cho chữ số tiếp theo
    }
  }
  result += count.toString() + input[input.length - 1]; // Thêm chữ số cuối cùng và số lần xuất hiện
  return result; // Trả về chuỗi mã hóa
}

// Hàm thử nghiệm tìm số ban đầu M cho một số N
String findM(String N) {
  // Bắt đầu với một số và mã hóa cho đến khi có thể đạt được N
  String current = "1";
  int iterations = 0; // Đếm số lần mã hóa để tránh vòng lặp vô hạn

  while (iterations < 100) { // Giới hạn số lần lặp để tránh vòng lặp vô hạn
    if (encode(current) == N) {
      return current; // Trả về số M nếu mã hóa đúng
    }
    current = encode(current); // Cập nhật giá trị hiện tại
    iterations++; // Tăng số lần lặp
  }

  return "Không tìm thấy M"; // Trả về thông báo nếu không tìm thấy
}

void main() {
  // Nhập số N từ bàn phím
  print("Nhập vào số N:");
  String? N = stdin.readLineSync(); // Đọc chuỗi từ bàn phím (cho phép null)

  if (N != null && N.isNotEmpty) { // Kiểm tra N không null và không rỗng
    // Tìm số M tương ứng
    String M = findM(N);
    // In kết quả
    print("Số M là: $M");
  } else {
    print("Dữ liệu nhập không hợp lệ."); // Thông báo lỗi nếu N là null hoặc rỗng
  }
}
