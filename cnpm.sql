/*
 Navicat Premium Data Transfer

 Source Server         : cnpm
 Source Server Type    : MySQL
 Source Server Version : 100427 (10.4.27-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : cnpm

 Target Server Type    : MySQL
 Target Server Version : 100427 (10.4.27-MariaDB)
 File Encoding         : 65001

 Date: 25/04/2023 12:59:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `district` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `user_id` int NOT NULL,
  `cart_detail_id` int NOT NULL,
  PRIMARY KEY (`user_id`, `cart_detail_id`) USING BTREE,
  INDEX `fk_cart_detail`(`cart_detail_id` ASC) USING BTREE,
  CONSTRAINT `fk_cart_detail` FOREIGN KEY (`cart_detail_id`) REFERENCES `detail` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cart_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (1, 1);
INSERT INTO `cart` VALUES (1, 2);
INSERT INTO `cart` VALUES (1, 3);

-- ----------------------------
-- Table structure for detail
-- ----------------------------
DROP TABLE IF EXISTS `detail`;
CREATE TABLE `detail`  (
  `id` int NOT NULL,
  `product_id` int NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_detail_product`(`product_id` ASC) USING BTREE,
  CONSTRAINT `fk_detail_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detail
-- ----------------------------
INSERT INTO `detail` VALUES (1, 1, 4);
INSERT INTO `detail` VALUES (2, 5, 2);
INSERT INTO `detail` VALUES (3, 15, 1);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `address_id` int NOT NULL,
  `total` int NOT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order_date` datetime NOT NULL,
  `transport_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_order_user`(`user_id` ASC) USING BTREE,
  INDEX `fk_order_address`(`address_id` ASC) USING BTREE,
  INDEX `fk_order_transport`(`transport_id` ASC) USING BTREE,
  CONSTRAINT `fk_order_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_order_transport` FOREIGN KEY (`transport_id`) REFERENCES `transport` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_order_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `order_id` int NOT NULL,
  `order_detail_id` int NOT NULL,
  PRIMARY KEY (`order_id`, `order_detail_id`) USING BTREE,
  INDEX `fk_order_detail_detail`(`order_detail_id` ASC) USING BTREE,
  CONSTRAINT `fk_order_detail_detail` FOREIGN KEY (`order_detail_id`) REFERENCES `detail` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_order_detail_order` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `price` int NOT NULL,
  `imageSrc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 'Cú gỗ trên cây', 'THÔNG SỐ KỸ THUẬT<br>• Kích thước : 19cm x 7cm x 7cm<br>• Màu sắc : Trong suốt<br>• Chất liệu & Quy trình : Gỗ cú trang trí bàn ăn là sản phẩm thủ công của gia đình mình, chim cú được làm từ gỗ jempinis được gia công rất cẩn thận kỹ thuật điêu khắc để tạo ra hình chim cú rất đẹp, kết hợp với rễ gỗ tự nhiên và rất độc đáo làm nền, rất phù hợp để trang trí cho ngôi nhà của bạn trông đẹp hơn và cũng có thể làm quà tặng cho một người đặc biệt.<br ><br>XỬ LÝ & THỜI GIAN VẬN CHUYỂN<br>• chúng tôi cần thời gian để xử lý khoảng 2-5 ngày làm việc<br>• Indonesia Pos Express: 6-12 ngày sau khi tôi đánh dấu đơn hàng là đã hoàn thành', 2000000, 'https://i.etsystatic.com/34082332/r/il/1daebc/3697370887/il_794xN.3697370887_1gqq.jpg', 0);
INSERT INTO `product` VALUES (2, 'Cặp đôi chim ruồi', 'Vận chuyển sẽ được nâng cấp thành vận chuyển nhanh nếu mua hai mặt hàng trở lên, áp dụng cho tất cả các mặt hàng.<br><br>Sử dụng các mã này để tiết kiệm khi bạn mua nhiều mặt hàng:<br>WDRS02 để tiết kiệm 10% cho 2 mặt hàng trở lên<br>WDRS04 để tiết kiệm 25% cho 4 mặt hàng trở lên<br><br>VẬN CHUYỂN<br>Vận chuyển tiêu chuẩn: 8-15 ngày làm việc<br>Vận chuyển nhanh: 5-8 ngày làm việc<br><br>Cơ sở của bức tượng được làm từ gỗ kí sinh, và chim ruồi được làm từ gỗ địa phương của Indonesia, cụ thể là gỗ Jempinis, sự kết hợp của hai loại gỗ tạo ra một bức tượng có hình dạng độc đáo.<br><br>Các tác phẩm điêu khắc được các nghệ nhân của chúng tôi thực hiện trong không gian nhỏ của chúng tôi xưởng đặt tại Ubud, Bali. Tác phẩm điêu khắc là một tác phẩm nghệ thuật tự nhiên, bạn sẽ nhận được các hình dạng khác nhau nhưng cùng kích thước.', 2000000, 'https://i.etsystatic.com/28326759/r/il/35b67b/2949468266/il_794xN.2949468266_kpha.jpg', 0);
INSERT INTO `product` VALUES (3, 'Keycap gỗ cho bàn phím cơ', ' BLACK WALNUT Keycap gỗ tùy chỉnh cho bàn phím cơ<br><br>Vui lòng chọn từ các tùy chọn có sẵn sau:<br>□R1-1u<br>□R2-1u<br>□R3-1u<br>□R4-1u <br>□Backspace-2u<br>□Nhập phím-2.25u<br>□Phím cách-6.25u<br>□Bộ WASD<br>□Bộ △▽▷◁<br><br>♥Material : Gỗ óc chó đen<br>♥Cấu hình: OEM<br>♥Khả năng tương thích: Bàn phím cơ MX stem<br><br>VẬN CHUYỂN MIỄN PHÍ TẠI HOA KỲ & CANADA<br>Do đại dịch COVID-19, vui lòng chờ thêm thời gian để giao hàng<br> br><br>Nếu bạn muốn có ghi chú quà tặng trong gói hàng, vui lòng để lại nội dung ghi chú trong hộp thông báo “Thêm ghi chú“ khi thanh toán ;)', 2000000, 'https://i.etsystatic.com/26845987/r/il/19fbed/2857907717/il_794xN.2857907717_gayh.jpg', 0);
INSERT INTO `product` VALUES (4, 'Táo gỗ', 'Những quả táo này là táo loại 1 vì gỗ được sử dụng đắt hơn để mua. Gỗ được sử dụng cho những quả táo này là Ziricote, Kingwood, Cocobolo, Tulipwood, Anjan và African Blackwood.Pau Rosa<br>Táo có thể khác so với ảnh. Những quả táo này đã được phun sơn và đánh bóng để có độ bóng cao Kích thước của những quả táo đều gần đúng : Chiều cao 2 3/8&quot; (60mm) và đường kính nằm trong khoảng 2 1/2 & 2 3/4&quot; (64-70mm).', 2000000, 'https://i.etsystatic.com/21252371/r/il/62708b/2086462853/il_794xN.2086462853_qu14.jpg', 0);
INSERT INTO `product` VALUES (5, 'Ghế đẩu bằng gỗ sồi', 'Ghế đẩu làm hoàn toàn bằng gỗ sồi. Nó được ngâm tẩm với dầu tự nhiên và sáp dán. Một món đồ nội thất rất phổ biến, nó có thể đứng ở bất cứ đâu trong nhà để lấp đầy khoảng trống và cách nhiệt cho nội thất. Nó cũng hoàn hảo như một chiếc bàn cạnh giường ngủ. Mặt bàn trên cùng có kích thước 49x25x2 cm. Chân rất ổn định, tiết diện của chúng là 3 × 3 cm. Nó được đặc trưng bởi các chi tiết đẹp.<br><br>Thông số kỹ thuật:<br>- kích thước tổng thể 49x25x48 cm,<br>- ngâm tẩm sáp dầu,<br>- chân ổn định với tiết diện 3 × 3 cm,< br>- trọng lượng cho phép 80 kg', 2000000, 'https://i.etsystatic.com/18808630/r/il/53972b/3812956630/il_794xN.3812956630_2gct.jpg', 0);
INSERT INTO `product` VALUES (6, 'Đĩa tròn làm thủ công bằng gỗ', 'Chất liệu: Keo<br><br>Kích thước<br><br>•S - Đường kính Dài: 15cm Rộng: 15cm Dày 2cm<br><br>•M - Đường kính Dài: 20cm Rộng: 20cm Dày 2cm<br><br><br> <br>Khay vườn gỗ keo được làm bằng gỗ keo cứng từ Philippines. <br><br>Gỗ của gỗ keo cứng.<br><br>Gỗ keo cứng, tán cao, lá màu xanh tươi, khi đến mùa hoa có màu trắng xanh, thanh tao và thơm ngát. <br><br>Vân gỗ đẹp ly cafe cực hợp, dùng hàng ngày trong phòng khách làm khay giải khát cũng rất trang nhã.', 2000000, 'https://i.etsystatic.com/21232771/r/il/739f35/2535772368/il_794xN.2535772368_nu4b.jp', 0);
INSERT INTO `product` VALUES (7, 'Thìa gỗ thủ công - Muỗng nấu ăn 12 inch', 'Sản xuất tại Mỹ - Được làm thủ công tại đất nước Amish, Pennsylvania bởi thợ thủ công lành nghề. Mang truyền thống trở lại nhà bếp của bạn với thiết kế mang tính biểu tượng, thìa gỗ của chúng tôi được chạm khắc từ cây anh đào, cây phong và quả óc chó được thu hoạch bền vững ở Pennsylvania.<br><br>Đa năng - Tuyệt vời để trộn, nấu và phục vụ. Thìa gỗ tốt nhất cho mọi bề mặt nấu nướng bao gồm dụng cụ nấu bằng gang, teflon chống dính, thép không gỉ và chảo. Hoàn hảo để nấu ăn trong nhà bếp hoặc phục vụ tại bàn ăn tối. Lý tưởng để nấu canh, xào rau, xào thịt và dùng với cơm.', 2000000, 'https://i.etsystatic.com/28083097/r/il/eda35b/3478699330/il_794xN.3478699330_pcmo.jpg', 0);
INSERT INTO `product` VALUES (8, 'Mô hình nấm làm bằng gỗ', 'Chúng tôi có hai tùy chọn vận chuyển, Tiêu chuẩn và Chuyển phát nhanh của DHL. Thời gian giao hàng ước tính cho chuyển phát nhanh là 3-7 ngày làm việc trên toàn thế giới. Vui lòng chọn vận chuyển nhanh trong quá trình thanh toán / xem xét đơn hàng nếu bạn cần bức tượng nhanh chóng.<br><br>Tự động nâng cấp lên vận chuyển nhanh nếu bạn mua hai món trở lên.<br><br>♥Giảm 15% khi bạn mua 3 bức giảm giá khi bạn mua 5 món đồ (Mã số: PAR05) hoặc bằng cách nhấp vào liên kết này ♥<br>♥vòng tay & đồ trang trí giáng sinh miễn phí♥<br><br>Nấm được làm từ gỗ địa phương, gỗ Jempinis. Phần đế của bức tượng này được làm bằng gỗ Ký Sinh. Gỗ trắc là một loại gỗ rất độc đáo.', 2000000, 'https://i.etsystatic.com/15079459/r/il/251071/3926052242/il_794xN.3926052242_ml5g.jpg', 0);
INSERT INTO `product` VALUES (9, 'Bình hoa tối giản bằng gỗ', 'Bình Gỗ Tự Nhiên 01 | Bình hoa tối giản | Quà Tặng Gia Đình | Trang trí ngày lễ | Quà Giáng Sinh | Gỗ Nghệ Thuật | Quà Tặng Nàng Giáng Sinh<br><br>? Kích thước: cao 18cm, mặt trên 8cm, đáy 4cm<br>? Có 2 màu Đậm và Sáng<br>?Sản phẩm gỗ gợi ấn tượng đẹp về sự gần gũi với thiên nhiên, giản dị mà tinh tế , mộc mạc nhưng không hề thô sơ. Chiếc bình này được làm từ gỗ óc chó và gỗ phong trong một quá trình xử lý cẩn thận, chắc chắn nó sẽ mang đến cho ngôi nhà của bạn một vẻ tinh tế mộc mạc.<br>?Bạn có thể cắm những bông hoa lộng lẫy mà không cần cắm chúng trong một chiếc lọ cắm hoa bằng gỗ cầu kỳ. Chỉ có hoa khô, hoa giả hoặc thân cây khô tươi là phù hợp.', 2000000, 'https://i.etsystatic.com/28475776/r/il/411c78/3242190441/il_794xN.3242190441_bfqi.jpg', 0);
INSERT INTO `product` VALUES (10, 'Đồng hồ treo tường bằng gỗ 20 inch', 'Đồng hồ treo tường tối giản hiện đại. Mặt gỗ sồi sang trọng, vạch chỉ giờ và kim đồng hồ màu đen. Thiết kế độc đáo hấp dẫn. Có hai kích thước lớn 40 cm và 50 cm / 15,7 inch và 19,7 inch. Được trang bị một đồng hồ im lặng. <br><br>Quy cách:<br>- đồng hồ làm bằng gỗ sồi veneered 6mm/ ~ 0,24&#39;&#39; MDF dày,<br>- chỉ số: chèn màu đen, thiết kế bóng bẩy hiện đại,<br>- kim đồng hồ được làm bằng nhôm sơn đen,<br>- gỗ được sơn dầu kỹ lưỡng,<br>- đường kính có sẵn: 40 cm / ~ 15, 7&#39;&#39; hoặc 50 cm / ~19,7&#39;&#39;<br>- chuyển động đồng hồ: bộ máy Đức chất lượng cao, yên tĩnh, đáng tin cậy', 2000000, 'https://i.etsystatic.com/27431999/r/il/ec35d5/4207680673/il_794xN.4207680673_9ong.jpg', 0);
INSERT INTO `product` VALUES (11, 'Bình hoa gốm sứ thô -trang trí nội thất', 'Bình hoa gốm thô Embersceramic để trang trí nhà<br><br>Lọ hoa gốm này bao gồm:<br><br>Bình hoa x1 x1 (6x13cm)<br><br>Bình hoa x1 x1 (9x8,5cm)< br><br>Lọ hoa C x1 (4.8x14cm)<br><br>Lọ hoa D x1 (8.5x7.5cm)<br><br>Lọ hoa gốm sứ này cung cấp cho bạn tất cả những gì bạn cần cho một sự kiện Trà đạo / dự tiệc với bạn bè hoặc đồng nghiệp tại văn phòng ngoài trời hoặc ở nhà. Một món quà Giáng sinh hoặc sinh nhật hoàn hảo.<br><br>Lý tưởng cho buổi giới thiệu của bạn với những người yêu trà<br><br>Yêu cầu kinh doanh/yêu cầu đặc biệt/đặt hàng tùy chỉnh: chỉ cần viết thư cho chúng tôi.', 2000000, 'https://i.etsystatic.com/5407182/r/il/bebd07/2534366726/il_794xN.2534366726_mqgb.jpg', 0);
INSERT INTO `product` VALUES (12, 'Bộ tách trà gốm sứ', 'Chiếc cốc và đĩa vẽ bằng thảo dược được làm thủ công này là một món quà hoàn hảo cho bất kỳ người yêu trà hoặc cà phê nào! Họa tiết hoa màu xanh lam sẽ tạo tâm trạng vui vẻ trong bất kỳ thời tiết xấu nào.<br><br>Kích thước xấp xỉ:<br>Dung tích: 300ml hoặc 400 ml tùy bạn chọn<br>Đĩa lót đường kính 7 inch/18 cm', 2000000, 'https://i.etsystatic.com/26186931/r/il/2f47c6/3224650156/il_794xN.3224650156_gzj8.jpg', 0);
INSERT INTO `product` VALUES (13, 'Cốc cà phê', 'Lớp men chấm trong suốt trên những chiếc cốc này trông tinh nghịch và ngon miệng. Những cốc tên tùy chỉnh này là cốc cà phê hoặc cốc trà lý tưởng và hoạt động hoàn hảo khi độc lập hoặc theo bộ. Tất cả các tác phẩm của tôi đều là đồ gốm đất sét trắng và được tráng men an toàn cho thực phẩm.<br><br>Xin lưu ý rằng mỗi chiếc cốc được tạo thành riêng lẻ và do đó sẽ có đặc điểm, hình dạng và khuyết điểm riêng. <br><br>Bạn cũng có thể chọn cốc có đĩa được cá nhân hóa của mình (đĩa sẽ không cần cá nhân hóa).', 2000000, 'https://i.etsystatic.com/17142610/r/il/613332/1938023514/il_794xN.1938023514_da3k.jpg', 0);
INSERT INTO `product` VALUES (14, 'Bình gốm trang trí sáng tạo', 'BLEUS - Blue Ceramic Vase Hand Painted Creative Home Decoration Ornaments<br><br>Have you ever looked at a flower and thought to yourself, &quot;This would look so much better if it were in a vase?&quot; Well, we have the perfect product for you: our ceramic vases!<br><br>Our vases are made with green ceramic and are sure to enhance your floral arrangements. They come in three different sizes and can be used individually or together to create an eye-catching display.<br><br>So what are you waiting for? Add one or more of these beauties to your collection today!<br><br>IWYAH - I want you a home', 2000000, 'https://i.etsystatic.com/34419527/r/il/aa60d6/3842629230/il_794xN.3842629230_18c3.jpg', 0);
INSERT INTO `product` VALUES (15, 'Bình cắm hoa cổ điển', 'Những chiếc bình ném thủ công này được sản xuất tại thị trấn sứ Jingdezhen. Chúng là những chiếc bình nhỏ xinh, phù hợp để trang trí bàn trà Kungfu (Gongfu) / Chado Nhật Bản. Cũng là một món quà tân gia hoặc sinh nhật tuyệt vời. <br><br>Để biết kích thước của bình hoa, vui lòng tham khảo hình ảnh.', 2000000, 'https://i.etsystatic.com/26821883/r/il/a0faef/2804326619/il_794xN.2804326619_tndb.jpg', 0);
INSERT INTO `product` VALUES (16, 'Bình gốm sứ cắm hoa', 'Bình hoa nụ <br><br>Làm sinh động ngôi nhà của bạn bằng những bông hoa tươi vào mùa hè hoặc sưởi ấm nó bằng một chiếc bình hoa khô và đầy màu sắc vào mùa đông. Bất kể thành phần nào bạn yêu thích, một chiếc bình gốm sẽ là nơi thích hợp để giữ nó. <br><br>- Kích thước: H: 7,48 inch (19 cm) Ø: 3,94 inch (10 cm)<br>- Dung tích: 43 fl oz (1300 ml)<br>- Chức năng<br>- Sẵn sàng vận chuyển <br><br>Chúng tôi cần khoảng ba tuần để làm chiếc bình. Ban đầu, chúng tôi tạo hình nó trên bánh xe của thợ gốm. Sau đó, nó trải qua quá trình nung, tráng men và nung lại ở nhiệt độ 2012°F (1100°C).', 2000000, 'https://i.etsystatic.com/32760853/r/il/a9fae2/3548784906/il_794xN.3548784906_nzvc.jpg', 0);
INSERT INTO `product` VALUES (17, 'Bộ ấm trà tráng men thủ công', 'Bộ ấm trà này sẽ góp phần mang đến cho bạn những buổi thư giãn thoải mái bên gia đình bên những tách trà nóng thơm ngon, cũng như giúp tâm hồn trở về với sự bình yên trong cuộc sống.<br>- Cấu tạo ấm trà sứ cao cấp: đảm bảo độ thẩm thấu cao, lưu giữ hương thơm của trà<br>Sản phẩm được nung trong lò với nhiệt độ 1300 độ C loại bỏ hoàn toàn các chất độc hại đảm bảo sức khỏe người sử dụng.<br>- Sản phẩm đẹp, sang trọng có thể dùng làm quà biếu tặng người thân, bạn bè, tân gia.<br> - Chén được tráng men trong lòng, màu sắc sáng sạch giúp giữ hương vị trà thơm ngon, đẹp mắt, không bám dính, dễ dàng vệ sinh sau khi sử dụng.<br>- Bộ sản phẩm gồm: 01 ấm trà dung tích 500ml, 06 tách trà, 07 đĩa.', 2000000, 'https://i.etsystatic.com/25577822/r/il/4f09cc/2744292627/il_794xN.2744292627_hcxn.jpg', 0);
INSERT INTO `product` VALUES (18, 'Vòng tay hạt dung nham', 'Mỗi vòng tay đều được làm thủ công bằng dây co giãn bền và đá bán quý. Tất cả các vòng đeo tay có thể được thực hiện để phù hợp với bất kỳ kích thước cổ tay. Nếu bạn cần kích thước khác với kích thước được cung cấp, vui lòng thêm kích thước đó vào phần &quot;ghi chú cho người bán&quot; hộp khi thanh toán.<br><br>Khi thanh toán, khách hàng có tùy chọn chọn loại đá quý họ muốn kết hợp và kích thước họ cần.<br><br>Cho dù là một hướng dẫn thiền định tĩnh lặng hay một tác phẩm tuyên bố đẹp, trung tính và tự nhiên, điều này vòng tay sẽ là một bổ sung tuyệt vời cho phong cách hoặc thực hành tâm linh của bạn.', 2000000, 'https://i.etsystatic.com/28925255/r/il/2c3af2/3533942998/il_794xN.3533942998_fnxb.jpg', 0);
INSERT INTO `product` VALUES (19, 'Ấm trà sứ trắng xám', 'Kích thước chiều dài x chiều cao:<br>10cmx8.5cm<br>Dung tích<br>125ML.', 2000000, 'https://i.etsystatic.com/28925255/r/il/d0d4e1/3413872128/il_794xN.3413872128_1zs2.jpg', 0);
INSERT INTO `product` VALUES (20, 'Bình gốm trắng phong cách Bắc Âu - phong cách hiện', 'Tạo phong cách cho không gian của bạn với sự tinh tế tối giản hiện đại với những chiếc bình gốm này. Đẹp mắt dù có hoặc không có hoa, lỗ nhỏ sẽ phù hợp với một vài nhánh thực vật yêu thích của bạn để tô điểm cho không gian của bạn. Sự kết hợp giữa kích thước bình với sức chứa làm cho điều này trở thành một bổ sung tuyệt đẹp cho bất kỳ không gian hiện đại nào. Sọc ngang mỏng, nhẹ nhàng được xác định bằng tay mang lại kết cấu và sự sang trọng cho hình dáng đẹp mắt.<br>Thiết kế sọc tối giản.<br>Bình hoa hiện đại.<br>Gốm thủ công.<br>Kích thước: A 15*8cm, B 8*15cm, C 11*25cm<br><br>giá cho một chiếc bình.', 2000000, 'https://i.etsystatic.com/27692523/r/il/bb6617/3326750421/il_794xN.3326750421_g49q.jpg', 0);
INSERT INTO `product` VALUES (21, 'Tranh nghệ thuật phố cổ', 'GIỚI THIỆU VỀ BỨC TRANH NÀY.<br>Người sáng tạo: Aoi Gallery Team<br> Phong cách: Tranh trừu tượng<br> Đóng gói: Được cuộn và vận chuyển trong một ống đặc.<br> Chất liệu: Acrylic chuyên nghiệp, sơn dầu, canvas, vẽ tay. <br> Acrylic thủ công, sơn dầu trên canvas. Không có khung, Không kéo giãn.<br> Tranh có thêm viền trắng 2-3 inch xung quanh để kéo giãn hoặc tạo khung.', 2000000, 'https://i.etsystatic.com/11226095/r/il/96894d/3004768032/il_794xN.3004768032_bg4z.jpg', 0);
INSERT INTO `product` VALUES (22, 'Tranh sơn dầu làm quà tặng mẹ', 'GIỚI THIỆU VỀ BỨC TRANH NÀY.<br> Người sáng tạo: Aoi Gallery Team<br> Phong cách: Tranh trừu tượng<br> Đóng gói: Được cuộn và vận chuyển trong một ống đặc.<br> Chất liệu: Acrylic chuyên nghiệp, sơn dầu, canvas, vẽ tay. <br> Acrylic thủ công, sơn dầu trên canvas. Không có khung, Không kéo giãn.<br> Tranh có thêm viền trắng 2-3 inch xung quanh để kéo giãn hoặc tạo khung.', 2000000, 'https://i.etsystatic.com/9577345/r/il/a5c841/2647914396/il_794xN.2647914396_lv1f.jpg', 0);
INSERT INTO `product` VALUES (23, 'Tranh phong cảnh quê hương Việt Nam', 'LƯU Ý QUAN TRỌNG <br>* Tất cả các khung hình chỉ được hiển thị nhằm mục đích minh họa, chúng không được bao gồm.<br>* Sự hài lòng của bạn là điều tối quan trọng đối với chúng tôi, vì vậy đối với mỗi đơn đặt hàng của bạn, chúng tôi sẽ gửi ảnh xem trước để bạn kiểm tra và chỉ giao hàng sau khi bạn chấp thuận.<br>* Nếu bạn cho rằng chúng tôi không xứng đáng được đánh giá 5 sao, vui lòng liên hệ với chúng tôi vì bất kỳ lý do gì trước khi bạn để lại nhận xét và chúng tôi sẽ giải quyết vấn đề ngay lập tức một cách chân thành nhất.<br> * Tôi thực sự hy vọng rằng những bức tranh của tôi sẽ lấp đầy không gian của bạn với những lời chúc đầy màu sắc của phép thuật và niềm vui.<br> Cảm ơn bạn đã ủng hộ và hiểu biết của bạn!', 2000000, 'https://i.etsystatic.com/21044348/r/il/10aa34/2590995189/il_794xN.2590995189_7prr.jpg', 0);
INSERT INTO `product` VALUES (24, 'Tranh thiếu nữ Việt Nam', 'LƯU Ý QUAN TRỌNG <br>* Tất cả các khung hình chỉ được hiển thị nhằm mục đích minh họa, chúng không được bao gồm.<br>* Sự hài lòng của bạn là điều tối quan trọng đối với chúng tôi, vì vậy đối với mỗi đơn đặt hàng của bạn, chúng tôi sẽ gửi ảnh xem trước để bạn kiểm tra và chỉ giao hàng sau khi bạn chấp thuận.<br>* Nếu bạn cho rằng chúng tôi không xứng đáng được đánh giá 5 sao, vui lòng liên hệ với chúng tôi vì bất kỳ lý do gì trước khi bạn để lại nhận xét và chúng tôi sẽ giải quyết vấn đề ngay lập tức một cách chân thành nhất.<br> * Tôi thực sự hy vọng rằng những bức tranh của tôi sẽ lấp đầy không gian của bạn với những lời chúc đầy màu sắc của phép thuật và niềm vui.<br> Cảm ơn bạn đã ủng hộ và hiểu biết của bạn!', 2000000, 'https://i.etsystatic.com/21044348/r/il/a580d0/2224060728/il_794xN.2224060728_78zf.jpg', 0);
INSERT INTO `product` VALUES (25, 'Tranh sơn dầu phong cảnh Việt Nam', 'LƯU Ý QUAN TRỌNG <br>* Tất cả các khung hình chỉ được hiển thị nhằm mục đích minh họa, chúng không được bao gồm.<br>* Sự hài lòng của bạn là điều tối quan trọng đối với chúng tôi, vì vậy đối với mỗi đơn đặt hàng của bạn, chúng tôi sẽ gửi ảnh xem trước để bạn kiểm tra và chỉ giao hàng sau khi bạn chấp thuận.<br>* Nếu bạn cho rằng chúng tôi không xứng đáng được đánh giá 5 sao, vui lòng liên hệ với chúng tôi vì bất kỳ lý do gì trước khi bạn để lại nhận xét và chúng tôi sẽ giải quyết vấn đề ngay lập tức một cách chân thành nhất.<br> * Tôi thực sự hy vọng rằng những bức tranh của tôi sẽ lấp đầy không gian của bạn với những lời chúc đầy màu sắc của phép thuật và niềm vui.<br> Cảm ơn bạn đã ủng hộ và hiểu biết của bạn!', 2000000, 'https://i.etsystatic.com/28541017/r/il/2e498e/3795588109/il_794xN.3795588109_l7oh.jpg', 0);
INSERT INTO `product` VALUES (26, 'Bộ phin cà phê gốm dành cho người yêu cà phê', 'Tận hưởng từng khoảnh khắc với một tách cà phê! ♡ Cà phê phin, hay phin Việt Nam, là một trong những di sản của Việt Nam và là phương pháp pha cà phê truyền thống. <br># Lưu ý: Sản phẩm được làm thủ công và sử dụng kỹ thuật tráng men hoạt tính nên màu sắc có thể hơi khác so với hình ảnh. <br><br>Bộ sản phẩm bao gồm: Phin, cốc và đĩa tròn<br>#Phin: D-9cm x H-7.3cm<br>#Cốc: D-8cm x H-5.8cm', 2000000, 'https://i.etsystatic.com/22591325/r/il/d25fd3/3693380625/il_794xN.3693380625_gx78.jpg', 0);
INSERT INTO `product` VALUES (27, 'Cốc đất sét uống trà', 'Cà phê hoặc trà buổi sáng của bạn sẽ đậm đà và thơm hơn với một chiếc cốc mộc mạc lớn xinh xắn như vậy vì gốm sứ không tráng men hấp thụ hương vị và trả lại hương vị mỗi khi bạn sử dụng!', 2000000, 'https://i.etsystatic.com/37014879/r/il/6027d5/4107843632/il_794xN.4107843632_tab7.jpg', 0);
INSERT INTO `product` VALUES (28, 'Cốc sứ nghệ thuật dân gian', 'Những chiếc cốc này được chế tạo bởi các nhóm phụ nữ địa phương ở Palestine, những người cố gắng xóa đói giảm nghèo và thất nghiệp ở địa phương, đồng thời duy trì truyền thống thủ công mỹ nghệ của người Palestine. Một bổ sung đẹp cho nhà bếp của bạn đó là một thủ môn. Có sẵn dưới dạng cốc đơn hoặc bộ 2 và 4 cốc.<br><br>Chén gốm thủ công được làm theo kỹ thuật truyền thống của Palestine. Một loại gốm trắng tuyệt đẹp với họa tiết in hoa dân tộc nổi tiếng, với các chi tiết tuyệt vời. Cốc màu xanh trắng với thiết kế hoa và lá đẹp mắt, bạn thậm chí có thể gọi nó là cốc hoa mùa đông. Một thiết kế độc đáo kết hợp giữa nghệ thuật dân gian dân tộc truyền thống với cách tiếp cận hiện đại.<br><br>Nhiều năm trước, những chiếc cốc tuyệt vời này được dùng để tiếp khách hoặc được cất giữ trong tủ kính như một vật trưng bày, trang trí. Thậm chí ngày nay tác phẩm nghệ thuật tuyệt đẹp này thường được trưng bày như một món quà lưu niệm, tưởng nhớ về Palestine. Vừa thiết thực vừa đẹp mắt, đây là loại gốm ', 2000000, 'https://i.etsystatic.com/37014879/r/il/f0b2ac/4155588121/il_794xN.4155588121_36id.jpg', 0);
INSERT INTO `product` VALUES (29, 'Cốc Trà Gốm Sứ Núi Cà Phê Trà 480Ml', 'Bộ tách trà sứ này bao gồm :<br><br>x 1 Cốc uống trà (14.6x13.5cm 480ml)', 2000000, 'https://i.etsystatic.com/31698325/r/il/765a3d/3640332457/il_794xN.3640332457_1d6e.jpg', 0);
INSERT INTO `product` VALUES (30, 'Gốm thủ công – Cốc trà có bộ lọc 240ml', 'This ceramic tea mugs include :<br><br>~Tea mugs(10.3x7.8cm 240ml)', 2000000, 'https://i.etsystatic.com/31698325/r/il/b25c90/3494214638/il_794xN.3494214638_mkr8.jpg', 0);

-- ----------------------------
-- Table structure for transport
-- ----------------------------
DROP TABLE IF EXISTS `transport`;
CREATE TABLE `transport`  (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fee` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transport
-- ----------------------------
INSERT INTO `transport` VALUES (0, NULL, 0);
INSERT INTO `transport` VALUES (1, 'Giao hàng tiết kiệm', 30000);
INSERT INTO `transport` VALUES (2, 'Giao hàng nhanh', 50000);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'Thii An', 'phanan@gmail.com', '0900000001', NULL, 0);
INSERT INTO `user` VALUES (2, 'Dương Thanh Phụng', '20130099@st.hcmuaf.edu.vn', '0900000123', NULL, 0);
INSERT INTO `user` VALUES (3, 'Quỳnh Như', '20130356@st.hcmuaf.edu.vn', '0900000023', NULL, 0);
INSERT INTO `user` VALUES (4, 'Lê Bảo Đặng', '20130010@st.hcmuaf.edu.vn', '0999999999', NULL, 0);
INSERT INTO `user` VALUES (5, 'quynh nhuw', 'qinhuuuuu@gmail.com', '0819541221', NULL, 0);
INSERT INTO `user` VALUES (6, 'Gia Bảo', 'quynhnhuuww22@gmail.com', '888888881', NULL, 0);
INSERT INTO `user` VALUES (7, 'Hồ An', 'thphung2@gmail.com', '0146598444', NULL, 0);
INSERT INTO `user` VALUES (8, 'Quynh Nhuw', NULL, NULL, NULL, 0);

SET FOREIGN_KEY_CHECKS = 1;
