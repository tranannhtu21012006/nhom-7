-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 15, 2026 lúc 05:02 PM
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
-- Cơ sở dữ liệu: `sport_news_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `advertisement`
--

CREATE TABLE `advertisement` (
  `ad_id` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `click_count` int(11) DEFAULT 0,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `article`
--

CREATE TABLE `article` (
  `article_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `view_count` int(11) DEFAULT 0,
  `category_id` int(11) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `article`
--

INSERT INTO `article` (`article_id`, `title`, `content`, `created_at`, `view_count`, `category_id`, `image`, `status`) VALUES
(2, 'Mới: Văn Hậu được thầy Kim gọi lên đội tuyển Việt Nam, \'hung thần\' của Malaysia tái xuất', 'Nỗ lực bền bỉ của Văn Hậu được đền đáp xứng đáng, khi anh được HLV Kim Sang-sik triệu tập trở lại đội tuyển Việt Nam.\r\nVăn Hậu, Đình Trọng đã trở lại\r\nỞ đợt tập trung cuối tháng 3 chuẩn bị cho các trận đấu gặp Bangladesh (26.3) và Malaysia (31.3), đội tuyển Việt Nam sẽ đón chào sự trở lại của gương mặt quen thuộc, đó là Văn Hậu.\r\n\r\nHậu vệ sinh năm 1999 được HLV Kim Sang-sik điền tên vào danh sách đội tuyển Việt Nam, nhờ màn thể hiện tốt trong màu áo CLB Công an Hà Nội (CLB CAHN), từ khi trở lại sau chấn thương kéo dài khiến anh phải nghỉ thi đấu suốt 2 năm (từ tháng 8.2023 đến tháng 11.2025).\r\n\r\nCụ thể, Văn Hậu tái xuất trong màu áo CLB CAHN ở trận gặp Buriram United tại vòng bảng ASEAN Club Championship. Văn Hậu sau đó đá tiếp trận gặp Selangor và thi đấu tròn vai, cho thấy cảm giác bóng cùng cảm quan vị trí tốt dù rời xa sân cỏ thời gian dài.\r\n\r\nTrở lại đội tuyển Việt Nam, Văn Hậu cũng đánh dấu tròn 3 năm mới trở lại sân chơi quốc tế. Giải đấu chính thức gần nhất anh hiện diện là AFF Cup 2022, khi HLV Park Hang-seo còn nắm quyền.\r\n\r\nVăn Hậu là \"hung thần\" của đội tuyển Malaysia. Anh từng đánh đầu kiến tạo giúp Việt Nam hạ Malaysia tại vòng loại thứ hai World Cup 2022, qua đó trực tiếp đoạt vé vào vòng loại thứ ba lần đầu trong lịch sử. Tại AFF Cup 2018, cánh trái của Văn Hậu trở thành \"điểm nổ\" giúp đội tuyển Việt Nam xé lưới Malaysia nhiều lần. ', '2026-03-12 03:30:35', 117, 1, 'vietnam1.jpg', 1),
(3, 'Tay vợt Lê Đức Phát giành chức vô địch đơn nam giải cầu lông Uganda International Challenge 2024, qua đó tiếp tục cuộc đua giành vé tham dự Olympic Paris', 'Tối 25/2, tay vợt cầu lông Lê Đức Phát thi đấu trận chung kết đơn nam giải Uganda International Challenge 2024 gặp đối thủ người Ấn Độ - Raghu Mariswamy (hạng 139 thế giới)\r\nTrước đối thủ có thứ hạng thấp hơn, Đức Phát (hạng 86 thế giới) đã khởi đầu set 1 không tốt và bị dẫn đến 1-9. Tuy nhiên sau đó tay vợt Việt Nam đã có màn lội ngược dòng ấn tượng để bứt lên thắng 21-18. Sang set 2, Đức Phát thi đấu tập trung hơn và bứt xa so với đối thủ để thắng 21-14 sau tình huống đánh hỏng của Raghu Mariswamy', '2026-03-30 14:30:51', 0, 2, '1774881051_caulong.jpg', 1),
(4, 'Giải bóng rổ sinh viên Việt Nam trở lại, giới trẻ háo hức cùng trái bóng cam', 'Giải Bóng rổ Sinh viên Việt Nam 2025-2026 (Vietnam Collegiate Basketball Championship – VCBC) chính thức trở lại, đánh dấu mùa giải thứ hai sau thành công vang dội của năm đầu tiên 2024-2025. Được tổ chức bởi Công ty Cổ phần New Sports và Trung tâm Hỗ trợ và Phát triển Sinh viên Việt Nam, VCBC là giải bóng rổ sinh viên quy mô và dài ngày nhất trong năm tại Việt Nam.\r\n\r\nMùa giải năm nay diễn ra tại Nhà thi đấu Thanh Hà (Khu đô thị Thanh Hà, xã Bình Minh, Hà Nội) và The Global City (Đường Đỗ Xuân Hợp, Phường An Khánh, TP. Hồ Chí Minh) với sự đồng hành của Quỹ Lê Hoàng Đan và Masterise Homes, hứa hẹn mang đến không khí tranh tài kịch tính xuyên suốt gần hai tháng thi đấu liên tục.\r\nChặng miền bắc của mùa giải 2025-2026 tại Hà Nội chứng kiến sự mở rộng mạnh mẽ với 24 đội nam và 16 đội nữ. Ở nội dung nam, các đội được chia thành 6 bảng, mỗi bảng 4 đội; nội dung nữ chia thành 4 bảng, mỗi bảng 4 đội.\r\n\r\nTất cả sẽ bước vào vòng loại theo thể thức vòng tròn lượt đi - lượt về, diễn ra từ ngày 6/12/2025 đến 25/1/2026 vào các ngày Thứ Sáu và Thứ Bảy hằng tuần.\r\n\r\nMỗi ngày thi đấu có tới 8 trận, kéo dài từ 14:00 đến 22:00, tạo nên nhịp độ sôi động và đậm đặc đúng chất của giải đấu sinh viên lớn nhất cả nước. Những đội có thứ hạng cao sẽ tiếp tục tiến vào vòng Play-offs dự kiến diễn ra trong tháng 2–3/2026.\r\n\r\nTương tự, chặng miền Nam với sự góp mặt của 20 đội nam và 10 đội nữ dự kiến sẽ bắt đầu sau đó 14 ngày, từ 19/12/2025 đến 8/2/2026, tại Thành phố Hồ Chí Minh. Ở nội dung nam, các đội được chia thành 5 bảng, mỗi bảng 4 đội; trong khi nội dung nữ gồm 2 bảng với 5 đội mỗi bảng.\r\n\r\nCác đội sẽ thi đấu theo thể thức vòng tròn lượt đi – lượt về song song với chặng miền Bắc.', '2026-04-02 14:19:55', 0, 7, '1775139595_bongro1.jpg', 1),
(6, 'TRUNG ƯƠNG HỘI SINH VIÊN VIỆT NAM, GRAB VÀ VBA HỢP TÁC TIẾP SỨC CHO TÀI NĂNG TRẺ TRÊN HÀNH TRÌNH CHINH PHỤC GIẤC MƠ BÓNG RỔ VIỆT NAM', 'Trong khuôn khổ hợp tác, Grab Việt Nam đồng hành cùng VBA với vai trò Đối tác Di chuyển và Giao nhận đồ ăn độc quyền (Exclusive Mobility & Food Delivery Partner) của mùa giải 2026, đồng thời hai bên sẽ phối hợp với Trung ương Hội Sinh viên Việt Nam mở rộng cơ hội tiếp cận bóng rổ cho cộng đồng sinh viên trên cả nước. Với thông điệp “Inspiring The New Generation – Nơi tài năng vươn tầm huyền thoại”, sự hợp tác giữa ba bên góp phần kiến tạo một hệ sinh thái bóng rổ năng động, nơi tài năng trẻ nói chung và thế hệ sinh viên nói riêng có thêm điều kiện để theo đuổi đam mê, bứt phá giới hạn và tự tin tỏa sáng.\r\nHợp tác được xây dựng trên hai trụ cột trọng tâm, hướng đến mục tiêu phát triển bền vững cho bóng rổ Việt Nam, bao gồm:\r\n\r\nChắp cánh cho tài năng trẻ bằng việc tạo ra sân chơi bóng rổ dành riêng cho thế hệ Sinh Viên\r\n\r\nTrong khuôn khổ các hoạt động phát triển bóng rổ VBA 2026, Trung ương Hội Sinh viên Việt Nam sẽ đồng hành cùng VBA và Grab Việt Nam tổ chức Hội trại Bóng rổ Sinh viên Mùa hè – sân chơi quy mô toàn quốc dành cho cộng đồng sinh viên đam mê trái bóng cam. \r\n\r\nTrong hoạt động này, Trung ương Hội Sinh viên Việt Nam giữ vai trò định hướng, chỉ đạo hệ thống Hội Sinh viên các tỉnh, thành phố và các trường trực thuộc Trung ương tham gia, phối hợp triển khai hiệu quả các nội dung của hội trại. Qua đó, chương trình góp phần mở rộng mạng lưới phong trào và lan tỏa tinh thần thể thao tích cực trong giới trẻ.\r\n\r\nPhối hợp cùng Trung ương Hội Sinh viên Việt Nam và VBA, Grab sẽ tham gia xây dựng ý tưởng, chủ đề và các giải pháp hỗ trợ thiết thực cho công tác tổ chức cũng như trải nghiệm của người tham gia. Thông qua hệ sinh thái dịch vụ đa dạng, Grab cũng sẽ triển khai các chương trình ưu đãi và tiện ích phù hợp nhằm hỗ trợ nhu cầu di chuyển, sinh hoạt cho sinh viên, vận động viên, ban tổ chức và các lực lượng tham gia trong suốt thời gian diễn ra hoạt động. Đồng thời, Grab sẽ phối hợp cùng các bên triển khai các hoạt động truyền thông nhằm lan tỏa thông điệp sống năng động, thúc đẩy tinh thần thể thao và tăng cường kết nối của chương trình với cộng đồng sinh viên.\r\n\r\nVề phía VBA, đơn vị giữ vai trò tổ chức chuyên môn cho Hội trại Bóng rổ Sinh viên Mùa hè, từ xây dựng nội dung huấn luyện, vận hành chương trình đến chuẩn hóa không gian tập luyện và trải nghiệm tham gia theo định hướng chuyên nghiệp. Thông qua sự đồng hành của đội ngũ huấn luyện viên và vận động viên VBA, chương trình mang đến cho sinh viên cơ hội rèn luyện thực tiễn, tiếp cận môi trường bóng rổ chuyên nghiệp, đồng thời lan tỏa tinh thần thi đấu, kỷ luật và cảm hứng phát triển trong cộng đồng sinh viên.\r\n\r\nTiếp sức trên mọi hành trình tại mùa giải VBA 5x5 thông qua các ưu đãi và tiện ích dành cho các tài năng trẻ và người hâm mộ \r\n\r\nThông qua hệ sinh thái dịch vụ và các giải pháp di chuyển thuận tiện, Grab đồng hành cùng VBA trong việc hỗ trợ các tài năng trẻ tiếp cận gần hơn với hành trình đào tạo, phát triển và thi đấu chuyên nghiệp. Từ các hoạt động tuyển chọn và huấn luyện như VBA Scouting Tour (Vòng sơ tuyển các VĐV tại các trường đại học), VBA Rising Camp (Trại huấn luyện tân binh), VBA Combine Challenges (Thách thức Tân binh), VBA Rookie Draft (Sự kiện tuyển chọn Tân binh) và mùa giải VBA 5x5 chính thức , Grab đồng hành xuyên suốt từng cột mốc phát triển, góp phần mở rộng cơ hội tiếp cận môi trường đào tạo và thi đấu chuyên nghiệp cho thế hệ cầu thủ tương lai.\r\n\r\nĐặc biệt, đối với mùa giải VBA 5x5, Grab sẽ triển khai các chương trình ưu đãi dành cho người hâm mộ nhằm nâng cao trải nghiệm đồng hành cùng giải đấu. Cụ thể, các mã ưu đãi giảm giá độc quyền dành cho người hâm mộ khi di chuyển đến 6 cụm sân thi đấu chính thức trên toàn quốc. Song song đó, dịch vụ xe đưa đón cộng đồng dành cho các nhóm khán giả sẽ được ra mắt tại Hà Nội, TP. Hồ Chí Minh và Đà Nẵng, mang đến lựa chọn di chuyển hiện đại, tiện lợi và dễ tiếp cận hơn.\r\n\r\nViệc đến sân theo dõi trực tiếp không chỉ là thưởng thức một trận đấu, mà còn là trải nghiệm trọn vẹn bầu không khí sôi động của giải bóng rổ chuyên nghiệp. Thông qua các sáng kiến này, VBA và Grab hướng đến việc biến mỗi hành trình đến sân trở thành một phần của trải nghiệm thể thao, nơi sự kết nối và đam mê được khơi dậy ngay từ những vòng xe đầu tiên, đưa người hâm mộ chạm đến cảm xúc trọn vẹn nhất.\r\nÔng Lâm Tùng, Ủy viên Ban Chấp hành, Phó trưởng Ban Công tác Thanh thiếu nhi Trung ương Đoàn, Phó Chủ tịch Thường trực Trung ương Hội Sinh viên Việt Nam cho biết: \r\n\r\n“Trung ương Hội Sinh viên Việt Nam đánh giá cao ý nghĩa của chương trình hợp tác với Grab và VBA trong việc tạo thêm cơ hội phát triển toàn diện cho sinh viên thông qua thể thao. Từ giải VUG không chuyên, sự đồng hành này sẽ mở ra một hệ sinh thái đồng bộ để sinh viên có thể tham gia các giải phong trào và vươn tới thể thao chuyên nghiệp. Chúng tôi tin rằng sự phối hợp này sẽ góp phần thúc đẩy phong trào bóng rổ học đường, lan tỏa lối sống tích cực và truyền cảm hứng để sinh viên tự tin theo đuổi đam mê, phát huy năng lực của bản thân.”\r\n\r\nBà Nguyễn Thanh Anh, Giám đốc Tiếp thị và Thương mại Doanh nghiệp, Đại diện Grab Việt Nam cho biết: \r\n\r\n“Hợp tác với Trung ương Hội Sinh viên Việt Nam và Giải Bóng rổ Chuyên nghiệp đã tạo điều kiện cho chúng tôi tiếp tục hiện thực hóa cam kết đồng hành và hỗ trợ cho sự phát triển của giới trẻ Việt Nam. Thời gian qua, Grab đã tích cực cung cấp các giải pháp đi lại, tiêu dùng linh hoạt, tiết kiệm cho người dùng trẻ và triển khai những cuộc thi về chuyên môn giúp sinh viên có môi trường rèn luyện và nâng cao kỹ năng. Với hợp tác này, chúng tôi mở rộng sang các dự án giúp giới trẻ được kết nối với các hoạt động thể chất lành mạnh và có cơ hội để chứng minh đam mê thể thao của họ. Đây là cách để Grab cùng các đối tác của mình góp phần bồi dưỡng một thế hệ thanh niên phát triển toàn diện, đáp ứng nhu cầu về nguồn nhân lực của đất nước trong thời đại mới.”\r\n\r\nÔng Trần Chu Sa, Giám đốc điều hành VBA chia sẻ:\r\n\r\n“Sự đồng hành của Trung ương Hội Sinh viên Việt Nam và Grab cùng VBA mang ý nghĩa thiết thực trong việc mở rộng sân chơi, tăng cường kết nối và tạo thêm cơ hội phát triển cho các tài năng trẻ yêu bóng rổ, đặc biệt là sinh viên. Chúng tôi kỳ vọng hợp tác này sẽ góp phần lan tỏa tinh thần thể thao tích cực, nuôi dưỡng đam mê, đồng thời xây dựng nền tảng vững chắc hơn cho hành trình phát triển lâu dài của bóng rổ Việt Nam từ phong trào đến chuyên nghiệp”\r\n\r\n', '2026-04-02 14:35:28', 0, 7, '1775140528_bongro2.jpg', 1),
(7, '\'Bộ đôi\' Sophia, Tâm Ken gây tiếc nuối ở PPA Hanoi Cup 2026', 'Sophia Phương Anh - Sophia Huỳnh Trần dừng bước tại vòng 16 nội dung đôi nữ ở PPA Hanoi Cup 2026 sau thất bại trước cặp đấu đến từ Mỹ và Canada.\r\nChiều 2/4, bộ đôi Sophia Phương Anh và Sophia Huỳnh Trần Ngọc Nhi chính thức dừng bước tại vòng 16, khi thất bại trước Tyra Black (Mỹ) và C. Parenteau (Canada), qua đó bỏ lỡ cơ hội giành vé vào tứ kết tại giải PPA Asia 1000 - MB Hanoi Cup 2026.\r\n\r\nỞ set mở màn, hai tay vợt trẻ khởi đầu đầy mạnh mẽ khi giành điểm số đầu tiên, nhưng nhanh chóng để mất thế trận. Đối thủ liên tiếp ghi điểm, kiểm soát nhịp độ và tạo cách biệt lớn trước khi khép lại set với tỷ số 11-2.\r\n\r\nSang set thứ hai, cục diện không có nhiều thay đổi, cặp đấu đến từ Mỹ và Canada tiếp tục duy trì áp lực, chơi chắc tay và giành chiến thắng 11-0, qua đó kết thúc trận đấu trong thời gian ngắn.\r\n\r\nTrận đấu kết thúc khá nhanh khiến nhiều khán giả tiếc nuối, đặc biệt khi bộ đôi Sophia được kỳ vọng có thể tiến sâu hơn trên sân nhà. Tuy vậy, trước đối thủ có thứ hạng và kinh nghiệm vượt trội, họ chưa thể tạo ra bước ngoặt để lật ngược tình thế.\r\nTrước đó, để góp mặt ở vòng 16, Phương Anh và Ngọc Nhi đã trải qua trận đấu căng thẳng với Katie Morris và Kaitlynn Hart vào sáng nay.\r\n\r\nỞ set đầu tiên, dù bị dẫn trước nhiều điểm, bộ đôi vẫn nỗ lực rút ngắn cách biệt, cân bằng điểm số 10-10 rồi giành chiến thắng nghẹt thở với tỷ số 14-12.\r\n\r\nSang set thứ hai, họ có thời điểm chạm mốc 10 điểm trước nhưng lại đánh mất lợi thế và để thua 9-11. Bước vào set quyết định, hai bên giằng co quyết liệt trước khi bộ đôi Sophia khép lại trận đấu với tỷ số 11-6, qua đó giành tấm vé đi tiếp.\r\n\r\nSophia Phương Anh (2008) và Sophia Huỳnh Trần (2007) là hai tài năng trẻ nổi bật của pickleball Việt Nam. Phương Anh từng vô địch Jenius Bank World Championships 2025 và giành 4 HCV tại WPC Series Indonesia 2024. Trong khi đó, Huỳnh Trần cũng đạt 2 HCV đánh đôi tại Giải Vô địch Châu Á và Châu Á mở rộng (AOPC) 2024.\r\n\r\nNgoài ra, tại giải PPA lần này, ở nội dung đơn nữ, Sophia Huỳnh Trần có hành trình đáng chú ý khi tiến vào vòng loại cuối. Tuy nhiên, dù thi đấu nỗ lực, cô đã dừng bước sau thất bại 1-2 trước tay vợt giàu kinh nghiệm Louise Kwong, qua đó khép lại phần thi đấu của mình.\r\n\r\nTrong khi đó, Tâm Ken (Hồ Tâm) cũng ghi nhận nỗ lực khi vượt qua vòng loại để góp mặt ở Main Draw. Dẫu vậy, trước đối thủ được đánh giá cao là Katie Morris (Anh) tại vòng 32, cô không thể tạo nên bất ngờ. Thế trận phần lớn nghiêng về Morris, người giành chiến thắng sau hai set với các tỷ số 11-2 và 11-4\r\n\r\nPPA Tour hiện được xem là một trong những hệ thống giải đấu pickleball chuyên nghiệp có tính cạnh tranh cao, quy tụ nhiều vận động viên hàng đầu thế giới. Giải đấu nằm trong hệ sinh thái của United Pickleball Association (UPA), đơn vị cũng sở hữu Major League Pickleball (MLP), qua đó góp phần nâng tầm quy mô và chất lượng cho bộ môn này trên toàn cầu.', '2026-04-02 14:40:15', 0, 8, '1775140815_pick1.jpg', 1),
(8, 'Lý Hoàng Nam xuất sắc giành chiến thắng trước tay vợt Top 4 đơn nam PPA Christian Alshon ở loạt 16 nội dung đơn nam PPA Asia 1000 - MB Hanoi Cup 2026.', 'Ngày thi đấu thứ 2 (2/4) của PPA Asia 1000 - MB Hanoi Cup 2026 diễn ra tại Cung Điền kinh Mỹ Đình, ghi nhận những trận đấu nảy lửa. Đáng chú ý, Lý Hoàng Nam giữ vững phong độ, thể hiện xuất sắc, giành chiến thắng trước đối thủ “nặng ký” Christian Alshon - tay vợt Top 4 đơn nam PPA.\r\n\r\nChiến thắng 2-1 với tỷ số chênh lệch ít cho thấy một trận đấu cam go, căng thẳng. Những pha giằng co bóng căng thẳng giúp trận đấu ở loạt 16 trở nên kịch tính, hấp dẫn. Lý Hoàng Nam tiếp tục khẳng định bản lĩnh thi đấu sau khi đánh bại đối thủ ngang tài ngang sức.\r\n\r\nTrước đó, ở loạt 32, Hoàng Nam cũng chiến thắng đồng hương Xuân Vũ với tỷ số 2-1, giành quyền đi tiếp. Anh được kỳ vọng giữ vững tinh thần, tiếp tục tỏa sáng trong các trận đấu tiếp theo.\r\n\r\nCũng ở loạt 16 nội dung đơn nam, Trương Vinh Hiển giành chiến thắng 2-0 dễ dàng trước tay vợt Nhật Bản Kenta Miyoshi. Như vậy, tay vợt này sẽ tiến sâu hơn vào vòng trong cùng đàn anh Lý Hoàng Nam, cho thấy sự áp đảo của VĐV Việt Nam ở hạng mục thi đấu này.\r\n\r\nỞ loạt 32 trước đó, Vinh Hiển cũng xuất sắc đánh bại đối thủ Yuta Funemizu với tỷ số 2-0, chiến thắng thuyết phục, nghiễm nhiên giành quyền đi tiếp.\r\n\r\nLý Hoàng Nam giành chiến thắng trước đối thủ \"nặng ký\" Christian Alshon sau trận đấu cam go, giành suất đi tiếp ở nội dung đơn nam trong khuôn khổ PPA Hanoi Cup 2026.\r\nĐáng tiếc, Trịnh Linh Giang để thua 2-0 trước đối thủ Dylan Frazier ở loạt 16, không thể tiến sâu hơn với nội dung đơn nam. Anh đã có màn thi đấu ấn tượng trong ngày mở màn, nhưng chưa thể hiện tốt ở ngày thứ 2, khiến cổ động viên Việt Nam không khỏi tiếc nuối.\r\n\r\nHôm 1/4, ở nội dung đơn nam, Trịnh Linh Giang thắng áp đảo trước Kento Tamaki với tỷ số 2-0, nhận suất đi tiếp. Anh cũng là tay vợt Việt Nam duy nhất bước vào vòng Main Draw với nội dung đôi nam, giành chiến thắng cùng đồng đội Vanshik Kapadia.\r\n\r\nCác cặp đấu khác có VĐV Việt, bao gồm Đắc Tiến - Quốc Khánh, Quang Trường - Nicholas, để thua đáng tiếc dù đã vào tới vòng cuối. Đạt Trố - Triệu Cầu Lông cũng dừng bước sớm khi gặp Văn Phương - Trung Tính.\r\n\r\nPPA Tour hiện được xem là hệ thống giải đấu pickleball chuyên nghiệp có sức cạnh tranh cao nhất, quy tụ nhiều tay vợt hàng đầu. Giải thuộc hệ sinh thái của UPA (United Pickleball Association), đơn vị cũng sở hữu Major League Pickleball (MLP).\r\n\r\n', '2026-04-02 14:42:35', 0, 8, '1775140955_pick2.webp', 1),
(9, 'PPA Hanoi Cup 2026 \'cháy vé\', hạng VVIP chạm mốc 25 triệu đồng', 'Sát ngày khởi tranh giải đấu PPA Asia 1000 - MB Hanoi Cup 2026, thị trường mua bán vé ghi nhận dấu hiệu tăng nhiệt.\r\n\r\nTheo quan sát của Tri Thức - Znews, trên các hội nhóm pickleball, nhu cầu tìm mua vé liên tục gia tăng, nhiều khán giả chấp nhận trả mức giá cao hơn để sở hữu tấm vé theo dõi trực tiếp các trận đấu.\r\n\r\nNgay trong ngày đầu mở bán ngày 6/3, giải hạng vé cao nhất VVIP/Hanoi Center (20 triệu đồng), khu vực chỗ ngồi trung tâm sát sân, kèm loạt quyền lợi như áo thi đấu, túi tote, khăn thể thao, quạt cầm tay, kỷ niệm chương và quyền truy cập VIP lounge, đã hết sạch chỉ sau 1 giờ.\r\n\r\nTheo công bố từ ban tổ chức, hệ thống vé được chia thành nhiều phân khúc, trải dài từ phổ thông đến cao cấp. Bên cạnh hạng VVIP, nhóm vé VIP cao cấp được niêm yết ở mức 15 triệu đồng, trong khi các hạng trung cấp dao động từ 2,5 đến 3,5 triệu đồng. Ở phân khúc phổ thông, giá vé khởi điểm từ 130.000 đồng, áp dụng cho các khu vực như Cửa Nam, Cửa Bắc và thay đổi tùy theo ngày thi đấu.\r\n\r\nLucky Draw (bốc thăm trúng thưởng) cũng được triển khai cho khán giả tham dự trong 3 ngày thi đấu đầu tiên\r\n\r\nTuy nhiên, khi giải đấu cận kề thời điểm diễn ra (ngày 1-5/4 tại Cung Điền kinh Mỹ Đình), thị trường thứ cấp bắt đầu sôi động. Nhiều vé được rao bán lại với mức giá cao hơn đáng kể so với niêm yết ban đầu. Một số vé chung kết được chào bán lên tới 25 triệu đồng, trong khi vé VIP phổ biến được giao dịch quanh mức 22 triệu đồng. Các hạng vé trung cấp (2,5–3,5 triệu đồng) cũng ghi nhận nhu cầu tăng mạnh, phản ánh sức hút lớn của giải đấu.\r\n\r\n\"Nữ hoàng pickleball\" Anna Leigh Waters tham gia giải đấu tại Hà Nội, góp phần kéo theo nhu cầu săn vé từ khán giả. Ảnh: @anna.leigh.waters.\r\nPPA Hanoi Cup 2026 là chặng mở màn của hệ thống PPA Tour Asia, trao 1.000 điểm xếp hạng cho nhà vô địch, với tổng quỹ thưởng lên đến 300.000 USD. Giải đấu thu hút 636 vận động viên đăng ký, bao gồm cả chuyên nghiệp và phong trào – con số kỷ lục trong khu vực.\r\n\r\nSức nóng của sự kiện đến từ sự góp mặt của nhiều tên tuổi hàng đầu thế giới như Anna Leigh Waters, Ben Johns, Federico Staksrud, Tyson McGuffin hay Zane Navratil. Đáng chú ý, đây là lần đầu tiên tay vợt số 1 thế giới Anna Leigh Waters thi đấu quốc tế tại châu Á.\r\n\r\nỞ phía Việt Nam, các gương mặt như Lý Hoàng Nam, Trịnh Linh Giang, Trương Vinh Hiển và Sophia Phương Anh nhận được nhiều kỳ vọng từ khán giả chủ nhà.\r\n\r\nTuy nhiên, sát ngày thi đấu (30/3), VĐV Phúc Huỳnh đã quyết định rút lui. Anh cho biết không đồng tình với điều khoản độc quyền và đặt vấn đề về tính công bằng trong hệ thống giải. Quyết định này khiến nhiều người hâm mộ tiếc nuối, song phần lớn vẫn bày tỏ sự ủng hộ và đồng cảm với lựa chọn của tay vợt.\r\n\r\nSau chặng Hà Nội, Việt Nam sẽ tiếp tục đăng cai một giải đấu thuộc hệ thống vào tháng 8 với Ho Chi Minh City Open, đánh dấu lần thứ hai nước nhà xuất hiện trên bản đồ PPA Tour Asia 2026.', '2026-04-02 14:46:45', 0, 8, '1775141206_pick3.jpg', 1),
(11, 'Ngôi sao bị lãng quên trong ngày Việt Nam đè bẹp Malaysia', 'TPO - Nguyễn Xuân Son và Đỗ Hoàng Hên là 2 cái tên được nhắc đến nhiều sau trận Việt Nam thắng Malaysia 3-1. Tuy nhiên, hậu vệ Trương Tiến Anh, người đóng góp 2 pha kiến tạo, cũng xứng đáng nhận lời khen.\r\nNhững cú tạt chất lượng của Trương Tiến Anh là \"vũ khí\" chính để tuyển Việt Nam khoan thủng hệ thống phòng ngự Malaysia. Phút thứ 6, hậu vệ của CLB Ninh Bình tạt chuẩn mực từ chấm phạt góc, kiến tạo cho Duy Mạnh đánh đầu mở tỷ số. Đến phút 59, từ cánh phải, Tiến Anh tạt bóng như đặt vào đầu Xuân Son, dọn cỗ cho ngôi sao nhập tịch của tuyển Việt Nam ghi bàn nâng tỷ số 3-1.\r\n\r\n\r\n Thêm một trận đấu Tiến Anh cho thấy chất lượng rất cao ở các quả tạt. Trong hiệp một, hậu vệ này có thêm tình huống vẽ đường cong ấn tượng bằng cú tạt, đưa bóng vượt qua tầm truy cản của trung vệ Malaysia và hướng đến vị trí Quang Hải đợi sẵn để volley. Tiếc là cú volley cuối cùng của Quang Hải đưa bóng đi trật mục tiêu.\r\n\r\nXuyên suốt 90 phút, Tiến Anh hoạt động miệt mài ở cánh phải, hỗ trợ phòng ngự tốt và để lại dấu ấn ở mỗi pha dâng lên tấn công. Cánh phải của Tiến Anh nhận bóng không nhiều như hướng đối diện nhưng một lần Tiến Anh có khoảng trống để tạt, đó là lúc Xuân Son, Hoàng Hên bắt đầu chạy chỗ và sự đe dọa cho khu vực cấm địa của Malaysia luôn lớn.\r\n\r\nTiến Anh tạt như đặt cho Xuân Son ghi bàn\r\n\r\nTiến Anh tạt như đặt cho Xuân Son ghi bàn\r\n\r\nCả 2 hậu vệ cánh của tuyển Việt Nam đều chơi tốt trước Malaysia. Tương tự Tiến Anh, Cao Pendant Quang Vinh cũng không được nhắc đến nhiều sau chiến thắng của tuyển Việt Nam. Song, hậu vệ của CAHN đã thể hiện ấn tượng ở cả 2 mặt trận tấn công và phòng ngự, đôi lúc xâm nhập tận khu vực cấm địa của Malaysia từ nguồn thể lực dồi dào.\r\n\r\nTrở lại với Tiến Anh, hậu vệ sinh năm 1999 ngày càng tiến bộ ở CLB và đội tuyển. Còn nhớ dưới triều đại HLV Philippe Troussier, Tiến Anh từng nhận nhiều chỉ trích vì lối chơi thuần túy của một \"công nhân\" ở biên và thiếu tính đột biến. Kỹ năng của Tiến Anh, nổi bật là những đường tạt, tiến bộ rõ từ V.League mùa trước. Đến V.League 2025/26 và các trận đấu gần đây ở đội tuyển, Tiến Anh chứng minh anh đang là chân tạt hàng đầu của bóng đá Việt Nam.\r\n\r\nCác quả tạt của Tiến Anh có độ cuộn và hướng đến điểm rơi rõ ràng. Hậu vệ của Ninh Bình đang làm rất tốt ở các tình huống tạt bổng và thực hiện quả tạt phạt góc. Với những tình huống căng ngang hoặc tạt sớm, Tiến Anh vẫn cần hoàn thiện nhiều hơn để đa dạng các phương án kiến tạo từ biên.\r\n\r\nThống kê từ Sofascore chỉ ra Tiến Anh có 3,3 lần tạt chính xác ở V.League 2025/26, bên cạnh đó là 3,1 đường chuyền dài thành công. Từ các quả tạt hoặc căng ngang ở biên, Tiến Anh tạo ra 2,1 key pass mỗi trận (đường chuyền tạo cơ hội) và đã có 5 kiến tạo sau 15 trận ra sân.\r\n\r\nVới phong độ đó, Tiến Anh là sự lựa chọn số 1 của HLV Kim Sang-sik cho vị trí hậu vệ phải của tuyển Việt Nam. Và với đôi cánh Tiến Anh - Quang Vinh, \"Chiến binh sao vàng\" ngày càng có nhiều phương án tấn công từ 2 hành lang cánh.', '2026-04-02 14:52:39', 0, 1, '1775141560_bongda1.jpg', 1),
(12, 'Truyền thông ĐNÁ phát sốt vì CĐV Việt Nam và Malaysia tay bắt mặt mừng', 'Ngay cả khi tuyển Việt Nam giành chiến thắng 3-1 trước Malaysia trên sân Thiên Trường tối 31/3, điều khiến truyền thông Đông Nam Á dành nhiều sự quan tâm sau trận lại không chỉ nằm ở chuyên môn. Bầu không khí trên khán đài và ngoài đường phố sau tiếng còi mãn cuộc mới là chi tiết tạo nên sức hút đặc biệt cho trận cầu nhiều duyên nợ này.\r\n\r\nTrong lúc hàng nghìn CĐV chủ nhà tràn xuống các tuyến phố quanh sân để ăn mừng, một hình ảnh bất ngờ đã xuất hiện và nhanh chóng gây chú ý: người hâm mộ Malaysia cũng hòa vào dòng người chung vui cùng CĐV Việt Nam. Chính khoảnh khắc giao thoa hiếm thấy ấy đã trở thành tâm điểm, khi truyền thông khu vực xem đây là minh chứng đẹp cho tinh thần bóng đá vượt lên trên thắng thua.\r\n\r\nSau trận đấu ngày 31/3, cờ đỏ sao vàng phủ kín nhiều ngả đường quanh khu vực sân Thiên Trường, hòa cùng những tiếng hô vang quen thuộc tạo nên bầu không khí lễ hội rực lửa. Chiến thắng 3-1 không chỉ nối dài mạch kết quả tích cực của tuyển Việt Nam, mà còn khiến cảm xúc của người hâm mộ bùng nổ trong một đêm được xem là rất khó quên.\r\n\r\n\r\nGiữa “cơn lốc đỏ” ấy, sự xuất hiện của các CĐV Malaysia trong trang phục vàng đen trở thành điểm nhấn đặc biệt. Thay vì lặng lẽ ra về sau thất bại, họ ở lại, xuống phố, cùng nhảy múa và chia sẻ niềm vui với các CĐV chủ nhà. Chính điều đó khiến nhiều trang thể thao khu vực dành sự chú ý cho khía cạnh văn hóa cổ vũ nhiều hơn là chỉ xoáy vào tỷ số trên sân.\r\n\r\nTrang Asean Football đăng một đoạn mô tả được lan truyền rộng rãi đã tóm gọn tinh thần của khoảnh khắc này: “Bất chấp kết quả trên sân, bóng đá một lần nữa cho thấy sức mạnh kết nối của mình. Sau trận đấu ngày 31/3, người hâm mộ Việt Nam và Malaysia đã cùng nhau nhảy múa, ăn mừng và tạo nên những khoảnh khắc khó quên.” Đi kèm là thông điệp ngắn gọn nhưng giàu cảm xúc: “Không còn đối địch. Chỉ còn đam mê.Chung một tình yêu dành cho môn thể thao vua.”\r\n\r\nKhông khí thân thiện nhanh chóng lan tỏa khi CĐV hai bên cùng chụp ảnh, trò chuyện và trao nhau những cái ôm.Một cổ động viên nổi tiếng người Hàn Quốc cũng xuất hiện, cầm ảnh bác Hồ và hòa vào dòng người ăn mừng, góp phần làm cho bức tranh sau trận thêm đa sắc màu và mang đậm tính kết nối của bóng đá khu vực.\r\n\r\nHòa trong dòng người “đi bão”, một CĐV Malaysia chia sẻ đầy thiện chí: “Chúc mừng Việt Nam, các bạn đã chơi một trận đấu quá hay, dù đội tuyển của chúng tôi thua, nhưng tinh thần bóng đá và sự hiếu khách của người dân Việt Nam khiến tôi muốn ở lại để cùng tận hưởng niềm vui này.Thất bại trên sân cỏ không ngăn cản chúng tôi trở thành những người bạn.” Với truyền thông Đông Nam Á, có lẽ chính những khoảnh khắc như vậy mới là điều khiến bóng đá thực sự đáng nhớ.', '2026-04-02 14:54:39', 0, 1, '1775141679_bongda3.jpg', 1),
(14, 'U23 Việt Nam vẫn nhận cúp dù chót bảng giải Trung Quốc', 'U23 Việt Nam đã khép lại hành trình tại giải giao hữu CFA Team China 2026 với vị trí cuối bảng, nhưng vẫn nhận được một chiếc cúp kỷ niệm, chi tiết thú vị gây chú ý với người hâm mộ.\r\n\r\n\r\nỞ lượt trận cuối diễn ra tối 31/3, thầy trò Quyền HLV trưởng Đinh Hồng Vinh chạm trán chủ nhà U23 Trung Quốc. Dù thi đấu nỗ lực và nhập cuộc tự tin, U23 Việt Nam vẫn phải nhận thất bại 0-1 sau cú sút xa của Du Yuezheng ở phút 39.\r\n\r\nTrong trận đấu này, ban huấn luyện tiếp tục xoay tua mạnh mẽ với 6 sự thay đổi trong đội hình xuất phát nhằm tạo cơ hội cho nhiều cầu thủ trẻ thể hiện. Dù tạo ra một số cơ hội đáng chú ý, hàng công U23 Việt Nam không thể tận dụng, trong khi thủ môn Cao Văn Bình là điểm sáng với nhiều pha cứu thua quan trọng.\r\n\r\nSang hiệp 2, đội bóng áo đỏ đẩy cao đội hình tìm kiếm bàn gỡ, nhưng sự thiếu chính xác trong khâu dứt điểm khiến họ không thể thay đổi cục diện. Chung cuộc, U23 Việt Nam chấp nhận thất bại tối thiểu và kết thúc giải với nhiều bài học chuyên môn.\r\n\r\nTrước đó, U23 Việt Nam có trận hòa 1-1 trước U23 Triều Tiên ở ngày ra quân, trước khi lần lượt thua U23 Thái Lan và U23 Trung Quốc cùng tỷ số 0-1. Với thành tích này, đội bóng của HLV Đinh Hồng Vinh xếp hạng tư chung cuộc, trong đó Nguyễn Minh Tâm là cầu thủ ghi bàn duy nhất cho đội.\r\n\r\nDù đứng cuối bảng, U23 Việt Nam vẫn nhận được một chiếc cúp lưu niệm từ ban tổ chức, điều mà tất cả các đội tham dự đều có. Đây được xem là điểm nhấn thú vị của giải đấu năm nay, khi cả đội xếp thứ ba như U23 Thái Lan cũng được trao cúp để ghi nhận sự tham dự.\r\n\r\nU23 Thái Lan cũng nhận 1 chiếc cúp lưu niệm tương tự khi về ba tại CFA Team China 2026 (Ảnh: Changsuek).\r\nSau khi kết thúc giải đấu, toàn đội đã trở về nước vào ngày 1/4, chia thành hai nhóm hạ cánh tại Hà Nội và TP.HCM. Ngay sau đó, ban huấn luyện quyết định cho các cầu thủ xả trại, khép lại đợt tập trung tháng 3/2026. Các cầu thủ nhanh chóng trở lại CLB chủ quản để tiếp tục thi đấu tại các giải quốc nội.\r\n\r\nDù kết quả chưa như kỳ vọng, giải đấu tại Tây An mang ý nghĩa quan trọng về mặt chuyên môn. Với lực lượng chủ yếu là các cầu thủ sinh từ năm 2005 trở về sau, đây là lần đầu tiên nhiều gương mặt trẻ được thi đấu cùng nhau ở cấp độ U23. Ban huấn luyện đã tận dụng cơ hội để thử nghiệm đội hình, đánh giá năng lực và tăng cường sự gắn kết.\r\n\r\nHướng đến các mục tiêu dài hạn như ASIAD 2026 và SEA Games 2027, hành trình của lứa cầu thủ trẻ này vẫn còn ở phía trước. Những trải nghiệm tại CFA Team China 2026 được xem là bước đệm quan trọng để U23 Việt Nam hoàn thiện và trưởng thành hơn trong tương lai.', '2026-04-02 14:56:05', 0, 1, '1775141765_bongda4.jpg', 1),
(15, 'Tennis Việt Nam đặt mục tiêu giành 3 HCV ở SEA Games 31', 'Trong lễ kỷ niệm 30 năm thành lập Liên đoàn Quần vợt Việt Nam tại Hà Nội tối 27/12, Chủ tịch Nguyễn Quốc Kỳ khẳng định sẽ đầu tư mạnh để tennis Việt Nam thành công ở SEA Games 31.\r\nTại SEA Games 30, tennis Việt Nam đã lập thành tích lịch sử với tấm HCV của tay vợt Lý Hoàng Nam sau trận chung kết với đồng đội Daniel Cao Nguyen. Thành tích này là tiền đề để Liên đoàn đặt ra những đích nhắm cao hơn trong chu kỳ 2 năm tới.\r\n\r\nChủ tịch Liên đoàn Nguyễn Quốc Kỳ cho biết: \"Chúng tôi đề ra mục tiêu giành 3 HCV ở SEA Games 31 trên sân nhà\". Ở kỳ SEA Games gần nhất, Philippines chỉ tổ chức 5 nội dung, nhưng có thể ở giải đấu tại Hà Nội năm 2021 sẽ có thêm 2 nội dung đồng đội nam và đồng đội nữ.\r\n\r\nĐể đạt được mục tiêu này, Liên đoàn Quần vợt Việt Nam (VTF) đề ra hàng loạt kế hoạch cụ thể như đưa một giải đấu ATP 250 về tổ chức tại Việt Nam. Đây sẽ là sân chơi lớn để các VĐV Việt Nam như Lý Hoàng Nam, Daniel Cao Nguyen, Trịnh Linh Giang... rèn luyện, bởi nước chủ nhà luôn có ít nhất 2 suất wildcards để vào thẳng vòng đấu chính, chưa kể nhiều VĐV khác có cơ hội thi đấu ở vòng loại.\r\n\r\nTheo hợp đồng VTF ký với đối tác, giải đấu sẽ sớm ra đời và được tổ chức thường niên tại Phan Thiết. VTF sẽ chịu trách nhiệm tổ chức, vận hành, tuyển chọn các tay vợt tham dự. Hiện nay ở khu vực Đông Nam Á, Thái Lan và Malaysia đều không còn tổ chức các giải trong trong hệ thống quần vợt nhà nghề thế giới nên giải ATP 250 tổ chức tại Việt Nam sắp tới sẽ là giải đấu tennis lớn nhất khu vực Đông Nam Á.\r\n\r\nNgoài việc nâng tầm các giải đấu trong thời gian tới, Liên đoàn cũng tích cực tìm kiếm nhà tài trợ cho các tay vợt hàng đầu như Lý Hoàng Nam nhận được số tiền tài trợ cá nhân lên đến 2 tỷ đồng.\r\n\r\nTrong buổi lễ kỷ niệm 30 năm thành lập Liên đoàn Quần vợt Việt Nam, Lý Hoàng Nam cũng là tâm điểm khi được nhận Bằng khen của Thủ tướng Chính phủ sau thành tích HCV đơn nam SEA Games. Liên đoàn Quần vợt Việt Nam cũng nhận được vinh dự này sau quá trình 30 năm gặt hái nhiều thành công.\r\n\r\n', '2026-04-02 15:03:43', 0, 9, '1775142223_quanvot1.jpg', 1),
(16, 'Ciputra Hanoi - Vietnam International Challenge: Những nhà vô địch lộ diện và sức hút từ điểm đến cầu lông Việt Nam', 'Sau những ngày tranh tài rực lửa tại Thủ đô, giải cầu lông Vietnam International Challenge 2026 đã xác định được những chủ nhân xứng đáng cho ngôi vị cao nhất. \r\n\r\nNgày thi đấu chung kết tại Ciputra Hanoi - Vietnam International Challenge 2026 đã chứng kiến sự bùng nổ của các tay vợt quốc tế. Ở nội dung Đơn nam, hạt giống số 13 Richie Duta Richardo (Indonesia) đã chứng minh tại sao cầu lông xứ vạn đảo luôn là thế lực đáng gờm. Anh duy trì sự ổn định tuyệt vời để đánh bại đối thủ đến từ Đài Bắc Trung Hoa với tỷ số thuyết phục 21-13, 21-14, đăng quang ngôi vô địch.\r\n\r\nTrong khi đó, nội dung Đơn nữ lại mang đến một kịch bản giàu cảm xúc. Hạt giống số 2 Rakshitha Sree Santhosh Ramraj (Ấn Độ) đã có màn ngược dòng ngoạn mục trước Lo Sin Yan Happy (Hong Kong, Trung Quốc). Sau khi để thua set đầu 16-21, tay vợt người Ấn Độ đã bứt phá ở những pha cầu quyết định để thắng lại 21-15 và 21-16, khẳng định bản lĩnh của một hạt giống hàng đầu.\r\n\r\nCặp liên quân Gronya Somerville (Australia) và Josephine Wu (Canada) vô địch Đôi nữ.\r\nNội dung Đôi nam nữ khép lại với nốt trầm đáng tiếc nhất giải đấu. Cặp đôi Chan Jin Chak và NG Tsz Yau (Hong Kong, Trung Quốc) đã giành chức vô địch sau khi tay vợt nữ siêu sao Nami Matsuyama (Nhật Bản) gặp chấn thương nặng và buộc phải bỏ cuộc. Sự cố này không chỉ khiến khán giả Việt Nam hụt hẫng, mà còn là một mất mát lớn cho chất lượng chuyên môn của trận chung kết, khi Nami vốn là cái tên thu hút lượng lớn khán giả đến sân.\r\n\r\nTrái ngược với sự chóng vánh đó, nội dung Đôi nữ và Đôi nam lại là những cuộc \"marathon thể lực\":\r\n\r\nĐôi nữ: Cặp liên quân Gronya Somerville (Australia) và Josephine Wu (Canada) đã vượt qua hai tay vợt Nhật Bản trong một trận đấu căng thẳng tột độ với tỷ số sát nút 16-21, 21-19 và 24-22.\r\n\r\nĐôi nam: Bộ đôi Huang Tsung-I và Lin Ting-Yu (Đài Bắc Trung Hoa) thể hiện tâm lý vững vàng để đánh bại cặp đôi Ấn Độ sau 3 set đấu nghẹt thở: 26-24, 17-21, 21-18.\r\n\r\nViệc một giải đấu cấp độ Challenger tại Việt Nam quy tụ được dàn vận động viên từ các cường quốc cầu lông như Nhật Bản, Indonesia, Ấn Độ mang lại những giá trị kinh tế và thương hiệu không nhỏ:\r\n\r\nNâng tầm hệ sinh thái cầu lông nội địa: Sự xuất hiện của các ngôi sao như Nami Matsuyama hay các hạt giống hàng đầu giúp các vận động viên Việt Nam có cơ hội cọ xát đỉnh cao ngay tại sân nhà mà không cần tiêu tốn ngân sách thi đấu quốc tế lớn.\r\n\r\nSức hút từ tài trợ và truyền thông: Các trận chung kết kéo dài 3 set với kịch bản kịch tính chính là \"thời điểm vàng\" để quảng bá các thương hiệu đồng hành. Việc duy trì được lượng khán giả lấp đầy nhà thi đấu chứng minh cầu lông là một sản phẩm giải trí thể thao có khả năng thương mại hóa cao tại thị trường Việt Nam.\r\n\r\nTín hiệu cho du lịch thể thao: Sự thành công của giải đấu là minh chứng cho năng lực tổ chức sự kiện quốc tế của Hà Nội, góp phần thúc đẩy mô hình du lịch thể thao thông qua việc đón tiếp hàng trăm vận động viên và ban huấn luyện quốc tế lưu trú dài ngày.', '2026-04-02 15:03:51', 0, 2, '1775142231_bc3.jpg', 1),
(17, 'Thua Iran 0-5, tuyển tennis Việt Nam rớt hạng', 'Thất bại cả 5 trận đánh đơn và đôi trước Iran với đội hình què quặt, tuyển tennis Việt Nam rớt xuống nhóm III khu vực châu Á/châu Đại Dương.\nSau khi thua Hong Kong tại vòng 1 Davis Cup 2017 nhóm II khu vực châu Á – châu Đại Dương hồi tháng 2 năm nay, tuyển tennis Việt Nam phải đến Iran thi đấu tranh vé trụ hạng (từ 7 đến 9/4).\n\nTrong ngày đầu tiên, thất bại của Minh Tuấn và Hoàng Thiên bị chấn thương bỏ cuộc ở nội dung đánh đơn khiến tuyển Việt Nam thua chóng vánh nước chủ nhà 0-2.\n\nMọi hy vọng mong manh được dồn cả vào trận đánh đôi diễn ra trong ngày 9/5. Tuy nhiên, đôi Minh Tuấn – Quốc Khánh không thể tạo nên điều bất ngờ khi thua cả 3 set cùng tỷ số 4-6 trước đôi Madanchi – Shokoofi.\n\nHai trận đánh đơn còn lại vì vậy chỉ mang ý nghĩa thủ tục. Lê Quốc Khánh, vốn không có sở trường đánh đơn, phải thay thế đàn em Hoàng Thiên đã gác vợt 0-2 (3-6, 2-6) trước Madanchi, còn Minh Tuấn “chốt” lại một giải đấu thảm bại bằng tỷ số 0-2 (3-6, 3-6) trước Reza Nadaf.\n\nThua Iran với tổng tỷ số 0-5, tuyển tennis Việt Nam với đội hình què quặt (vắng Hoàng Nam trước ngày lên đường, sang đến Iran lại thêm Hoàng Thiên chấn thương), đã rớt xuống nhóm III khu vực châu Á/châu Đại Dương. ', '2026-04-02 15:05:39', 0, 9, '1775142339_quanvot2.jpg', 1),
(18, 'Hoa khôi bóng chuyền Việt Nam lên tiếng về chấn thương sau khi vắng mặt ở giải đấu lớn', 'Chủ công Hoàng Thị Kiều Trinh tiết lộ chấn thương của bản thân và nhận được lời động viên của người hâm mộ.\r\n\r\nChủ công Hoàng Thị Kiều Trinh của CLB Binh Chủng Thông Tin đã gặp chấn ở tay trong quá trình tập luyện khi chuẩn bị cho Cúp Hoa Lư 2026. Vì vậy, cô đã không tham dự giải đấu diễn ra vào tháng trước. Nhiều CĐV lo lắng liệu Kiều Trinh có kịp hồi phục để tham dự vòng 1 giải vô địch quốc gia 2026 diễn ra từ ngày 6-19/4 tại Hà Nội hay không.\r\n\r\nHoa khôi bóng chuyền Việt Nam lên tiếng về chấn thương sau khi vắng mặt ở giải đấu lớn - Ảnh 1.\r\nKiều Trinh lên tiếng về chấn thương\r\n\r\nSau đó, HLV Phạm Văn Long sau xác nhận đối chuyền Hoàng Thị Kiều Trinh khó kịp bình phục chấn thương xương để dự giai đoạn 1 giải VĐQG các CLB 2026.\r\n\r\nMới đây nhất, Kiều Trinh đăng tải trên trang cá nhân hình ảnh một bên tay băng bó kèm dòng trạng thái: \"Bác sĩ bảo hạn chế vận động…nên chỉ đi uống trà sữa thôi\".\r\n\r\nDưới bài đăng, nhiều CĐV gửi lời động viên cho Kiều Trinh và chúc cô mau bình phục. Tài khoản Phạm Văn Hùng viết: \"Chúc cháu nhanh khỏi trở lại sân chơi nhé\".\r\n\r\nHoa khôi bóng chuyền Việt Nam lên tiếng về chấn thương sau khi vắng mặt ở giải đấu lớn - Ảnh 2.\r\nKiều Trinh đã bỏ lỡ Cúp Hoa Lư 2023 vì chấn thương - Ảnh: FBNV\r\n\r\n\"Sớm bình phục nha em\", tài khoản Nguyễn Hương bình luận.\r\n\r\nThương quá. Lại lỡ hẹn xem em đập bóng rùi. Cố gắng bình phục nhanh còn thi đấu em nhé\", một CĐV khác viết.\r\n\r\nTài khoản Nguyễn Văn Minh viết: \"Mau khoẻ nhé cháu, sớm trở lại và lợi hại hơn xưa nhé!\".\r\n\r\n\"Mong Trinh sớm bình phục\", tài khoản Hoàng Anh viết.\r\n\r\nKiều Trinh là mũi ghi điểm chủ lực của Binh Chủng Thông Tin Binh Đoàn 19 nhờ lối chơi thông minh và khả năng xử lý bóng đa dạng. Tuy nhiên, chấn thương ở tay trái khiến đối chuyền sinh năm 2001 chưa thể thi đấu giai đoạn 1 giải VĐQG 2026, buộc đội bóng phải bổ sung hai ngoại binh Trung Quốc là Che Wenhan và Sun Jie để tăng cường sức tấn công.\r\n\r\nKiều Trinh không những là VĐV bóng chuyền tài năng mà còn sở hữu nhan sắc hiền dịu, thu hút sự chú ý của CĐV. Năm 2023, cô giành giải Hoa khôi bóng chuyền VTV Cup.', '2026-04-02 15:06:22', 0, 5, '1775142383_bc2.jpg', 1),
(19, 'Lộ diện gương mặt được chờ đợi nhất ở tuyển bóng chuyền nữ Việt Nam trong đợt tập trung đầu tiên năm 2026', 'Sau khi kết thúc giai đoạn 1 giải bóng chuyền VĐQG các CLB 2026, tuyển bóng chuyền nữ Việt Nam sẽ tập trung đợt đầu tiên, dự kiến vào cuối tháng này. Gương mặt nào được chờ đợi nhất?\r\n\r\nNăm nay tuyển bóng chuyền nữ Việt Nam sẽ tham dự nhiều giải đấu quan trọng và cũng được kỳ vọng nhiều. Trước mắt, các học trò HLV Tuấn Kiệt sẽ tập trung chuẩn bị tham dự giải đầu tiên là AVC Cup 2026. Đây là giải đấu nằm trong hệ thống giải có tính điểm để xếp hạng các ĐTQG của Liên đoàn bóng chuyền thế giới (FIVB).\r\n\r\nTuyển nữ Việt Nam đã vô địch giải này 3 kỳ liên tiếp gần nhất nhưng năm nay sẽ gặp thử thách nhiều hơn khi giải đấu có sự góp mặt của tuyển nữ Hàn Quốc.\r\n\r\nLý Thị Luyến chơi tốt ở CLB Nakhon Ratchasima tại giải VĐQG Thái Lan\r\n\r\nLý Thị Luyến chơi tốt ở CLB Nakhon Ratchasima tại giải VĐQG Thái Lan\r\n\r\nĐể chuẩn bị cho AVC Cup 2026, dự kiến diễn ra vào tháng 6 năm nay, HLV Tuấn Kiệt sẽ triệu tập một danh sách sơ bộ các cầu thủ trước khi gút lại danh sách chính thức.\r\n\r\nMới chỉ là dự đoán nhưng danh sách sơ bộ của đội bóng chuyền nữ quốc gia trong đợt triệu tập đầu tiên của năm nay có thể sẽ bao gồm nhiều gương mặt cả cũ lẫn mới.\r\n\r\nDanh sách sơ bộ có thể bao gồm Trần Thị Thanh Thúy, Như Quỳnh, Quỳnh Hương, Ánh Thảo, Nguyễn Huỳnh Phương Thùy, Tú Linh, Nguyễn Thị Uyên, Hoàng Hồng Hạnh (chủ công),\r\n\r\nKiều Trinh, Bích Huệ, Kim Thanh, Trà My (đối chuyền), Trần Thị Bích Thủy, Lê Thanh Thúy, Lưu Thị Huệ, Như Anh, Phương Quỳnh, Minh Thu, Lý Thị Luyến, Lê Thùy Linh (phụ công), Kim Thoa, Lâm Oanh, Yến Nhi, Đinh Thị Vân (chuyền hai) và Khánh Đang, Ninh Anh, Thảo Nguyên, Cà Thị Tư (libero).\r\n\r\nTrong danh sách nói trên, khả năng thi đấu thực tế của Kiều Trinh và Tú Linh vẫn còn bỏ ngỏ do họ đang chấn thương (Kiều Trinh) hoặc chưa bình phục 100% (Tú Linh).\r\n\r\nGương mặt được chờ đợi nhiều nhất có lẽ là phụ công Lý Thị Luyến. Cô từng góp mặt trong thành phần tuyển bóng chuyền nữ Việt Nam tham dự nhiều giải đấu năm 2023 nhưng không còn được triệu tập trong các năm 2024 và 2025.\r\n\r\nTuy nhiên, Lý Thị Luyến cho thấy những dấu hiệu tích cực trong hai hình trình xuất ngoại thi đấu ở giải VĐQG Mông Cổ và Thái Lan.\r\n\r\nNếu cô thực sự cải thiện được thể lực và tốc độ chắn bóng thì đây hứa hẹn sẽ là sự củng cố tốt cho vị trí phụ công của tuyển Việt Nam trong bối cảnh Nguyễn Thị Trinh đang nghỉ thi đấu vì lí do gia đình còn Lê Thanh Thúy sắp sang tuổi 31.\r\n\r\nNhững gì Lý Thị Luyến đã thể hiện ở giải VĐQG Mông Cổ và Thái Lan là rất tốt nên cô hoàn toàn có cơ hội trở lại ĐTQG và hơn thế, cô được kỳ vọng sẽ chơi tốt hơn hồi 2023 trong lần trở lại này.', '2026-04-02 15:10:18', 0, 5, '1775142619_bc.jpg', 1),
(20, 'Hoàng Nam giành HCV lịch sử cho tennis Việt Nam', '\r\n\r\nTại Ðại hội Thể thao trẻ châu Á 2013 diễn ra ở Nam Kinh, Trung Quốc, hai cái tên Nguyễn Thị Ánh Viên và Lý Hoàng Nam đã mang về cho đoàn thể thao Việt Nam những tấm HCV quý giá.\r\nNguyễn Thị Ánh Viên hoàn tất cú hat-trick vô địch tại Ðại hội Thể thao trẻ châu Á 2013 khi giành tấm HCV ở nội dung bơi 50 m ngửa diễn ra tối 23/8 với thành tích 29\"26 (29 giây 26). Trước đó, cô gái người Cần Thơ giành HCV 200 m bơi ngửa và 200 m hỗn hợp.\r\n\r\nCòn ở trận chung kết nội dung đơn nam quần vợt, tay vợt Lý Hoàng Nam xuất sắc lội ngược dòng thắng Z. Mendoza của Philippines 6-7, 7-5, 7-5, giành HCV. Thành tích thể hiện sự trưởng thành của Hoàng Nam sau thời gian tập huấn tại Mỹ.\r\n\r\nChiến thắng này giúp Hoàng Nam trở thành tay vợt Việt Nam đầu tiên trong lịch sử giành HCV một giải đấu cấp châu lục. \r\n\r\nVới 5 HCV, 4 HCB và 2 HCÐ, đoàn Việt Nam xếp hạng 7/26 đoàn có huy chương. Dẫn đầu là đoàn Trung Quốc (25, 23, 23), Hàn Quốc (24, 13, 14), Nhật Bản (7, 5, 6). Hai đoàn thuộc khu vực Ðông Nam Á là Thái Lan (6, 15, 15) xếp hạng tư và Singapore (5, 12, 6) xếp hạng sáu.\r\n\r\n', '2026-04-02 15:11:32', 0, 9, '1775142693_quanvot4.jpg', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `status`) VALUES
(1, 'Bóng đá', 1),
(2, 'Cầu lông', 1),
(5, 'Bóng chuyền', 1),
(7, 'Bóng rổ ', 1),
(8, 'Pickleball', 1),
(9, 'Quần Vợt', 1),
(10, 'TỔNG HỢP', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `reported` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`comment_id`, `content`, `created_at`, `user_id`, `article_id`, `reported`) VALUES
(12, 'hello\n', '2026-04-03 12:56:10', 14, 20, 1),
(13, 'hello\n', '2026-04-03 12:56:43', 14, 4, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `article_id`, `created_at`) VALUES
(1, 2, 2, '2026-03-28 15:12:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `history`
--

CREATE TABLE `history` (
  `history_id` int(11) NOT NULL,
  `viewed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `history`
--

INSERT INTO `history` (`history_id`, `viewed_at`, `user_id`, `article_id`) VALUES
(18, '2026-04-02 05:59:25', 0, 3),
(20, '2026-04-02 06:15:38', 10, 3),
(21, '2026-04-02 11:20:47', 1, 2),
(22, '2026-04-02 11:21:21', 9, 2),
(33, '2026-04-02 16:10:02', 8, 4),
(36, '2026-04-02 16:10:20', 8, 9),
(39, '2026-04-02 16:10:55', 8, 11),
(40, '2026-04-02 16:11:11', 8, 3),
(80, '2026-04-03 03:52:29', 9, 20),
(83, '2026-04-03 10:20:08', 1, 20),
(84, '2026-04-03 12:55:53', 14, 20),
(85, '2026-04-03 12:56:14', 14, 19),
(86, '2026-04-03 12:56:19', 14, 18),
(87, '2026-04-03 12:56:29', 14, 2),
(88, '2026-04-03 12:56:33', 14, 3),
(89, '2026-04-03 12:56:36', 14, 4),
(90, '2026-04-03 12:57:12', 15, 20),
(95, '2026-04-04 02:05:10', 8, 20),
(98, '2026-04-04 02:27:34', 8, 18),
(102, '2026-04-04 02:34:16', 8, 19),
(103, '2026-04-04 02:34:20', 8, 17),
(104, '2026-04-04 02:34:29', 8, 6),
(105, '2026-04-04 02:34:45', 8, 14);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `image`
--

CREATE TABLE `image` (
  `image_id` int(11) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `article_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `report`
--

CREATE TABLE `report` (
  `report_id` int(11) NOT NULL,
  `reason` text DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `target_type` varchar(50) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`role_id`, `role_name`, `description`) VALUES
(1, 'admin', NULL),
(2, 'user', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `email`, `role_id`, `avatar`, `status`) VALUES
(1, 'messi', '$2y$10$wDy0.4QoPvE142b3bkqgYeojmuioTNMvBWNdKuZTTW9xzWp6ToUjW', NULL, NULL, NULL, 1),
(8, 'admin', '$2y$10$woYS1nMz3N9tuWmFDw.5y.U/Y1cXQN7m.7ugB2KFpAwYkwsQQWs0y', NULL, 1, '1775141815_ảnh.jpg', 1),
(9, 'Ronaldo', '$2y$10$H29Tq1h0SdzsaHTZC6Kmh.6S1ylU/R/OlSxgzRsuI22gRj5AYA/d6', NULL, NULL, '1774874955_ronaldo.jpg', 1),
(10, 'xyz111', '$2y$10$KkjYdkk/uRTJQLWxCqmuv.umAoXCvrWZ2rr3wnOHcUBAIMgiNjDDm', NULL, NULL, NULL, 1),
(11, 'anh7vapco', '$2y$10$VACfV2DsFwARX7IGGJYtNuzM292A1sgSe5rCDjsQZldJhqqWj6kKO', NULL, NULL, '1775143111_ảnh.jpg', 1),
(12, 'momuoi', '$2y$10$QkYl5bHYKSc3CQpHvbBT/eMvVkYYBj7sB6JkRdrDovz72Ub3FX50y', NULL, NULL, NULL, 1),
(13, 'Vohhui', '$2y$10$Bmptwdqcg0qMCjS6pjGfMObN8SNLhDYzTjGOKZkbr5XjP2CXudSU6', NULL, NULL, NULL, 1),
(14, 'lionelmessi', '$2y$10$N6LNbxOk.gCk0743gnXiUumincCe8BNz9FOP2v7atgu7zyd.4Eo/i', NULL, NULL, NULL, 1),
(15, 'messi123', '$2y$10$hBlP228oNNZVUizuY/Zjbu/Ly2mUW9G0f6pfL8EDuU39Hy1dxvzLi', NULL, NULL, NULL, 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `advertisement`
--
ALTER TABLE `advertisement`
  ADD PRIMARY KEY (`ad_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `article_id` (`article_id`);

--
-- Chỉ mục cho bảng `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `article_id` (`article_id`);

--
-- Chỉ mục cho bảng `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `article_id` (`article_id`);

--
-- Chỉ mục cho bảng `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `advertisement`
--
ALTER TABLE `advertisement`
  MODIFY `ad_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `article`
--
ALTER TABLE `article`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `history`
--
ALTER TABLE `history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
