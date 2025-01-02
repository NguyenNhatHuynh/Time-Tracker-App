Hiển thị giờ hiện tại (dựa trên múi giờ thiết bị)
Đếm ngược với thời gian được thiết lập.
Hẹn giờ và thông báo khi hết giờ.
Tùy chỉnh giao diện hiển thị (dark mode, light mode).
Hiện các thời gian thực của các quốc gia trên thế giới
Chức năng bấm giờ 





lib/
│
├── main.dart                    // Điểm bắt đầu của ứng dụng
├── screens/                     // Thư mục chứa các màn hình
│   ├── home_screen.dart         // Màn hình chính (Home)
│   ├── current_time_screen.dart // Hiển thị giờ hiện tại
│   ├── countdown_screen.dart    // Đếm ngược
│   ├── timer_screen.dart        // Hẹn giờ
│   ├── world_clock_screen.dart  // Giờ thế giới
│   ├── stopwatch_screen.dart    // Bấm giờ
│
├── widgets/                     // Thư mục chứa các widget tái sử dụng
│   ├── time_display.dart        // Widget hiển thị giờ
│
├── utils/                       // Thư mục chứa tiện ích
│   ├── theme_manager.dart       // Quản lý dark mode / light mode
│
├── models/                      // Thư mục chứa model (nếu cần)
│   ├── world_time.dart          // Model cho giờ thế giới
│
├── providers/                   // Thư mục chứa logic state (nếu dùng Provider)
│   ├── theme_provider.dart      // Quản lý trạng thái dark mode
│

