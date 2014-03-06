-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- 主機: localhost
-- 產生時間： 2014 年 03 月 05 日 18:24
-- 伺服器版本: 5.6.15-log
-- PHP 版本： 5.3.1RC1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 資料庫： `mpi_bookstore`
--

-- --------------------------------------------------------

--
-- 資料表結構 `author`
--

CREATE TABLE IF NOT EXISTS `author` (
  `author_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=71 ;

--
-- 資料表的匯出資料 `author`
--

INSERT INTO `author` (`author_id`, `name`) VALUES
(1, 'David Beckham'),
(2, 'E.H.Gombrich'),
(3, 'Chronicle Books'),
(4, 'Gustav Ecke'),
(5, 'Aaron Copland'),
(6, '豐子愷'),
(7, 'Leander Kahney'),
(8, '飛樂鳥'),
(9, 'Digital Photo'),
(10, '南里空海'),
(11, '土屋恵一郎'),
(12, '市川海老蔵'),
(13, '世阿弥'),
(14, '渡辺保'),
(15, 'Alex Ferguson'),
(16, 'Walter Isaacson'),
(17, 'Nelson Mandela'),
(18, 'Na LI'),
(19, '布什喬治•沃克'),
(20, '天下足球'),
(21, 'Cyrille Lachevre'),
(22, 'David Rockefeller'),
(23, '長野士郎'),
(24, '福本和夫'),
(25, '平田善作'),
(26, '瀬島龍三'),
(27, 'Norman Davies'),
(28, 'Margaret MacMillan'),
(29, 'Anne Frank'),
(30, 'DK Publishing'),
(31, 'Richard Holmes'),
(32, '斯塔夫里阿諾斯'),
(33, '翟文明'),
(34, '李德哈特'),
(35, '艾瑞克·霍布斯鲍姆'),
(36, '李恩杰 '),
(37, '中見利男'),
(38, '下山治久'),
(39, '関根秀樹'),
(40, '家近良樹'),
(41, '落合莞爾'),
(42, 'David Sang'),
(43, 'Dorland'),
(44, 'Christine Caputo'),
(45, '愛德華•T•懷特'),
(46, '邱關源'),
(47, 'Paul Scherz'),
(48, '彼得科恩'),
(49, 'Donald Arthur Norman'),
(50, '前田親範'),
(51, 'John Stillwell '),
(52, '西條敏美 '),
(53, '川口友万'),
(54, '宇佐美公良'),
(55, 'Adobe Creative Team'),
(56, 'Jon Duckett'),
(57, 'Matthew Gast'),
(58, 'Kenneth Cukier'),
(59, 'Daniel P.Bovet'),
(60, '鳥哥'),
(61, '樸靈'),
(62, 'Baron Schwartz'),
(63, 'David Flanagan'),
(64, 'Ben Vinegar'),
(65, 'リブロワークス '),
(66, 'サクサクわかる編集部 '),
(67, '塩田紳二 '),
(68, 'web creators編集部'),
(69, ''),
(70, 'Lillian');

-- --------------------------------------------------------

--
-- 資料表結構 `book`
--

CREATE TABLE IF NOT EXISTS `book` (
  `book_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `book_name` varchar(80) NOT NULL,
  `category_id` smallint(6) unsigned NOT NULL,
  `price` decimal(6,2) unsigned NOT NULL,
  `language_id` smallint(6) unsigned NOT NULL,
  `pages` int(11) unsigned NOT NULL,
  `releaseDate` date NOT NULL,
  `ISBN` varchar(32) NOT NULL,
  `description` text,
  `publisher_id` smallint(6) unsigned NOT NULL,
  `author_id` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `ISBN` (`ISBN`),
  KEY `author_id` (`author_id`),
  KEY `category_id` (`category_id`),
  KEY `publisher_id` (`publisher_id`),
  KEY `language` (`language_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=76 ;

--
-- 資料表的匯出資料 `book`
--

INSERT INTO `book` (`book_id`, `book_name`, `category_id`, `price`, `language_id`, `pages`, `releaseDate`, `ISBN`, `description`, `publisher_id`, `author_id`) VALUES
(1, 'David Beckham', 1, '140.00', 1, 288, '2013-10-31', '0755365895', 'David Beckham is one of the most decorated footballers in the history. With Manchester United (the club he supported as a boy), he won six Premier League titles, two FA Cups and - unforgettably - the Champions League when United claimed their famous Treble at the climax of the 1998-99 season. In also winning championships in Spain with Real Madrid, in the USA with LA Galaxy, and in France with PSG, Beckham became the first Englishman to win league titles in four different countries. His 115 international appearances are a record for an English outfield player, and he is also the first England player to score at three World Cup finals.', 57, 1),
(2, 'The Story of Art', 1, '240.00', 1, 688, '1995-04-09', '0714832472', '　　The most famous and popular book on art ever published, this quintessential introduction to art has been a worldwide bestseller for over four decades. In this completely redesigned 16th edition, Gombrich, a true master, combines knowledge and wisdom with a unique gift for communicating his deep love of the subject. 440 illustrations, 376 in color.', 2, 2),
(3, 'The Art of Pixar, Volume II: 100 Collectible Postcards', 1, '111.60', 1, 100, '2012-09-19', '9781452108513', 'From Ratatouille through Brave, The Art of Pixar: Volume II features gorgeous and illuminating concept art and iconic final frames from the 6 Pixar feature films and 18 short films released from 2007 on.', 3, 3),
(4, 'chinese domestic furniture in photographs and measured drawings', 1, '117.50', 1, 161, '2000-02-01', '0486251713', 'This unabridged reprint of rare classic reviews the origins and development of basic forms and methods of constructing Chinese domestic furnishings -- from the selection of wood to its processing, cutting, joining, ornamentation, and final polishing. Over 160 superb plates include photographs and drawings of tables, chairs, couches, cabinets, cupboards, and wardrobes.', 4, 4),
(5, 'What to Listen For in Music ', 1, '58.00', 1, 304, '2011-02-01', '045153176', 'Whether they listen to Mozart or Duke Ellington, Aaron Copland invites readers to ask two basic questions: Are they hearing everything that is going on? Are they really being sensitive to it? With his provocative suggestions, Aaron Copland guides readers through a deeper appreciation of the most rewarding of all art forms.', 5, 5),
(6, '梵高生活', 1, '35.00', 2, 166, '2013-12-01', '9787513313353', '《梵高生活》是豐子愷編著的梵高傳記，講述了荷蘭繪畫巨匠梵高一生行止和創作歷程。在《梵高生活》中，豐子愷描述了梵高激情洋溢、帶些神經質的鮮明個性，對宗教、繪畫的狂熱和曲折命運，讓讀者感受梵高沒入在藝術中的生命。梵高以短暫生命燃燒的藝術之火，深深影響了二十世紀繪畫藝術。', 6, 6),
(7, '蘋果首席設計師:喬納森傳', 1, '49.00', 2, 324, '2013-12-05', '9787508643182', '《蘋果首席設計師:喬納森傳》是第一本聚焦蘋果首席設計師喬納森•艾夫的傳記。喬納森在英國學習了傳統的工業設計理論，致力於將設計與生產過程相結合，並結合自己對於設計的理解，形成了獨有的喬納森式的設計理念。他將這套理念帶到了蘋果，幫助喬布斯在最艱難的時期完成了復興。每個人都認為蘋果的核心在於喬布斯，但鎂光燈背後的喬納森才是蘋果走出困境的關鍵先生。', 7, 7),
(8, '鉛筆素描從入門到精通', 1, '29.80', 2, 160, '2013-04-01', '9787517006237', '在正式學習素描之前，大家要做好畫前的準備工作：從認識鉛筆開始你的繪畫之旅；橡皮除了擦除修正之外還有許多你不知道的妙用；選用紙張也是一門大學問。接下來進入鉛筆的線條入門練習，讓我們領悟如何通過線條去表現畫面的層次與質感。通過掌握基本的素描技法，在腦海中有了對畫面色調的節奏性和佈局的概念之後，我們在處理畫面時會更加有把握。在有了素描繪製技法的基礎之上，就可以從最簡單的物體開始著手練習，從易到難，循序漸進，最終使你能夠畫出一幅完整、細膩的素描作品來。', 8, 8),
(9, '完美攝影161法則:數碼單反攝影技巧精粹', 1, '49.00', 2, 176, '2011-11-01', '7500697252', '《完美攝影161法則:數碼單反攝影技巧精粹》分基礎講座篇、三分構圖法掌握篇、測試篇和實踐篇4部分，共161條；基則。第一篇中的每一條法則都運用大量的拍攝效果對比和圖例分析，重要知識點被一一標出，方便您理解和記憶。', 9, 9),
(10, '風景繪:28處浪漫風景的色鉛筆圖繪', 1, '35.80', 2, 154, '2013-12-01', '9787517013266', '本書選取了28個世界著名的風景作為案例，或描繪出它們的壯美，或描繪出它們的娟秀，每一幅都有獨特的味道，每一幅都能練習到更多的色鉛筆技法。跟隨本書一邊欣賞，一邊描繪美景吧！收穫一份精神上的洗禮，同時收穫一份色鉛筆技法上的提升。', 8, 8),
(11, '伊勢の神宮 御装束神宝', 1, '252.00', 3, 208, '2014-01-17', '4418132317', '本書では、\r\n貴重な御装束神宝を豊富なカラー写真で紹介するほか、調製者たちが深い祈りと最高の技で調製にあたる模様を紹介。', 10, 10),
(12, '能、ドラマが立ち現れるとき', 1, '189.00', 3, 262, '2014-01-24', '4047035351', '室町以前の文学を再構築し、身体芸の総合芸術へと変革した能。その代表的な作品の舞台から、能という装置と身体によって顕わになるものを凝視し、逸脱のテキスト論を展開。能の見方を挑発する現代能楽解体新書。', 11, 11),
(13, '神さまからのお福分け 海老蔵 縁起物図鑑', 1, '105.00', 3, 224, '2013-12-06', '4062187361', '初代團十郎から始まって、それぞれの時代の中で神々しいまでの力を身につけた先祖たちの在り方を追及するのが、市川家のスピリットだと、市川海老蔵は語っています。', 12, 12),
(14, '風姿花伝・三道 現代語訳付き', 1, '94.00', 3, 447, '2009-09-25', '4044055017', '能の大成者、世阿弥が子のために書いた能楽論。原文と脚注、現代語訳と評釈で読み解く1冊。実践的な内容のみならず、幽玄の本質に迫る芸術論としての価値が高く、人生論としても秀逸。作能の書『三道』を併載。', 11, 13),
(15, '歌舞伎 型の真髄', 1, '273.00', 3, 319, '2013-12-21', '4046532890', '型が違えば動きはもとより、役者の扮装、化粧、舞台装置、登場する人物の人間像までが大きく異なる。歌舞伎評論の泰斗が、120点余の写真と丁寧な解説で、「型」の本質と魅力を紹介。深遠な芸の世界へと誘う。', 11, 14),
(16, 'Alex Ferguson: The Autobiography', 2, '271.48', 1, 402, '2013-10-24', '0340919396', 'Widely considered to be the greatest manager in the history of British football, Sir Alex has been reflecting on and jotting down the highlights of his quite extraordinary career for the last four years. In his new book,Alex Ferguson: My Autobiography, he will reflect on his almost 27 years at Manchester United. It is a story that promises to reveal, entertain and inspire.', 12, 15),
(17, 'Steve Jobs', 2, '222.18', 1, 630, '2011-11-21', '1451648537', 'Based on more than forty interviews with Jobs conducted over two years—as well as interviews with more than a hundred family members, friends, adversaries, competitors, and colleagues—Walter Isaacson has written a riveting story of the roller-coaster life and searingly intense personality of a creative entrepreneur whose passion for perfection and ferocious drive revolutionized six industries: personal computers, animated movies, music, phones, tablet computing, and digital publishing. ', 13, 16),
(18, 'A Long Walk to Freedom', 2, '70.00', 1, 896, '2008-06-02', '0316034789', 'He riveting memoirs of the outstanding moral and political figure of our time, Long Walk to Freedom is the exhilarating story of Nelson Mandela epic life; a story of hardship, resilience and ultimate triumph told with the clarity and eloquence of a born leader.', 14, 17),
(19, 'Li Na:My Life', 2, '135.00', 1, 273, '2013-12-01', '0143800051', 'Outspoken and immensely likeable, Li Na is one of the world’s top ten players. In My Life, she tells her remarkable story of ups and downs with honesty and humour.', 15, 18),
(20, 'Einstein: His Life and Universe', 2, '253.00', 1, 704, '2007-04-10', '0743264738', 'By the author of the acclaimed bestseller Benjamin Franklin, this is the first full biography of Albert Einstein since all of his papers have become available.', 13, 16),
(21, '抉擇時刻:喬治•沃克•布什自傳', 2, '48.00', 2, 446, '2011-08-01', '7508628683', '《抉擇時刻:喬治•沃克•布什自傳》是一部具有開創性的、令人耳目一新的總統回憶錄，從沒有一本國家領導人的自傳寫得如此誠懇，它將令支持者動容，令批評者驚詫，它將改變世人對美國歷史這不平凡的8年及對喬治•沃克•布什本人的看法。', 7, 19),
(22, '史蒂夫•喬布斯傳', 2, '105.00', 2, 645, '2011-11-01', '9787508630786', '《史蒂夫•喬布斯傳》由著名作家沃爾特•艾薩克森（Walter Isaacson）在過去兩年與喬布斯面對面交流40多次、對喬布斯100多位家庭成員、朋友、競爭對手和同事的採訪的基礎上撰寫而成。', 7, 16),
(23, '優雅與權勢:克里斯蒂娜•拉加德', 2, '38.00', 2, 229, '2012-12-01', '7508636759', '優雅與權勢:克里斯蒂娜•拉加德》內容簡介：克里斯蒂娜•拉加德，擁有溫柔與鐵腕並存的特質，被稱為金融世界的可可-香奈兒。', 7, 21),
(24, 'ロックフェラー回顧録', 2, '273.00', 3, 652, '2007-10-24', '4105056514', '石油で巨万の富を築いた祖父、慈善家として有名な両親、副大統領で夢絶たれた兄、資本主義に反発する子供たち----「アメリカ史上最強の一族」によって初めて書かれた貴重な自叙伝。長年にわたってロックフェラー家の党首をつとめ、またチェース銀行の頭取として歴史を動かしてきた著者が、九十余年の人生を振り返った。米国でのベストセラー、待望の日本版発売。', 16, 22),
(25, 'わたしの20世紀―長野士郎回顧録', 2, '250.00', 3, 292, '2004-09-04', '4313810099', '元岡山県知事として、「逐条地方自治法」の編著者として地方自治に名を残す長野士郎の回顧録。生い立ちから学生時代、官界から海軍司政官時代、町村合併促進法の制定や地方自治の実践などを、オーラル・ヒストリーを基に編集。', 17, 23),
(26, '革命は楽しからずや―回顧録・霧笛篇 ', 2, '525.00', 3, 405, '2003-12-24', '4875591810', '獄中14年、明鏡止水の境地。「私はよく看守からたずねられたものであった。この不自由なところにいて、どうして、君はいつもそんなにニコニコしていられるのかね」戦前の治安維持法下に、5カ所の刑務所をたらい回しにされた14年間の独房生活。“獄寒”の釧路刑務所の窮境にあっても、あらゆる愚昧に立ちむかい、秘かに理知的な笑いを笑うことができた不屈の戦闘的弁証法論者の「鉄窓文学」。', 18, 24),
(27, '八水先生行状記―激動のわが青春回顧録', 2, '157.50', 3, 184, '2005-05-01', '4797466138', '教育現場から、保護観察官へと転身。そしてまた教育現場へ…。現場の矛盾、自由と責任のバランスの崩れた社会が引き起こす弊害を肌で感じた八水先生が起こした行動とは…。福岡県南部、八女郡、矢部川の辺に生きて70余年。人生の晩秋期を迎えた今自分の来し方に万感の思いをはせ、筆をすすめた。', 19, 25),
(28, '幾山河―瀬島龍三回想録', 2, '539.00', 3, 669, '1996-07-05', '4594020410', '戦時、大本営に勤務し、戦後は11年間シベリア抑留、帰国後伊藤忠商事に関係、取締役会長をも務めた23年、その後10年の行政改革等の仕事。ひとりの男の波瀾万丈の80余年は激動の昭和史の姿でもある。', 20, 26),
(29, 'Adobe Photoshop CS6 Classroom in a Book', 3, '418.00', 1, 432, '2012-05-22', '0321827333', 'reative professionals seeking the fastest, easiest, most comprehensive way to learn Adobe Photoshop CS6 choose Adobe Photoshop CS6 Classroom in a Book from the Adobe Creative Team at Adobe Press.', 21, 55),
(30, 'HTML & CSS: Design and Build Web Sites', 3, '217.00', 1, 512, '2011-11-08', '1118008189', 'full-color introduction to the basics of HTML and CSS from the publishers of Wrox!', 22, 56),
(31, '802.11 Wireless Networks: The Definitive Guide', 3, '468.00', 1, 656, '2005-04-25', '0596100523', 'As we all know by now, wireless networks offer many advantages over fixed or wired networks. Foremost on that list is mobility, since going wireless frees you from the tether of an Ethernet cable at a desk. But that is just the tip of the cable-free iceberg.', 23, 57),
(32, 'Big Data: A Revolution That Will Transform How We Live and Work', 3, '166.66', 1, 256, '2013-03-05', '0544002695', 'A revelatory exploration of the hottest trend in technology and the dramatic impact it will have on the economy, science, and society at large.', 24, 58),
(33, 'Understanding the Linux Kernel', 3, '344.33', 1, 944, '2005-11-22', '0596005652', 'In order to thoroughly understand what makes Linux tick and why it works so well on a wide variety of systems, you need to delve deep into the heart of the kernel.', 23, 59),
(34, '大數據時代:生活、工作與思維的大變革', 3, '49.90', 2, 261, '2013-01-01', '9787213052545', '《大數據時代:生活、工作與思維的大變革》是國外大數據系統研究的先河之作，作者維克托•邁爾•舍恩伯格被譽為“大數據時代的預言家”，擁有在哈佛大學、牛津大學、耶魯大學和新加坡國立大學等多個互聯網研究重鎮任教的經歷，早在2010年就在《經濟學人》上發布了長達14頁對大數據應用的前瞻性研究。', 25, 58),
(35, '鳥哥的Linux私房菜:基礎學習篇', 3, '88.00', 2, 778, '2010-07-01', '9787115226266', '《鳥哥的Linux私房菜:基礎學習篇》是最具知名度的Linux入門書《鳥哥的Linux私房菜基礎學習篇》的最新版，全面而詳細地介紹了Linux操作系統。', 26, 60),
(36, '深入浅出Node.js', 3, '69.00', 2, 332, '2013-12-01', '9787115335500', '本書從不同的視角介紹了Node 內在的特點和結構。由首章Node 介紹為索引，涉及Node 的各個方面，主要內容包含模塊機制的揭示、異步I/O 實現原理的展現、異步編程的探討、內存控制的介紹、二進制數據Buffer 的細節、Node 中的網絡編程基礎、Node 中的Web 開發、進程間的消息傳遞、Node 測試以及通過Node 構建產品需要的注意事項。', 26, 61),
(37, '高性能MySQL', 3, '128.00', 2, 764, '2013-05-01', ' 9787121198854', '高性能MySQL(第3版)》是MySQL 領域的經典之作，擁有廣泛的影響力。第3 版更新了大量的內容，不但涵蓋了最新MySQL 5.5版本的新特性，也講述了關於固態盤、高可擴展性設計和雲計算環境下的數據庫相關的新內容，原有的基準測試和性能優化部分也做了大量的擴展和補充。', 27, 62),
(38, 'O Reilly精品圖書系列:JavaScript權威指南', 3, '139.00', 2, 1004, '2012-04-01', '9787111376613', '《O Reilly精品圖書系列:JavaScript權威指南(第6版)》講述的內容涵蓋JavaScript語言本身，以及Web瀏覽器所實現的JavaScriptAPI。 《O Reilly精品圖書系列:JavaScript權威指南(第6版)》涵蓋了HTML5和ECMAScript5，很多章節完全重寫，增加了當今Web開發的最佳實踐的內容，新增的章節包括jQuery、服務器端JavaScript、圖形編程以及JavaScript式的面向對象。', 28, 63),
(39, 'サードパーティJavaScript', 3, '294.00', 3, 336, '2014-02-01', '4048916580', '「サードパーティJavaScript」とはパブリッシャのWebサイトで実行されるが、異なるWebアドレスから配信される、独立したクライアントコードのことを意味します。サードパーティJavaScriptはソーシャルウィジェットやアナリティクス用のトラッカー、高機能な組み込みアプリケーションなど他のサイトに配布されるWebアプリケーションを構築するのに利用されています。', 11, 64),
(40, 'ポケット百科 LINE 知りたいことがズバッとわかる本 最新改訂版', 3, '134.40', 3, 288, '2014-02-14', '4798134058', '世界3億人が楽しむ「超定番アプリ」をズバッと解説! 今やなくてはならないツールとなった、無料通話・メールアプリ「LINE(ライン)」。ユーザーが増え続ける一方で、LINEを使った犯罪やトラブルがニュースをにぎわせ、安全な使い方にさらに注目が集まっています。本書はご好評いただいた『ポケット百科 LINE 知りたいことがズバッとわかる本』の第2版です。', 29, 65),
(41, 'サクサクわかるWindows 8.1', 3, '99.80', 3, 288, '2014-01-05', '4839950539', '本書は、直感的に操作ができるような構成になっています。操作手順に従っていくだけで、素早く・効率的にWindows 8.1の操作がマスターできます。', 30, 66),
(42, 'Android開発者のためのコマンドライン超入門', 3, '105.00', 3, 450, '2013-07-05', '4844396099', 'Androidの開発には、コマンドプロンプトやadbシェルでのコマンド操作が必要。MS-DOSやLinuxの経験がなくても、この1冊だけでコマンドと引数、パスとディレクトリなどシェルの基本がわかり、コマンドラインが使えるようになります。', 31, 67),
(43, 'web creators特別号 HTML5完全読本―実践テクニックとWebデザインの動向', 3, '189.00', 3, 128, '2013-02-05', '4844364014', 'Webサイト制作の現場で「当たり前のもの」になりつつあるHTML5の実践的テクニックや活用事例を総特集しています。', 32, 68),
(44, 'Europe: A History', 4, '177.68', 1, 1392, '1998-01-20', '0060974680', 'From the Ice Age to the Cold War, from Reykjavik to the Volga, from Minos to Margaret Thatcher, this book tells the entire story of Europe in a single volume. It was chosen ten times as Book of the Year.', 33, 27),
(45, 'The War That Ended Peace: The Road to 1914', 4, '239.21', 1, 784, '2013-10-29', '9781400068555', 'From the bestselling and award-winning author of Paris 1919 comes a masterpiece of narrative nonfiction, a fascinating portrait of Europe from 1900 up to the outbreak of World War I.', 34, 28),
(46, 'Anne Frank: The Diary of a Young Girl', 4, '54.00', 1, 304, '1993-06-01', '9780553296983', 'Discovered in the attic in which she spent the last years of her life, Anne Frank is remarkable diary has since become a world classic -- a powerful reminder of the horrors of war and an eloquent testament to the human spirit.', 35, 29),
(47, 'History of Britain & Ireland', 4, '316.00', 1, 400, '2011-07-18', '0756675553', 'From the Roman conquest of 43 CE to the Norman conquest of 1066 and from the Elizabethan age of Shakespeare to the Iraq and Afghan wars of the 21st century, DKs History of Britain and Ireland traces the key events that shaped the societies living in the British Isles from the earliest times to the present day.', 36, 30),
(48, 'Weapon: A Visual History of Arms and Armour', 4, '230.00', 1, 360, '2010-11-01', '1405363290', 'This title presents a slice of history - the definitive exploration of weapons through the ages, now with a fresh new jacket. It is an epic 4,000-year illustrated story of weaponry.', 36, 31),
(49, '全球通史', 4, '168.00', 2, 833, '2012-02-01', '9787301204689', '《全球通史(上下從史前史到21世紀上下第7版修訂版)(精)》由斯塔夫里阿諾斯著，吳象嬰、梁赤民、董書慧、王昶譯，作者在本書中採用全新的史學觀點和方法，將整個世界看作一個不可分割的有機的統一體，從全球的角度而不是從某一國家或某一地區的角度來考察世界各地區人類文明的產生和發展，把研究重點放在對人類歷史進程有重大影響的諸歷史運動、諸歷史事件和它們之間的相互關聯和相互影響上，努力反映局部與整體的對抗以及它們之間的相互作用。', 37, 32),
(50, '中華上下五千年•世界上下五千年大全集', 4, '29.80', 2, 564, '2010-04-01', '7511302424', '《中華上下五千年•世界上下五千年大全集(超值白金版)》以時間為序，精選中外歷史上的重大事件、風雲人物、輝煌成就、燦爛文化等內容，分為上、下兩篇，上篇為中華上下五千年，下篇為世界上下五千年，在保證各自歷史完整與延續的基礎上，簡要勾勒出歷史演進的基本脈絡，生動再現人類歷史的波瀾壯闊與風雲變幻，幫助讀者從宏觀上把握歷史，窺斑知豹，進而揣摩與品味歷史發展的內在規律。', 38, 33),
(51, '第一次世界大戰戰史', 4, '58.00', 2, 427, '2010-08-01', '9787208093607', '《第一次世界大戰戰史》講述了：1911年，薩拉熱窩的一聲槍響。引爆了整個世界。歐洲列強紛紛全面動員。傾其全國之力，投入這場前所未見的殘酷血戰。', 39, 34),
(52, '革命的年代:1789-1848', 4, '48.00', 2, 376, '2014-02-01', '9787508643687', '霍布斯鮑姆“年代四部曲”是公認的“現代世界史的最佳入門讀物”，史學大師艾瑞克•霍布斯鮑姆歷30年而成的心血巨著，全球持續暢銷的歷史杰作；英國前首相布萊爾、巴西前總統盧拉、意大利總統納波利塔諾，愛德華•薩義德、尼爾•弗格森、托尼•朱特等歐美著名學者隆重推薦。', 7, 35),
(53, '一戰傳奇', 4, '18.00', 2, 267, '2014-01-01', '9787544066310', '《一戰傳奇》精選一戰時期重要的歷史事件，以此為切入點和脈絡主線，發掘我們迫切想了解的故事細節，編成30餘個故事，通過通俗易懂的故事情節讓每個普通人都能大致了解到一戰時期的總體情況，使讀者們得以從中獲得一些啟發或啟示。', 40, 36),
(54, '神社仏閣に隠された日本史の謎と闇', 4, '68.30', 3, 253, '2013-02-17', '4800223652', '名だたる寺社は、歴史の敗者を「鎮魂」する闇の聖域である! 聖域にまつわる歴史のミステリー、怨霊・鎮魂の暗号を解読する試み。伊勢神宮や出雲大社から善光寺や広隆寺などの名跡に残される歴史の闇に迫る、読み始めると止まらなくなる歴史読本です。', 41, 37),
(55, '戦国北条氏五代の盛衰', 4, '357.00', 3, 200, '2013-01-25', '4490208596', '伊勢宗瑞(北条早雲)に始まる五代、約100年の事蹟と盛衰。京都の足利中央政権から離れて、今川氏の縁から伊豆に侵攻し、無から関東の覇者となるまで、また、信長・秀吉の天下統一の波に翻弄されて滅亡するまでを詳細にたどる。', 42, 38),
(56, '江戸幕府崩壊 孝明天皇と', 4, '96.60', 3, 272, '2013-02-06', '4062922215', '薩摩、長州を中心とする反幕府勢力が、武力で倒幕を果たしたという「常識」は本当か。第二次長州戦争は、なぜ幕府の敗北に終わったのか。王政復古というクーデタ方式が採られた理由とは。', 43, 40),
(57, '奇兵隊天皇と長州卒族の明治維新', 4, '189.00', 3, 304, '2014-01-22', '4880863114', 'シリーズ紹介]偽史のケガレを禊祓う[落合秘史]シリーズ[I]明治維新の極秘計画「さる筋」が洩らした厳重秘匿の皇統秘事に隠された驚愕の近代史', 44, 41),
(58, '縄文人になる! 縄文式生活技術教本', 4, '84.00', 3, 200, '2013-01-21', '4635047717', '自然とともに生きた古代の火起こし、土器作り、木の実食など、甦る縄文の技術。', 45, 39),
(59, 'Cambridge IGCSE Physics Coursebook with CD-ROM', 5, '265.00', 1, 288, '2010-02-11', '0521757738', 'Cambridge IGCSE Physics matches the requirements of the revised Cambridge IGCSE Physics syllabus (0625). Cambridge IGCSE Physics has been developed to provide full support for the Cambridge International Examinations syllabus (0625). ', 46, 42),
(60, 'Dorland''s Illustrated Medical Dictionary', 5, '376.00', 1, 2176, '2011-05-02', '1416062572', 'Thoroughly updated, this user-friendly reference, trusted for more than a century by healthcare personnel at every professional level, allows you to grasp the meanings of all medical terms in current usage. Understand and correctly use all the latest terminology in todays ever-evolving medical field with the 32nd Edition of the comprehensive, highly respected Dorlands Illustrated Medical Dictionary!', 47, 43),
(61, 'McGraw-Hill''s SAT Subject Test Physics', 5, '123.00', 1, 288, '2012-04-01', '0071762949', 'Expert guidance on the Physics exam Many colleges and universities require you to take one or more SAT II Subject Tests to demonstrate your mastery of specific high school subjects.', 48, 44),
(62, 'Benjamin Franklin: An American Life', 5, '277.00', 1, 589, '2003-07-01', '0684807610', 'Benjamin Franklin is the Founding Father who winks at us. An ambitious urban entrepreneur who rose up the social ladder, from leather-aproned shopkeeper to dining with kings, he seems made of flesh rather than of marble.', 13, 16),
(63, '建築語彙', 5, '38.00', 2, 193, '2001-08-01', '9787561118894', '《建築語彙》是一本介紹建築構想的書，也是建築設計者的參考書。構想是以示意圖加簡要文字的方式來表達的，這種表達方式是建築設計獨特的表達方式，對建築設計師至關重要且必須加以掌握。', 49, 45),
(64, '電路', 5, '50.90', 2, 568, '2006-05-01', '9787040196719', '主要內容有：電路模型和電路定律、電阻電路的等效變換、電阻電路的一般分析、電路定理、含有運算放大器的電阻電路、儲能元件、一階電路和二階電路的時域分析、相量法、正弦穩態電路的分析、含有耦合電感的電路、電路的頻率響應、三相電路、非正弦週期電流電路和信號的頻譜、線性動態電路的複頻域分析、電路方程的矩陣形式、二端口網絡、非線性電路、均勻傳輸線，另有磁路和鐵心線圈、PSpice：簡介和MATLAB簡介三個附錄。書末附有部分習題答案。', 50, 46),
(65, '實用電子元器件與電路基礎', 5, '79.00', 2, 723, '2009-04-01', ' 9787121079771', '從電路基本原理的介紹開始，對各種類型的電子元器件進行了詳細具體的分類介紹。首先重點介紹了包括電阻，電感，電容，變壓器等在內的基本電子元器件；然後分別介紹了各種半導體器件、光電器件、運算放大器、直流穩壓和調壓器件、電聲器件等專用元器件。', 27, 47),
(66, '彼得•科恩木工基礎', 5, '49.80', 2, 188, '2013-01-01', '9787530463048', '彼得•科恩木工基礎能幫助木工初學者從一開始就掌握正確的技術，而那些有經驗的木工也能從中學到關鍵的、經典的家具製作技術，從而進一步提高自己的技藝。', 51, 48),
(67, '設計心理學', 5, '30.00', 2, 271, '2010-03-01', '9787508619156', '《設計心理學》中強調以使用者為中心的設計哲學，提醒消費者在挑選的物品，必須要方便好用，易於理解，希望設計師在註重設計美感的同時，不要忽略設計的一些必要因素，因為對於產品設計來說，安全好用永遠是競爭的關鍵。', 7, 49),
(68, '宇宙の今を知る 2014 ~その向こうを知りたい', 5, '84.00', 3, 120, '2014-01-16', '4906913210', '最新の情報・資料の中から、“宇宙爺や"が 「宇宙Sora ガール」や「宇宙ファン」に 客観的に、科学的に最新情報を語り、 そして己の悲哀とロマンを綴る。 「宇宙の今を知る」ためのガイダンス!', 52, 50),
(69, '不可能へのあこがれ ―数学の驚くべき真実', 5, '336.00', 3, 288, '2013-01-24', '4320110803', '私たちの歴史は,それまで不可能であると考えられた挑戦に立ち向かいながら達せられてきた偉業―世界一周,エベレスト登頂,月面着陸など―に満ちている。それは数学の歴史に関しても同様である。', 53, 51),
(70, '知っていますか?西洋科学者ゆかりの地 IN JAPAN', 5, '315.00', 3, 234, '2013-02-06', '4769914695', '近代日本の建設には多くの西洋科学技術者が貢献した。今は忘れられつつあるが、彼らの足跡ははっきりと日本各所に残っている。', 54, 52),
(71, 'ホントにすごい! 日本の科学技術図鑑', 5, '141.80', 3, 112, '2001-09-25', '4575454230', '天へと届く宇宙エレベーター! 直径140メートルの超巨大風力発電! 洋上に浮かぶエコロジー都市! 災害現場から家庭にまで進出するロボット! 世界が注目するiPS細胞に病気を治す“奇跡のイチゴ"などなど、日本が世界に誇る「ホントにすごい」科学技術を紹介する一冊。', 55, 53),
(72, 'ウェスト&ハリス CMOS VLSI 回路設計 基礎編 ', 5, '798.00', 3, 512, '2013-01-21', '4621087215', '基礎的な原理の説明から,原理の応用,先端の設計事例にいたるまで,体系的に解説されたこの分野のバイブル.第4版(本書)ではナノメータ時代の設計技術に関する内容が充実.素子の微細化がLSI設計に与える課題として,素子の性能ばらつき,消費電力の増大,信号線および電源線のノイズ,クロック信号に関する設計を取り上げ,また65ナノメータの製造プロセスを使用した場合の例題を数多く示し,あらゆる読者のニーズに応えた内容.', 56, 54),
(74, '大灰大灰大灰大灰大灰大灰大灰', 2, '9999.00', 3, 1212, '2013-10-31', '0755365890', '這是一隻大灰', 60, 70),
(75, 'This is a test', 4, '12.00', 2, 100, '2015-02-21', '0755365800', '0755365895075536589507553658950755365895', 59, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `book_image`
--

CREATE TABLE IF NOT EXISTS `book_image` (
  `book_id` smallint(6) unsigned NOT NULL,
  `image_id` smallint(6) unsigned NOT NULL,
  `thumbnail` tinyint(1) NOT NULL,
  UNIQUE KEY `book_id_2` (`book_id`,`image_id`),
  KEY `book_id` (`book_id`),
  KEY `image_id` (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `book_image`
--

INSERT INTO `book_image` (`book_id`, `image_id`, `thumbnail`) VALUES
(1, 1, 1),
(1, 73, 0),
(1, 74, 0),
(1, 75, 0),
(2, 2, 1),
(2, 76, 0),
(2, 77, 0),
(2, 78, 0),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(6, 79, 0),
(6, 80, 0),
(6, 81, 0),
(7, 7, 1),
(7, 82, 0),
(8, 8, 1),
(8, 83, 0),
(9, 9, 1),
(10, 10, 1),
(10, 84, 0),
(10, 85, 0),
(10, 86, 0),
(11, 11, 1),
(11, 88, 0),
(11, 89, 0),
(12, 12, 1),
(13, 13, 1),
(13, 90, 0),
(14, 14, 1),
(15, 15, 1),
(16, 16, 1),
(16, 91, 0),
(17, 17, 1),
(18, 18, 1),
(18, 92, 0),
(19, 19, 1),
(20, 20, 1),
(21, 21, 1),
(22, 22, 1),
(22, 93, 0),
(23, 23, 1),
(23, 94, 0),
(24, 24, 1),
(25, 25, 1),
(26, 26, 1),
(27, 27, 1),
(28, 28, 1),
(29, 29, 1),
(30, 30, 1),
(30, 95, 0),
(31, 31, 1),
(31, 96, 0),
(32, 32, 1),
(32, 97, 0),
(33, 33, 1),
(33, 98, 0),
(34, 34, 1),
(34, 99, 0),
(35, 35, 1),
(36, 36, 1),
(37, 37, 1),
(37, 100, 0),
(38, 38, 1),
(39, 39, 1),
(40, 40, 1),
(41, 41, 1),
(42, 42, 1),
(43, 43, 1),
(43, 101, 0),
(43, 102, 0),
(43, 103, 0),
(44, 44, 1),
(44, 104, 0),
(45, 45, 1),
(46, 46, 1),
(46, 105, 0),
(47, 47, 1),
(48, 48, 1),
(49, 49, 1),
(50, 50, 1),
(51, 51, 1),
(52, 52, 1),
(53, 53, 1),
(54, 54, 1),
(55, 55, 1),
(56, 56, 1),
(57, 57, 1),
(58, 58, 1),
(59, 59, 1),
(60, 60, 1),
(61, 61, 1),
(62, 62, 1),
(62, 106, 0),
(63, 63, 1),
(64, 64, 1),
(65, 65, 1),
(66, 66, 1),
(66, 108, 0),
(66, 109, 0),
(67, 67, 1),
(68, 68, 1),
(69, 69, 1),
(70, 70, 1),
(71, 71, 1),
(72, 72, 1),
(74, 110, 1),
(75, 111, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `category_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 資料表的匯出資料 `category`
--

INSERT INTO `category` (`category_id`, `name`) VALUES
(1, 'Arts'),
(2, 'Biographies'),
(3, 'Computers'),
(4, 'History'),
(5, 'Science');

-- --------------------------------------------------------

--
-- 資料表結構 `image`
--

CREATE TABLE IF NOT EXISTS `image` (
  `image_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=112 ;

--
-- 資料表的匯出資料 `image`
--

INSERT INTO `image` (`image_id`, `name`, `type`) VALUES
(1, '0001x01', 'JPG'),
(2, '0002x01', 'JPG'),
(3, '0003x01', 'JPG'),
(4, '0004x01', 'JPG'),
(5, '0005x01', 'JPG'),
(6, '0006x01', 'JPG'),
(7, '0007x01', 'JPG'),
(8, '0008x01', 'JPG'),
(9, '0009x01', 'JPG'),
(10, '0010x01', 'JPG'),
(11, '0011x01', 'JPG'),
(12, '0012x01', 'JPG'),
(13, '0013x01', 'JPG'),
(14, '0014x01', 'JPG'),
(15, '0015x01', 'JPG'),
(16, '0016x01', 'JPG'),
(17, '0017x01', 'JPG'),
(18, '0018x01', 'JPG'),
(19, '0019x01', 'JPG'),
(20, '0020x01', 'JPG'),
(21, '0021x01', 'JPG'),
(22, '0022x01', 'JPG'),
(23, '0023x01', 'JPG'),
(24, '0024x01', 'JPG'),
(25, '0025x01', 'JPG'),
(26, '0026x01', 'JPG'),
(27, '0027x01', 'JPG'),
(28, '0028x01', 'JPG'),
(29, '0029x01', 'JPG'),
(30, '0030x01', 'JPG'),
(31, '0031x01', 'JPG'),
(32, '0032x01', 'JPG'),
(33, '0033x01', 'JPG'),
(34, '0034x01', 'JPG'),
(35, '0035x01', 'JPG'),
(36, '0036x01', 'JPG'),
(37, '0037x01', 'JPG'),
(38, '0038x01', 'JPG'),
(39, '0039x01', 'JPG'),
(40, '0040x01', 'JPG'),
(41, '0041x01', 'JPG'),
(42, '0042x01', 'JPG'),
(43, '0043x01', 'JPG'),
(44, '0044x01', 'JPG'),
(45, '0045x01', 'JPG'),
(46, '0046x01', 'JPG'),
(47, '0047x01', 'JPG'),
(48, '0048x01', 'JPG'),
(49, '0049x01', 'JPG'),
(50, '0050x01', 'JPG'),
(51, '0051x01', 'JPG'),
(52, '0052x01', 'JPG'),
(53, '0053x01', 'JPG'),
(54, '0054x01', 'JPG'),
(55, '0055x01', 'JPG'),
(56, '0056x01', 'JPG'),
(57, '0057x01', 'JPG'),
(58, '0058x01', 'JPG'),
(59, '0059x01', 'JPG'),
(60, '0060x01', 'JPG'),
(61, '0061x01', 'JPG'),
(62, '0062x01', 'JPG'),
(63, '0063x01', 'JPG'),
(64, '0064x01', 'JPG'),
(65, '0065x01', 'JPG'),
(66, '0066x01', 'JPG'),
(67, '0067x01', 'JPG'),
(68, '0068x01', 'JPG'),
(69, '0069x01', 'JPG'),
(70, '0070x01', 'JPG'),
(71, '0071x01', 'JPG'),
(72, '0072x01', 'JPG'),
(73, '0001x02', 'JPG'),
(74, '0001x03', 'JPG'),
(75, '0001x04', 'JPG'),
(76, '0002x02', 'JPG'),
(77, '0002x03', 'JPG'),
(78, '0002x04', 'JPG'),
(79, '0006x02', 'JPG'),
(80, '0006x03', 'JPG'),
(81, '0006x04', 'JPG'),
(82, '0007x02', 'JPG'),
(83, '0008x02', 'JPG'),
(84, '0010x02', 'JPG'),
(85, '0010x03', 'JPG'),
(86, '0010x04', 'JPG'),
(88, '0011x02', 'JPG'),
(89, '0011x03', 'JPG'),
(90, '0013x02', 'JPG'),
(91, '0016x02', 'JPG'),
(92, '0018x02', 'JPG'),
(93, '0022x02', 'JPG'),
(94, '0023x02', 'JPG'),
(95, '0030x02', 'JPG'),
(96, '0031x02', 'JPG'),
(97, '0032x02', 'JPG'),
(98, '0033x02', 'JPG'),
(99, '0034x02', 'JPG'),
(100, '0037x02', 'JPG'),
(101, '0043x02', 'JPG'),
(102, '0043x03', 'JPG'),
(103, '0043x04', 'JPG'),
(104, '0044x02', 'JPG'),
(105, '0046x02', 'JPG'),
(106, '0062x02', 'JPG'),
(108, '0066x02', 'JPG'),
(109, '0066x03', 'JPG'),
(110, '0074x01', 'jpg'),
(111, '0075x01', 'jpg');

-- --------------------------------------------------------

--
-- 資料表結構 `language`
--

CREATE TABLE IF NOT EXISTS `language` (
  `language_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 資料表的匯出資料 `language`
--

INSERT INTO `language` (`language_id`, `name`) VALUES
(1, 'English'),
(2, 'Chinese'),
(3, 'Japanese');

-- --------------------------------------------------------

--
-- 資料表結構 `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `order_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` smallint(6) unsigned NOT NULL,
  `purchase_date` date NOT NULL,
  `shipment_date` date DEFAULT NULL,
  `status` varchar(9) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 資料表的匯出資料 `order`
--

INSERT INTO `order` (`order_id`, `user_id`, `purchase_date`, `shipment_date`, `status`) VALUES
(1, 3, '2014-02-16', '2014-02-17', 'shipped'),
(2, 2, '2014-02-16', '2014-02-27', 'received'),
(3, 2, '2014-02-16', '2014-02-27', 'shipped'),
(4, 2, '2014-02-16', '2014-02-16', 'shipped'),
(5, 2, '2014-02-16', '2014-02-18', 'received'),
(6, 3, '2014-02-17', NULL, 'hold'),
(7, 2, '2014-02-26', NULL, 'hold'),
(8, 2, '2014-02-26', NULL, 'pending'),
(9, 2, '2014-02-27', NULL, 'cancelled'),
(10, 2, '2014-02-28', '2014-02-28', 'received'),
(11, 2, '2014-03-06', NULL, 'pending');

-- --------------------------------------------------------

--
-- 資料表結構 `order_detail`
--

CREATE TABLE IF NOT EXISTS `order_detail` (
  `order_id` smallint(6) unsigned NOT NULL,
  `book_id` smallint(6) unsigned NOT NULL,
  `qty` int(10) unsigned NOT NULL,
  UNIQUE KEY `order_id_2` (`order_id`,`book_id`),
  KEY `order_id` (`order_id`),
  KEY `book_id` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `order_detail`
--

INSERT INTO `order_detail` (`order_id`, `book_id`, `qty`) VALUES
(1, 2, 3),
(2, 5, 3),
(3, 3, 5),
(4, 3, 4),
(4, 4, 2),
(4, 8, 1),
(5, 2, 5),
(5, 8, 1),
(6, 15, 1),
(6, 17, 1),
(6, 23, 2),
(6, 35, 1),
(6, 72, 1),
(7, 2, 1),
(7, 4, 6),
(7, 50, 1),
(8, 6, 1),
(8, 7, 1),
(8, 8, 1),
(8, 9, 1),
(8, 12, 1),
(8, 23, 1),
(8, 24, 1),
(9, 3, 3),
(10, 3, 11),
(10, 23, 1),
(11, 2, 7),
(11, 3, 5);

-- --------------------------------------------------------

--
-- 資料表結構 `publisher`
--

CREATE TABLE IF NOT EXISTS `publisher` (
  `publisher_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `city` varchar(32) NOT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=61 ;

--
-- 資料表的匯出資料 `publisher`
--

INSERT INTO `publisher` (`publisher_id`, `name`, `city`) VALUES
(1, 'Headline Book Publishing', 'London'),
(2, 'PHAIDON PRESS INC.', 'London'),
(3, 'Chronicle Books (CA)', 'San Francisco'),
(4, 'Dover Publications Inc.', 'New York'),
(5, 'Signet Classics', 'New York'),
(6, '新星出版社', '北京'),
(7, '中信出版社', '北京'),
(8, '中國水利水電出版社', '北京'),
(9, '中國青年出版社', '北京'),
(10, '世界文化社', '東京'),
(11, '角川学芸', '東京'),
(12, 'Hodder & Stoughton', 'London'),
(13, 'Simon & Schuster', 'New York'),
(14, 'Back Bay Books', 'New York'),
(15, 'Penguin', 'London'),
(16, '新潮社', '東京'),
(17, '学陽書房 ', '東京'),
(18, 'こぶし書房 ', '東京'),
(19, '新風舎', '東京'),
(20, '産経新聞ニュースサービス', '東京'),
(21, ' Adobe Press,U.S.', 'San Francisco'),
(22, 'Wiley', 'New Jersey'),
(23, 'O Reilly Media', 'California'),
(24, 'Eamon Dolan / Houghton Mifflin H', 'Boston'),
(25, '浙江人民出版社', '浙江'),
(26, '人民郵電出版社', '北京'),
(27, '電子工業出版社', '北京'),
(28, '機械工業出版社', '北京'),
(29, '翔泳社', '東京'),
(30, 'マイナビ', '東京'),
(31, 'インプレスR&D ', '東京'),
(32, 'エムディエヌコーポレーション', '東京'),
(33, 'Harper Perennial', 'New York'),
(34, 'Random House', 'New York'),
(35, 'Bantam Books', 'New York'),
(36, 'DK ADULT ', 'London'),
(37, '北京大學出版社', '北京'),
(38, '中國華僑出版社', '北京'),
(39, '上海人民出版社', '上海'),
(40, '山西教育出版社', '山西'),
(41, '宝島社', '東京'),
(42, '東京堂出版', '東京'),
(43, '講談社', '東京'),
(44, '成甲書房', '東京'),
(45, '山と渓谷社', '東京'),
(46, 'Cambridge University Press', 'Cambridge'),
(47, 'Saunders', 'Philadelphia'),
(48, 'McGraw-Hill Contemporary', 'New York'),
(49, '大連理工大學出版社', '遼寧'),
(50, '高等教育出版社', '北京'),
(51, '北京科學技術出版社', '北京'),
(52, 'キラジェンヌ', '東京'),
(53, '共立出版', '東京'),
(54, '恒星社厚生閣', '東京'),
(55, '双葉社', '東京'),
(56, '丸善出版', '東京'),
(57, 'Headline Book Publishinga', 'London'),
(58, '', ''),
(59, 'abcabc', 'city'),
(60, '大灰出版社', 'Macau');

-- --------------------------------------------------------

--
-- 資料表結構 `shopping_cart`
--

CREATE TABLE IF NOT EXISTS `shopping_cart` (
  `user_id` smallint(6) unsigned NOT NULL,
  `book_id` smallint(6) unsigned NOT NULL,
  `qty` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`book_id`),
  KEY `book_id` (`book_id`),
  KEY `customer_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `shopping_cart`
--

INSERT INTO `shopping_cart` (`user_id`, `book_id`, `qty`) VALUES
(2, 4, 2);

-- --------------------------------------------------------

--
-- 資料表結構 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `account_name` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `email` varchar(50) NOT NULL,
  `shipping_address` text NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `account_name` (`account_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 資料表的匯出資料 `user`
--

INSERT INTO `user` (`user_id`, `account_name`, `password`, `first_name`, `last_name`, `email`, `shipping_address`) VALUES
(1, 'vendor', '7c3613dba5171cb6027c67835dd3b9d4', '', '', '', ''),
(2, 'lillian12345', '411a9d9e1b2eeb2788f692483238d52e', 'lillian', 'chan', 'lillian@yahoo.com.hk', 'Rua Oito B. Iao Hon, No.218,\nEd. Son Tok Garder, Ngan Seng Count, 20-andar-A,\nMacau.'),
(3, 'ncha12345', 'a46f6e71570b305219c863d2ee2f0104', 'ncha', 'chan', 'ncha12345@yahoo.com', 'ncha12345ncha12345ncha12345ncha12345ncha12345'),
(4, 'higfuu', '25f9e794323b453885f5181f1b624d0b', 'vcbnv', 'vbvmnbm', 'lillian1236987450@yahoo.com.hk', '1111111111111111114564646'),
(5, 'abcege', 'e10adc3949ba59abbe56e057f20f883e', 'abc', 'abcdgfe', 'lillian1236987450@yahoo.com.hk', 'iliaihge'),
(6, 'fdggggg', '202cb962ac59075b964b07152d234b70', 'aabcdddd', 'dd', 'lillian1236987450@yahoo.com.hk', 'dfdfge');

--
-- 已匯出資料表的限制(Constraint)
--

--
-- 資料表的 Constraints `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `book_ibfk_3` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`publisher_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `book_ibfk_4` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的 Constraints `book_image`
--
ALTER TABLE `book_image`
  ADD CONSTRAINT `book_image_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `image` (`image_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `book_image_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的 Constraints `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的 Constraints `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD CONSTRAINT `shopping_cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `shopping_cart_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
