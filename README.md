# Shoes Shop - Hệ thống bán giày online

## 📋 Mô tả dự án

Shoes Shop là một hệ thống e-commerce chuyên về bán giày thể thao các thương hiệu nổi tiếng như Adidas, Nike, Skechers, Converse. Hệ thống được xây dựng với kiến trúc MVC, hỗ trợ đa vai trò người dùng và tích hợp nhiều tính năng hiện đại như thanh toán online, chatbot, và quản lý đơn hàng.

### 🎯 Tính năng chính
- **Hệ thống đa vai trò**: Admin và Customer
- **Quản lý sản phẩm**: CRUD đầy đủ với quản lý hình ảnh
- **Giỏ hàng & Thanh toán**: Tích hợp VNPay
- **Đánh giá sản phẩm**: Hệ thống rating và comment
- **Chatbot**: Tích hợp Dialogflow
- **Thống kê**: Báo cáo bán hàng chi tiết
- **Quản lý tài khoản**: Profile, đổi mật khẩu, quên mật khẩu
- **Tìm kiếm AJAX**: Tìm kiếm sản phẩm real-time

## 🛠️ Công nghệ sử dụng

### Backend
- **Java Servlet/JSP**
- **Microsoft SQL Server**
- **Apache Ant** (Build tool)

### Frontend
- **HTML5, CSS3, JavaScript**
- **Bootstrap 4**
- **jQuery**
- **AJAX**

### Database
- **Microsoft SQL Server 2019+**
- **JDBC Driver**

### Third-party Integrations
- **VNPay Payment Gateway**
- **Dialogflow Chatbot**

## 📦 Cài đặt và chạy dự án

### Yêu cầu hệ thống
- **Java JDK 8+**
- **Apache Tomcat 9+**
- **Microsoft SQL Server 2019+**
- **NetBeans IDE** (khuyến nghị)

### Bước 1: Clone repository
```bash
git clone <repository-url>
cd ShoesShop
```

### Bước 2: Cấu hình Database
1. Mở Microsoft SQL Server Management Studio
2. Tạo database mới tên `Project`
3. Chạy script SQL từ file `project.sql`
4. Cập nhật thông tin kết nối trong `DBContext.java`:
   ```java
   String url = "jdbc:sqlserver://localhost:1433;databaseName=Project";
   String username = "sa";
   String password = "123";
   ```

### Bước 3: Cấu hình NetBeans
1. Mở NetBeans IDE
2. Import project từ thư mục `Project_PRJ301`
3. Cấu hình Tomcat Server
4. Thêm thư viện JDBC vào project

### Bước 4: Chạy ứng dụng
1. Clean and Build project
2. Deploy lên Tomcat Server
3. Truy cập: `http://localhost:8080/Project_PRJ301`

## 👥 Hệ thống vai trò

### 🔐 Admin (isAdmin = 1)
- Quản lý toàn bộ hệ thống
- CRUD sản phẩm và danh mục
- Quản lý tài khoản người dùng
- Quản lý đơn hàng
- Thống kê bán hàng
- Quản lý comment và đánh giá

### 👤 Customer (isAdmin = 0)
- Mua sắm sản phẩm
- Quản lý giỏ hàng
- Đặt hàng và thanh toán
- Đánh giá và comment sản phẩm
- Quản lý profile cá nhân
- Xem lịch sử đơn hàng

## 📁 Cấu trúc dự án

```
Project_PRJ301/
├── src/
│   └── java/
│       ├── controller/     # Servlet controllers
│       ├── dal/           # Data Access Layer
│       ├── model/         # Entity classes
│       └── com/           # Utility classes
├── web/
│   ├── css/              # Stylesheets
│   ├── js/               # JavaScript files
│   ├── img/              # Product images
│   ├── assets/           # External assets
│   ├── *.jsp             # JSP pages
│   └── WEB-INF/          # Web configuration
├── build.xml             # Ant build file
└── nbproject/            # NetBeans project files
```

## 🗄️ Database Schema

### Bảng chính
- **Account**: Thông tin tài khoản người dùng
- **Product**: Sản phẩm giày với thông tin chi tiết
- **Category**: Danh mục sản phẩm (Adidas, Nike, Skechers, Converse)
- **Order/OrderLine**: Đơn hàng và chi tiết đơn hàng
- **Comment**: Đánh giá và bình luận sản phẩm
- **Cart**: Giỏ hàng tạm thời

### Dữ liệu mẫu
- **20 sản phẩm** từ 4 thương hiệu chính
- **6 tài khoản** mẫu (1 admin, 5 customer)
- **24 đơn hàng** mẫu với dữ liệu thống kê
- **Comment và đánh giá** cho các sản phẩm

## 🚀 Tính năng nổi bật

### 🛍️ Trải nghiệm mua sắm
- **Trang chủ đa dạng**: Sản phẩm bán chạy, mới, giá tốt, đại hạ giá
- **Tìm kiếm thông minh**: AJAX search real-time
- **Giỏ hàng linh hoạt**: Thêm, sửa, xóa sản phẩm
- **Thanh toán an toàn**: Tích hợp VNPay
- **Đánh giá sản phẩm**: Rating và comment chi tiết

### 📊 Quản lý admin
- **Dashboard thống kê**: 4 loại báo cáo khác nhau
- **Quản lý sản phẩm**: CRUD đầy đủ với hình ảnh
- **Quản lý đơn hàng**: Xem, sửa, xóa đơn hàng
- **Quản lý tài khoản**: Block/unblock, edit profile
- **Quản lý comment**: Duyệt và xóa comment

### 🔒 Bảo mật và UX
- **Session management**: Quản lý phiên đăng nhập
- **Input validation**: Validate dữ liệu đầu vào
- **Responsive design**: Tương thích mọi thiết bị
- **User-friendly**: Giao diện thân thiện

## 🎨 Giao diện

### Trang chủ
- Banner quảng cáo
- 4 section sản phẩm: Bán chạy, Mới, Giá tốt, Đại hạ giá
- Sidebar danh mục sản phẩm
- Chatbot hỗ trợ

### Trang sản phẩm
- Hiển thị chi tiết sản phẩm
- Hình ảnh sản phẩm
- Thông tin giá và đánh giá
- Section comment và rating
- Nút thêm vào giỏ hàng

### Trang quản lý
- Dashboard thống kê
- Bảng quản lý sản phẩm
- Quản lý đơn hàng
- Quản lý tài khoản người dùng

## 🔧 Cấu hình thanh toán VNPay

1. Đăng ký tài khoản VNPay Merchant
2. Cập nhật thông tin trong các file VNPay:
   - `vnpay_pay.jsp`
   - `vnpay_return.jsp`
   - `CheckoutServlet.java`

## 🤖 Cấu hình Chatbot

1. Tạo project Dialogflow
2. Cập nhật Agent ID trong `home.jsp`:
   ```html
   <df-messenger
       agent-id="YOUR_AGENT_ID"
       language-code="vi">
   </df-messenger>
   ```

## 📈 Thống kê và báo cáo

### 4 loại báo cáo
1. **Thống kê tổng quan**: Doanh thu, đơn hàng, sản phẩm
2. **Thống kê theo thời gian**: Biểu đồ theo ngày/tháng
3. **Thống kê sản phẩm**: Sản phẩm bán chạy nhất
4. **Thống kê khách hàng**: Top khách hàng mua nhiều

## 🛠️ Tính năng kỹ thuật

### AJAX Implementation
- Tìm kiếm sản phẩm real-time
- Load dữ liệu không reload trang
- Cập nhật giỏ hàng động

### Session Management
- Quản lý đăng nhập/đăng xuất
- Bảo vệ trang admin
- Lưu trữ giỏ hàng tạm thời

### File Upload
- Upload hình ảnh sản phẩm
- Upload avatar người dùng
- Quản lý file trong thư mục img/

## 📝 License

Dự án được phát triển cho mục đích học tập và nghiên cứu.

## 🤝 Đóng góp

1. Fork dự án
2. Tạo feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Tạo Pull Request

## 📞 Liên hệ

- **Email**: bapthom3@gmail.com
- **Project Link**: [https://github.com/your-username/ShoesShop](https://github.com/your-username/ShoesShop)

---

⭐ Nếu dự án này hữu ích, hãy cho chúng tôi một star! 