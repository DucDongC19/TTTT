-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 20, 2024 lúc 02:11 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qlbanhang1`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `avatar` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `avatar`) VALUES
(5, 'admin', 'admin@gmail.com', '4297f44b13955235245b2497399d7a93', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `order_link` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `banner`
--

INSERT INTO `banner` (`id`, `name`, `image`, `link`, `order_link`, `status`) VALUES
(33, '', '1718885000gian-be-p-x2-01.jpg.webp', '', 6, 1),
(34, '', '1718885121banner-web-up-02.jpg.webp', '', 7, 1),
(35, '', '1718885127banner-web-up-03.jpg.webp', '', 8, 1),
(36, '', '1718885132banner-web-up-04.jpg.webp', '', 9, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `parent` int(11) DEFAULT 0,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`, `parent`, `status`) VALUES
(1, 'Nội Thất Phòng Khách', 0, 1),
(2, 'Nội Thất Phòng Ngủ', 0, 1),
(3, 'Nội Thất Nhà Bếp', 0, 1),
(4, 'Nội Thất Phòng Trẻ Em', 0, 1),
(5, 'Nội Thất Phòng Làm Việc', 0, 1),
(7, 'Bàn trà, Kệ tivi,Kệ trang trí', 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`id`, `name`, `email`, `phone`, `address`, `password`, `birthday`, `gender`, `status`) VALUES
(27, 'voducdong', 'voducdong@gmail.com', '0941500445', 'an minh', '4297f44b13955235245b2497399d7a93', '2024-04-28', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `fullname` varchar(200) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(100) NOT NULL,
  `object` varchar(100) NOT NULL,
  `resquest` varchar(500) NOT NULL,
  `createad` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `payment_method` varchar(100) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `request` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

CREATE TABLE `order_detail` (
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `quantity` int(11) DEFAULT 0,
  `id` int(11) NOT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `price` float DEFAULT 0,
  `sale_price` float DEFAULT 0,
  `created` datetime DEFAULT current_timestamp(),
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `image`, `content`, `price`, `sale_price`, `created`, `status`) VALUES
(106, 1, ' Bộ sofa BSF140', '17188782091.webp', '<p><strong>Mô tả</strong></p>\r\n<p>Bộ sofa BSF140 cao cấp nhập khẩu</p>\r\n<p> </p>\r\n<p>Đồ nội thất sang trọng tân cổ điển phong cách kiểu Ý nhẹ nhàng sang trọng cao cấp dành cho phòng khách biệt thự cao cấp với chất liệu bằng da Bentley đơn giản và sơn bóng Piano kèm nẹp Inox mạ titan vàng hồng.</p>\r\n<p> </p>\r\n<p>Chi tiết:</p>\r\n<p>Kích thước: Băng 1: 110 x 93 x 77  | Băng 2: 167 x 93 x 77  | Băng 3: 224 x 93 x 77 cm</p>\r\n<p>Chất liệu : Da bò cao cấp </p>\r\n<p>Xuất xứ: Trung Quốc</p>\r\n<p>——————————</p>\r\n<p> </p>\r\n<p>Giá Bán: gồm Ghế băng 1+2+3 chỗ ngồi ( có thể chọn từng sản phẩm, chất liệu, size cho phù hợp không gian nhà bạn)</p>\r\n<p>Băng 1: giá : 60.000.000vnđ</p>\r\n<p>Băng 2: giá : 70.000.000vnđ</p>\r\n<p>Băng 3 chỗ: 90.000.000vnđ</p>\r\n<p>Bàn Sofa: 35.000.000vnđ</p>\r\n<p>Tủ Tivi: 40.000.000vnđ</p>\r\n<p>Bàn sofa nhỏ: 24.000.000vnđ</p>\r\n<p>Liên hệ: 0932128803 để được giá tốt</p>\r\n<p>——————————</p>\r\n<p> </p>\r\n<p>Bảo Hành:</p>\r\n<p>Khung gỗ: 10 năm</p>\r\n<p>Đệm mút: 3 năm</p>\r\n<p>Bề mặt da: 1 năm</p>\r\n<p>Miễn phí vận chuyển nội thành</p>\r\n<p> </p>', 65000000, 60000000, '2024-06-20 17:10:09', 1),
(107, 1, 'Bộ sofa BSF143', '17188794272.jpg', '<span>Mô tả</span><br><span>Bộ sofa BSF143 cao cấp nhập khẩu</span><br><br><span>Bộ sofa sang trọng phong cách kiểu Italy nhẹ nhàng sang trọng cao cấp dành cho phòng khách biệt thự cao cấp với chất liệu bằng da chân sắt sơn đen.</span><br><br><span>Chi tiết:</span><br><span>Kích thước: Băng 1: 110 x 93 x 77 | Băng 2: 167 x 93 x 77 | Băng 3: 224 x 93 x 77 cm</span><br><span>Chất liệu : Da bò tiếp xúc cao cấp</span><br><span>Xuất xứ: Trung Quốc</span><br><span>——————————</span><br><br><span>Giá Bán: có thể chọn từng sản phẩm, chất liệu, size, màu sắc cho phù hợp không gian nhà bạn</span><br><span>Băng 1: giá : 22.000.000vnđ</span><br><span>Băng 2: giá : 28.000.000vnđ</span><br><span>Băng 3 chỗ: 38.000.000vnđ</span><br><span>Bàn Sofa: 18.000.000vnđ</span><br><span>——————————</span><br><br><span>Bảo Hành:</span><br><span>Khung gỗ: 10 năm</span><br><span>Đệm mút: 3 năm</span><br><span>Bề mặt da: 1 năm</span><br><span>Miễn phí vận chuyển nội thành</span>', 22000000, 18000000, '2024-06-20 17:30:27', 1),
(108, 1, 'Bộ sofa BSF158', '17188796443.jpg', 'Mô tả<br>Bộ sofa BSF158 cao cấp nhập khẩu<br><br>Bộ sofa da sang trọng phong cách kiểu Mỹ nhẹ nhàng sang trọng cao cấp dành cho phòng khách cao cấp với chất liệu bằng da chân, viền inox mạ titan vàng.', 19000000, 17000000, '2024-06-20 17:34:04', 1),
(109, 1, 'Bộ Sofa da bò BSF197', '17188797934.jpeg', 'Mô tả<br>Bộ Sofa da bò màu xanh và gỗ sơn bóng piano nhập khẩu caoBSF191<br><br>Chi tiết:<br>Băng 1: 117 x 105 x 78 | Băng 2: 176 x 105 x 78 | Băng 3: 236 x 105 x 78 cm<br>Chất liệu : da bò , gỗ sơn bóng piano, nẹp inox mạ vàng <br>Xuất xứ: Trung Quốc<br>——————————<br><br>Giá Bán: có thể chọn từng sản phẩm, chất liệu, size, màu sắc cho phù hợp không gian nhà bạn<br>Băng : giá : 15000000vnđ<br>Bàn Sofa : 10000000đ<br>——————————<br><br>Bảo Hành:<br>Khung gỗ: 05 năm<br>Đệm mút: 03 năm<br>Bề mặt da: 01 năm<br>Miễn phí vận chuyển nội thành', 25000000, 24000000, '2024-06-20 17:36:33', 1),
(110, 1, 'Bộ sofa da bò cao cấp nhập khẩu BSF181', '17188799685.jpeg', 'Mô tả<br>Bộ sofa da bò cao cấp nhập khẩu BSF181<br><br>Chi tiết:<br><br>Băng 1: 130 x100 x 78 | Băng 2: 178 x100 x 78 | Băng 3: 228 x100 x 78 cm<br>Chất liệu : Da bò tiếp xúc<br>Xuất xứ: Trung Quốc<br>——————————<br><br>Giá Bán: có thể chọn từng sản phẩm, chất liệu, size, màu sắc cho phù hợp không gian nhà bạn<br><br>Băng 1: giá : ...vnđ<br>Băng 2: giá : ...vnđ<br>Băng 3 chỗ: ...vnđ<br>Bàn Sofa : ...đ<br>——————————<br><br>Bảo Hành:<br><br>Khung gỗ: 05 năm<br>Đệm mút: 03 năm<br>Bề mặt da: 01 năm<br>Miễn phí vận chuyển nội thành', 20000000, 19000000, '2024-06-20 17:39:28', 1),
(111, 2, 'Giường ngủ GN0023', '17188801331.webp', 'Mô tả<br>GIƯỜNG NGỦ GN0023 nhập khẩu hiện đại, đẹp, giá tốt<br><br>Chi tiết:<br>Giường ngủ size: 180 x 200cm giá 29.000.000vnđ<br>Giường ngủ size: 150 x 200 cm giá 29.000.000vnđ<br>(Chỉ giường không bao gồm nệm)<br><br>Chất liệu khung: Gỗ thông, Bọc da công nghiệp, chân thếp mạ vàng<br>Màu sắc: Xám nhạt (màu sắc có thể thay đổi cho phù hợp không gian nhà bạn)<br>Tủ đầu giường: 5.500.000vnđ<br>Xuất xứ: Trung Quốc<br>——————————<br><br>Bảo Hành: 12 tháng<br>Miễn phí vận chuyển nội thành', 29000000, 23800000, '2024-06-20 17:42:13', 1),
(112, 2, 'Giường ngủ bọc da GN007', '17188802952.jpg', 'Mô tả<br>Giường ngủ GN039 nhập khẩu cao cấp <br><br>Chi tiết:<br>Chất liệu: Khung inox mạ titan vàng, Bọc da công nghiệp/ Da Bò tiếp xúc , Có đèn led gầm giường<br><br>Kích Thước: <br>Size: 180*200cm giá 40.500.000đ /46.500.000đ<br>Tủ đầu giường: size 50*50*55cm giá ...đ/cái<br>Size, màu sắc, chất liệu có thể thay đổi<br><br>——————————<br>Bảo Hành: 12 tháng<br>Miễn phí vận chuyển nội thành', 28800000, 24000000, '2024-06-20 17:44:55', 1),
(113, 2, 'Giường ngủ GN039', '17188803713.jpeg', '', 40000000, 33000000, '2024-06-20 17:46:11', 1),
(114, 2, 'Giường ngủ GN037', '17188805154.webp', 'Mô tả<br>Giường ngủ GN037 nhập khẩu cao cấp <br><br>Chi tiết:<br>Chất liệu: Khung inox mạ titan vàng, Bọc da công nghiệp/ Da Bò tiếp xúc , Có đèn led gầm giường<br><br>Kích Thước: <br>Size: 180*200cm giá 40.500.000đ /46.500.000đ<br>Tủ đầu giường: size 50*50*55cm giá ...đ/cái<br>Size, màu sắc, chất liệu có thể thay đổi<br><br>——————————<br>Bảo Hành: 12 tháng<br>Miễn phí vận chuyển nội thành', 40000000, 34000000, '2024-06-20 17:48:35', 1),
(115, 3, 'Bàn ăn mặt đá nhập khẩu cao cấp BA0164', '17188810141.jpeg', 'Mô tả<br>Bàn ăn mặt đá nhập khẩu cao cấp BA0162<br><br>Chi tiết:<br>Kích thước: 160*90*75cm <br>Chất liệu : mặt đá marble nhân tạo, chân bọc da , viền inox mạ titan vàng<br>Xuất xứ: Trung Quốc<br>——————————<br><br>Giá Bán: Có thể chọn từng sản phẩm. chất liệu, size, màu sắc có thể thay đổi cho phù hợp không gian nhà bạn<br>Bàn ăn giá : 28.900.000vnđ<br>Ghế ăn giá : 3.500.000vnđ/cái<br><br>——————————<br>Bảo Hành: 12 tháng<br>Miễn phí vận chuyển nội thành', 18900000, 18900000, '2024-06-20 17:56:54', 1),
(116, 3, ' Bàn ăn mặt đá nhập khẩu cao cấp BA0163', '17188811462.jpeg', '', 28000000, 22000000, '2024-06-20 17:59:06', 1),
(117, 3, ' Bàn ăn nhập khẩu sơn bóng Piano BA0161', '17188812523.jpeg', '', 69000000, 48900000, '2024-06-20 18:00:52', 1),
(118, 7, 'Bàn trà, Kệ tivi KTV004', '17188814351.jpg', 'Mô tả<br>BÀN TRÀ, KỆ TIVI KTV004.<br><br>Chi tiết:<br>Kích thước: Kệ tivi : 200*40*45cm <br>Chất liệu : mặt đá marble nhân tạo/kiếng cường lực, khung inox mạ titan vàng <br>Xuất xứ: Trung Quốc<br>——————————<br><br>Giá Bán: có thể chọn từng sản phẩm, chất liệu, size, màu sắc cho phù hợp không gian nhà bạn<br>Kệ Tivi giá : 22.000.000vnđ<br>Bàn sofa giá : 18.000.000vnđ<br>Bàn sofa: 8.000.000vnđ<br><br>——————————<br>Bảo Hành: 12 tháng<br>Miễn phí vận chuyển nội thành', 24000000, 22000000, '2024-06-20 18:03:55', 1),
(119, 7, 'Bàn trà, Kệ Tivi KTV166', '17188816022.jpeg', 'Mô tả<br>Bàn trà, Kệ Tivi nhập khẩu cao cấp KTV166<br><br>Chi tiết:<br>Kích thước: Kệ tivi : 200*40*42cm <br>Bàn Sofa BSF166: 130x70x42cm <br>Chất liệu : mặt đá nhân tạo, khung inox mạ titan vàng.<br>Xuất xứ: Trung Quốc<br>——————————<br><br>Giá Bán: <br><br>Kệ Tivi KTV166 : 26.000.000vnđ<br>Bàn Sofa BSF166: 20.000.000vnđ<br>Có thể chọn từng sản phẩm, chất liệu, size, màu sắc cho phù hợp không gian nhà bạn<br><br>——————————<br>Bảo Hành: 12 tháng <br>Miễn phí vận chuyển nội thành<br>Lưu ý: vệ sinh inox mạ không dùng hoá chất tẩy rửa', 26000000, 24000000, '2024-06-20 18:06:42', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pro_img`
--

CREATE TABLE `pro_img` (
  `id` int(11) NOT NULL,
  `link` varchar(200) DEFAULT NULL,
  `pro_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `pro_img`
--

INSERT INTO `pro_img` (`id`, `link`, `pro_id`) VALUES
(105, '17188782091.webp', 106),
(106, '17188782091.1.webp', 106),
(107, '17188782091.2.webp', 106),
(108, '17188782091.3.webp', 106),
(109, '17188782091.4.webp', 106),
(110, '17188794272.jpg', 107),
(111, '17188794272.1.webp', 107),
(112, '17188796443.jpg', 108),
(113, '17188796443.1.jpg', 108),
(114, '17188796443.2.webp', 108),
(115, '17188796443.3.webp', 108),
(116, '17188797934.jpeg', 109),
(117, '17188797934.1.jpeg', 109),
(118, '17188797934.2.jpeg', 109),
(119, '17188797934.3.webp', 109),
(120, '17188797934.4.webp', 109),
(121, '17188799685.jpeg', 110),
(122, '17188799685.1.webp', 110),
(123, '17188801331.webp', 111),
(124, '17188801331.1.webp', 111),
(125, '17188801331.2.webp', 111),
(126, '17188802952.jpg', 112),
(127, '17188802952.1.webp', 112),
(128, '17188803713.jpeg', 113),
(129, '17188803713.1.jpeg', 113),
(130, '17188803713.2.webp', 113),
(131, '17188805154.webp', 114),
(132, '17188805154.1.jpeg', 114),
(133, '17188805154.3.webp', 114),
(134, '17188805684.2.webp', 114),
(135, '17188810141.jpeg', 115),
(136, '17188810141.1.jpeg', 115),
(137, '17188810141.2.jpeg', 115),
(138, '17188810141.3.webp', 115),
(139, '17188811462.jpeg', 116),
(140, '17188811462.1.jpeg', 116),
(141, '17188811462.2.jpeg', 116),
(142, '17188811462.3.webp', 116),
(143, '17188812523.jpeg', 117),
(144, '17188812523.1.webp', 117),
(145, '17188812523.2.webp', 117),
(146, '17188814351.jpg', 118),
(147, '17188814351.1.webp', 118),
(148, '17188814351.2.webp', 118),
(149, '17188816022.jpeg', 119),
(150, '17188816022.1.webp', 119),
(151, '17188816022.2.webp', 119);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_orders_customer` (`customer_id`);

--
-- Chỉ mục cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_order_detail_orders` (`order_id`),
  ADD KEY `FK_order_detail_product` (`product_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_product_category` (`category_id`);

--
-- Chỉ mục cho bảng `pro_img`
--
ALTER TABLE `pro_img`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_pro_img_product` (`pro_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT cho bảng `pro_img`
--
ALTER TABLE `pro_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_orders_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

--
-- Các ràng buộc cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `FK_order_detail_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `FK_order_detail_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Các ràng buộc cho bảng `pro_img`
--
ALTER TABLE `pro_img`
  ADD CONSTRAINT `FK_pro_img_product` FOREIGN KEY (`pro_id`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
