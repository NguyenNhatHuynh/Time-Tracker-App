# Ứng Dụng Time Tracker ⏰
[![Flutter](https://img.shields.io/badge/Flutter-Framework-blue)](https://flutter.dev/) [![Dart](https://img.shields.io/badge/Dart-Language-blue)](https://dart.dev/)

Ứng dụng **"Time Tracker"** giúp người dùng theo dõi thời gian hiện tại, hẹn giờ, đếm ngược và sử dụng các chức năng khác như xem giờ các quốc gia trên thế giới, chuyển đổi giữa chế độ sáng và tối, v.v. Ứng dụng cung cấp giao diện người dùng thân thiện và dễ sử dụng.

## Mục Tiêu 🎯
- Hiển thị giờ hiện tại theo múi giờ của thiết bị.
- Đếm ngược và hẹn giờ với thông báo khi hết giờ.
- Hỗ trợ chế độ sáng và tối cho giao diện người dùng.
- Hiển thị giờ thực tế của các quốc gia trên thế giới.
- Cung cấp chức năng bấm giờ.

## Các Tính Năng Chính 🛠️
- **Hiển thị giờ hiện tại** 🕒: Hiển thị thời gian theo múi giờ thiết bị.
- **Đếm ngược** ⏳: Đếm ngược đến một thời gian đã thiết lập.
- **Hẹn giờ và thông báo** ⏰: Cung cấp tính năng hẹn giờ và gửi thông báo khi hết giờ.
- **Chế độ sáng/tối** 🌞🌜: Hỗ trợ người dùng chuyển đổi giữa chế độ sáng và tối.
- **Giờ thế giới** 🌍: Hiển thị thời gian thực của các quốc gia trên thế giới.
- **Chức năng bấm giờ** 🏁: Cung cấp đồng hồ bấm giờ cho các hoạt động.

## Cấu Trúc Dự Án 📁
Dự án sử dụng Flutter để phát triển ứng dụng di động với cấu trúc thư mục rõ ràng và dễ quản lý. Các phần chính trong dự án bao gồm:
- **models/**: Các mô hình dữ liệu (WorldTime).
- **screens/**: Các màn hình của ứng dụng (Home, Current Time, Countdown, Timer, World Clock, Stopwatch).
- **widgets/**: Các widget tùy chỉnh (TimeDisplay).
- **utils/**: Các tiện ích (ThemeManager).
- **providers/**: Quản lý trạng thái ứng dụng (ThemeProvider).

## Công Nghệ Sử Dụng ⚙️
- **Flutter**: Framework để phát triển ứng dụng di động.
- **Dart**: Ngôn ngữ lập trình.
- **Provider**: Quản lý trạng thái cho ứng dụng.
- **Shared Preferences**: Lưu trữ các tùy chọn chế độ sáng/tối và các cài đặt khác.

## Screenshots
<!-- <div style="display: flex; flex-wrap: wrap; gap: 20px; justify-content: center;">
    <img src="https://imgur.com/Y1Ms68J.png" alt="Image 1" style="width: 48%; height: auto; object-fit: cover; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);">
    <img src="https://imgur.com/0TqdjD3.png" alt="Image 2" style="width: 48%; height: auto; object-fit: cover; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);">
    <img src="https://imgur.com/39KTSP8.png" alt="Image 3" style="width: 48%; height: auto; object-fit: cover; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);">
    <img src="https://imgur.com/P35jNx3.png" alt="Image 4" style="width: 48%; height: auto; object-fit: cover; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);">
</div> -->

## Hướng Dẫn Cài Đặt 🛠️
### Điều Kiện
Đảm bảo bạn đã cài đặt những phần mềm sau trên máy của mình:
- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK: Included with Flutter
- Android Studio (for Android development)
- Visual Studio Code or any other IDE

1. Clone dự án về máy của bạn:
   ```bash
   git clone https://github.com/NguyenNhatHuynh/Time-Tracker-App.git
2. Chuyển đến thư mục dự án:
   ```bash
   cd Time-Tracker-App
3. Cài đặt các phụ thuộc:
   ```bash
   flutter pub get
4. Chạy ứng dụng:
   ```bash
   flutter run

## ✅ Todo
### Chức Năng Ứng Dụng
- [ ] Hiển thị giờ hiện tại: Hiển thị thời gian theo múi giờ thiết bị.
- [ ] Đếm ngược: Cho phép đếm ngược tới thời gian được thiết lập.
- [x] Hẹn giờ và thông báo: Tính năng hẹn giờ và gửi thông báo khi hết giờ.
- [ ] Chế độ sáng/tối: Chuyển đổi giữa chế độ sáng và tối.
- [ ] Giờ thế giới: Hiển thị giờ thực tế của các quốc gia trên thế giới.
- [ ] Chức năng bấm giờ: Cung cấp đồng hồ bấm giờ cho người dùng.

### Giao Diện Người Dùng
- [ ] Trang chủ: Hiển thị các chức năng chính và các thông tin hiện tại.
- [ ] Màn hình hiển thị giờ hiện tại: Hiển thị giờ theo múi giờ của thiết bị.
- [ ] Màn hình đếm ngược: Hiển thị đồng hồ đếm ngược và tính năng thông báo.
- [x] Màn hình hẹn giờ: Cho phép người dùng thiết lập thời gian hẹn giờ.
- [ ] Màn hình giờ thế giới: Hiển thị giờ các quốc gia khác nhau.
- [ ] Màn hình bấm giờ: Cung cấp đồng hồ bấm giờ.

## Tác giả 👨‍💻
Tôi sẽ rất cảm kích nếu bạn có thể cho kho lưu trữ này một ngôi sao 🌟. Nó sẽ giúp những người khác khám phá ra điều này. Cảm ơn vì sự hỗ trợ của bạn [Xoan Dev]👨‍💻
- [x] Status Project: Pending
