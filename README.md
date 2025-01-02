# Time Tracker App 🕰️
[![Flutter](https://img.shields.io/badge/Flutter-Framework-blue)](https://flutter.dev/) [![Dart](https://img.shields.io/badge/Dart-Language-blue)](https://dart.dev/)

Ứng dụng **"Time Tracker"** giúp người dùng quản lý thời gian với các tính năng như đồng hồ bấm giờ, đếm ngược, hẹn giờ và hiển thị giờ hiện tại. Ứng dụng cung cấp giao diện thân thiện, dễ sử dụng và hỗ trợ chế độ sáng/tối cho trải nghiệm người dùng tối ưu.

## Mục Tiêu 🎯
- Theo dõi và quản lý thời gian qua các tính năng đồng hồ bấm giờ, đếm ngược, hẹn giờ.
- Hiển thị giờ hiện tại và giờ thế giới của nhiều quốc gia.
- Cung cấp khả năng tùy chỉnh giao diện với chế độ sáng/tối.
- Giao diện đơn giản, dễ sử dụng cho người dùng mọi lứa tuổi.

## Các Tính Năng Chính 🛠️
- **Đồng hồ bấm giờ** ⏱️: Cho phép người dùng theo dõi thời gian thực tế.
- **Đếm ngược** ⏳: Đếm ngược thời gian từ một giá trị mà người dùng nhập vào.
- **Hẹn giờ** ⏲️: Cung cấp chức năng hẹn giờ cho các tác vụ.
- **Giờ hiện tại** 🕰️: Hiển thị giờ của người dùng tại thời điểm hiện tại.
- **Giờ thế giới** 🌍: Hiển thị giờ của các thành phố lớn trên thế giới.
- **Chế độ sáng/tối** 🌞🌜: Người dùng có thể chuyển đổi giữa chế độ sáng và chế độ tối theo sở thích cá nhân.

## Cấu Trúc Dự Án 📁
Dự án sử dụng Flutter để phát triển ứng dụng di động với cấu trúc thư mục rõ ràng và dễ quản lý. Các phần chính trong dự án bao gồm:
- **models/**: Các mô hình dữ liệu (WorldTime).
- **screens/**: Các màn hình của ứng dụng (Home, Current Time, Countdown, Timer, World Clock, Stopwatch).
- **widgets/**: Các widget tùy chỉnh (Time Display).
- **utils/**: Các tiện ích (Theme Manager).
- **providers/**: Quản lý trạng thái của ứng dụng (Theme Provider).

## Công Nghệ Sử Dụng ⚙️
- **Flutter**: Framework để phát triển ứng dụng di động.
- **Provider**: Quản lý trạng thái của ứng dụng (dark mode).
- **Shared Preferences**: Lưu trữ các thiết lập người dùng (chế độ sáng/tối).
- **Dart**: Ngôn ngữ lập trình cho ứng dụng.

## Screenshots
<div style="display: flex; flex-wrap: wrap; gap: 20px; justify-content: center;">
    <img src="https://imgur.com/Y1Ms68J.png" alt="Image 1" style="width: 48%; height: auto; object-fit: cover; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);">
    <img src="https://imgur.com/0TqdjD3.png" alt="Image 2" style="width: 48%; height: auto; object-fit: cover; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);">
    <img src="https://imgur.com/39KTSP8.png" alt="Image 3" style="width: 48%; height: auto; object-fit: cover; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);">
    <img src="https://imgur.com/P35jNx3.png" alt="Image 4" style="width: 48%; height: auto; object-fit: cover; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);">
</div>

## Hướng Dẫn Cài Đặt 🛠️
### Điều Kiện
Đảm bảo bạn đã cài đặt những phần mềm sau trên máy của mình:
- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK: Included with Flutter
- Android Studio (for Android development)
- Visual Studio Code or any other IDE

1. Clone dự án về máy của bạn:
   ```bash
   git clone https://github.com/username/time-tracker.git
