USE music_streamingDB;
GO

-- =============================================
-- SAMPLE DATA FOR music_streamingDB
-- 20+ records per table (except ROLES & SUBSCRIPTION_PLANS)
-- Supports all 40 queries
-- =============================================
-- NOTE: Some queries reference specific IDs. Adjust as needed:
--   Q7:  album_id = 2061 -> use album_id = 2 (Sky Tour album has 4 songs)
--   Q14: @song_id       -> use 6
--   Q16: @song_id, @timestamp -> use 6, 30
--   Q18: comment_id = 303181  -> use comment_id = 100
-- =============================================

-- 1. ROLES (3 rows - excluded from 20+ requirement)
SET IDENTITY_INSERT ROLES ON;
INSERT INTO ROLES (role_id, role_name, permissions) VALUES
(1, 'admin',     'all'),
(2, 'user',      'read,write,comment,like'),
(3, 'moderator', 'read,write,comment,like,delete_comments');
SET IDENTITY_INSERT ROLES OFF;
GO

-- 2. USERS (20 rows)
SET IDENTITY_INSERT USERS ON;
INSERT INTO USERS (user_id, username, email, password_hash, avatar_url, role_id) VALUES
(1,  'user_1',    'user1@mail.com',    'hash_abc123', 'https://avatar.com/user1.jpg',   2),
(2,  'user_2',    'user2@mail.com',    'hash_def456', 'https://avatar.com/user2.jpg',   2),
(3,  'user_3',    'user3@mail.com',    'hash_ghi789', 'https://avatar.com/user3.jpg',   2),
(4,  'user_4',    'user4@mail.com',    'hash_jkl012', 'https://avatar.com/user4.jpg',   2),
(5,  'user_5',    'user5@mail.com',    'hash_mno345', 'https://avatar.com/user5.jpg',   2),
(6,  'admin_1',   'admin@mail.com',    'hash_pqr678', 'https://avatar.com/admin.jpg',   1),
(7,  'mod_1',     'mod@mail.com',      'hash_stu901', 'https://avatar.com/mod.jpg',     3),
(8,  'user_6',    'user6@mail.com',    'hash_vwx234', 'https://avatar.com/user6.jpg',   2),
(9,  'user_7',    'user7@mail.com',    'hash_yza567', 'https://avatar.com/user7.jpg',   2),
(10, 'user_8',    'user8@mail.com',    'hash_bcd890', 'https://avatar.com/user8.jpg',   2),
(11, 'user_9',    'user9@mail.com',    'hash_efg123', 'https://avatar.com/user9.jpg',   2),
(12, 'user_10',   'user10@mail.com',   'hash_hij456', 'https://avatar.com/user10.jpg',  2),
(13, 'user_11',   'user11@mail.com',   'hash_klm789', 'https://avatar.com/user11.jpg',  2),
(14, 'user_12',   'user12@mail.com',   'hash_nop012', 'https://avatar.com/user12.jpg',  2),
(15, 'user_13',   'user13@mail.com',   'hash_qrs345', 'https://avatar.com/user13.jpg',  2),
(16, 'user_14',   'user14@mail.com',   'hash_tuv678', 'https://avatar.com/user14.jpg',  2),
(17, 'user_15',   'user15@mail.com',   'hash_wxy901', 'https://avatar.com/user15.jpg',  2),
(18, 'user_16',   'user16@mail.com',   'hash_zab234', 'https://avatar.com/user16.jpg',  2),
(19, 'user_17',   'user17@mail.com',   'hash_cde567', 'https://avatar.com/user17.jpg',  3),
(20, 'user_18',   'user18@mail.com',   'hash_fgh890', 'https://avatar.com/user18.jpg',  2);
SET IDENTITY_INSERT USERS OFF;
GO

-- 3. SUBSCRIPTION_PLANS (5 rows - excluded from 20+ requirement)
SET IDENTITY_INSERT SUBSCRIPTION_PLANS ON;
INSERT INTO SUBSCRIPTION_PLANS (plan_id, plan_name, price, duration_months, ad_free, high_quality_audio, max_downloads) VALUES
(1, 'Free',    0.00,  1, 0, 0, 0),
(2, 'Basic',   4.99,  1, 1, 0, 10),
(3, 'Premium', 9.99,  1, 1, 1, 100),
(4, 'Family',  14.99, 1, 1, 1, 200),
(5, 'Student', 2.99,  1, 1, 1, 50);
SET IDENTITY_INSERT SUBSCRIPTION_PLANS OFF;
GO

-- 4. USER_SUBSCRIPTIONS (25 rows)
SET IDENTITY_INSERT USER_SUBSCRIPTIONS ON;
INSERT INTO USER_SUBSCRIPTIONS (subscription_id, user_id, plan_id, start_date, end_date, status, auto_renew) VALUES
(1,  1,  3, '2025-12-01', '2026-04-01', 'active',    1),   -- user_1,  Premium
(2,  2,  3, '2026-01-15', '2026-05-15', 'active',    1),   -- user_2,  Premium
(3,  3,  2, '2025-11-01', '2026-02-01', 'expired',   0),   -- user_3,  Basic (expired)
(4,  4,  4, '2026-02-01', '2026-06-01', 'active',    1),   -- user_4,  Family
(5,  5,  3, '2026-01-01', '2026-04-01', 'active',    0),   -- user_5,  Premium
(6,  6,  1, '2026-03-01', '2026-04-01', 'active',    0),   -- admin_1, Free
(7,  7,  2, '2026-02-15', '2026-03-25', 'active',    1),   -- mod_1,   Basic (expiring soon)
(8,  8,  3, '2026-01-01', '2026-05-01', 'active',    1),   -- user_6,  Premium
(9,  9,  5, '2026-03-01', '2026-04-15', 'active',    0),   -- user_7,  Student (expiring soon)
(10, 10, 3, '2025-10-01', '2026-03-20', 'active',    0),   -- user_8,  Premium (expiring very soon)
(11, 3,  3, '2026-03-01', '2026-06-01', 'active',    1),   -- user_3,  Premium (renewed)
(12, 1,  2, '2025-06-01', '2025-12-01', 'expired',   0),   -- user_1,  Basic (old)
(13, 11, 3, '2026-02-01', '2026-05-01', 'active',    1),   -- user_9,  Premium
(14, 12, 2, '2026-01-01', '2026-04-01', 'active',    0),   -- user_10, Basic
(15, 13, 4, '2026-02-15', '2026-06-15', 'active',    1),   -- user_11, Family
(16, 14, 3, '2026-03-01', '2026-06-01', 'active',    1),   -- user_12, Premium
(17, 15, 5, '2026-02-01', '2026-05-01', 'active',    0),   -- user_13, Student
(18, 16, 3, '2026-01-15', '2026-04-15', 'active',    1),   -- user_14, Premium
(19, 17, 2, '2026-03-01', '2026-04-01', 'active',    0),   -- user_15, Basic (expiring soon)
(20, 18, 1, '2026-03-01', '2026-04-01', 'active',    0),   -- user_16, Free
(21, 19, 3, '2026-02-01', '2026-05-01', 'active',    1),   -- user_17, Premium
(22, 20, 4, '2026-01-01', '2026-04-01', 'active',    1),   -- user_18, Family
(23, 11, 2, '2025-09-01', '2026-02-01', 'expired',   0),   -- user_9 old Basic
(24, 14, 1, '2025-06-01', '2025-09-01', 'cancelled', 0),   -- user_12 old Free (cancelled)
(25, 16, 5, '2025-08-01', '2025-11-01', 'expired',   0);   -- user_14 old Student
SET IDENTITY_INSERT USER_SUBSCRIPTIONS OFF;
GO

-- 5. PAYMENTS (30 rows)
INSERT INTO PAYMENTS (subscription_id, amount, payment_date, status, transaction_id) VALUES
-- user_1 history (sub 1 + sub 12) -> Q25
(12, 4.99,  '2025-06-01 08:00:00', 'completed', 'TXN_018'),
(1,  9.99,  '2025-12-01 09:00:00', 'completed', 'TXN_001'),
(1,  9.99,  '2026-01-01 09:00:00', 'completed', 'TXN_002'),
(1,  9.99,  '2026-02-01 09:00:00', 'completed', 'TXN_003'),
(1,  9.99,  '2026-03-01 09:00:00', 'completed', 'TXN_004'),
-- user_2
(2,  9.99,  '2026-01-15 10:00:00', 'completed', 'TXN_005'),
(2,  9.99,  '2026-02-15 10:00:00', 'completed', 'TXN_006'),
(2,  9.99,  '2026-03-15 10:00:00', 'completed', 'TXN_007'),
-- user_3
(3,  4.99,  '2025-11-01 11:00:00', 'completed', 'TXN_008'),
(11, 9.99,  '2026-03-01 11:00:00', 'completed', 'TXN_017'),
-- user_4
(4,  14.99, '2026-02-01 12:00:00', 'completed', 'TXN_009'),
(4,  14.99, '2026-03-01 12:00:00', 'completed', 'TXN_010'),
-- user_5 (subscription_id = 5) -> Q34
(5,  9.99,  '2026-01-01 13:00:00', 'completed', 'TXN_011'),
(5,  9.99,  '2026-02-01 13:00:00', 'failed',    'TXN_019'),
(5,  9.99,  '2026-03-10 13:00:00', 'completed', 'TXN_012'),
-- mod_1
(7,  4.99,  '2026-02-15 14:00:00', 'completed', 'TXN_013'),
-- user_6
(8,  9.99,  '2026-01-01 15:00:00', 'completed', 'TXN_014'),
-- user_7
(9,  2.99,  '2026-03-01 16:00:00', 'completed', 'TXN_015'),
-- user_8
(10, 9.99,  '2025-10-01 17:00:00', 'completed', 'TXN_016'),
-- NEW: user_9
(13, 9.99,  '2026-02-01 09:30:00', 'completed', 'TXN_020'),
(13, 9.99,  '2026-03-01 09:30:00', 'completed', 'TXN_021'),
(23, 4.99,  '2025-09-01 10:00:00', 'completed', 'TXN_022'),
-- user_10
(14, 4.99,  '2026-01-01 11:00:00', 'completed', 'TXN_023'),
(14, 4.99,  '2026-03-01 11:30:00', 'completed', 'TXN_024'),
-- user_11
(15, 14.99, '2026-02-15 12:00:00', 'completed', 'TXN_025'),
-- user_12
(16, 9.99,  '2026-03-01 13:30:00', 'completed', 'TXN_026'),
-- user_13
(17, 2.99,  '2026-02-01 14:00:00', 'completed', 'TXN_027'),
-- user_14
(18, 9.99,  '2026-01-15 15:00:00', 'completed', 'TXN_028'),
(25, 2.99,  '2025-08-01 16:00:00', 'completed', 'TXN_029'),
-- user_18
(22, 14.99, '2026-01-01 17:00:00', 'completed', 'TXN_030');
GO

-- 6. ARTISTS (20 artists) -> Q3: 12 from Việt Nam
SET IDENTITY_INSERT ARTISTS ON;
INSERT INTO ARTISTS (artist_id, name, country, bio, cover_image_url) VALUES
(1,  N'Sơn Tùng M-TP',    N'Việt Nam',  N'Ca sĩ, nhạc sĩ nổi tiếng Việt Nam',           'https://img.com/sontung.jpg'),
(2,  N'Đen Vâu',          N'Việt Nam',  N'Rapper hàng đầu Việt Nam',                      'https://img.com/denvau.jpg'),
(3,  N'Hòa Minzy',        N'Việt Nam',  N'Ca sĩ nhạc Pop Việt Nam',                       'https://img.com/hoaminzy.jpg'),
(4,  N'BLACKPINK',         N'Hàn Quốc', N'Nhóm nhạc nữ Kpop nổi tiếng',                  'https://img.com/blackpink.jpg'),
(5,  N'Trúc Nhân',        N'Việt Nam',  N'Ca sĩ sáng tạo Việt Nam',                       'https://img.com/trucnhan.jpg'),
(6,  N'Bích Phương',      N'Việt Nam',  N'Ca sĩ nhạc Pop Việt Nam',                       'https://img.com/bichphuong.jpg'),
(7,  N'Jack',              N'Việt Nam',  N'Ca sĩ trẻ tài năng',                           'https://img.com/jack.jpg'),
(8,  N'Taylor Swift',      N'Mỹ',       N'Pop superstar and songwriter',                   'https://img.com/taylorswift.jpg'),
(9,  N'Ed Sheeran',        N'Anh',      N'Singer-songwriter nổi tiếng thế giới',           'https://img.com/edsheeran.jpg'),
(10, N'Karik',             N'Việt Nam',  N'Rapper nổi tiếng Việt Nam',                      'https://img.com/karik.jpg'),
(11, N'Mỹ Tâm',           N'Việt Nam',  N'Họa mi tóc nâu, diva nhạc Việt',               'https://img.com/mytam.jpg'),
(12, N'Đông Nhi',         N'Việt Nam',  N'Ca sĩ nhạc Pop năng động',                      'https://img.com/dongnhi.jpg'),
(13, N'Noo Phước Thịnh', N'Việt Nam',  N'Ca sĩ, vũ công nổi tiếng',                      'https://img.com/noophuocthinh.jpg'),
(14, N'MIN',               N'Việt Nam',  N'Ca sĩ trẻ phong cách hiện đại',                'https://img.com/min.jpg'),
(15, N'Vũ.',              N'Việt Nam',  N'Ca sĩ Indie nổi bật',                           'https://img.com/vu.jpg'),
(16, N'BTS',               N'Hàn Quốc', N'Nhóm nhạc nam Kpop hàng đầu thế giới',         'https://img.com/bts.jpg'),
(17, N'Bruno Mars',        N'Mỹ',       N'Ca sĩ Pop/R&B đa tài',                          'https://img.com/brunomars.jpg'),
(18, N'Adele',             N'Anh',      N'Ca sĩ giọng khủng nước Anh',                    'https://img.com/adele.jpg'),
(19, N'Phan Mạnh Quỳnh', N'Việt Nam',  N'Nhạc sĩ tài năng, ca sĩ Việt Nam',              'https://img.com/phanmanhquynh.jpg'),
(20, N'Tóc Tiên',         N'Việt Nam',  N'Ca sĩ phong cách hiện đại, quyến rũ',          'https://img.com/toctien.jpg');
SET IDENTITY_INSERT ARTISTS OFF;
GO

-- 7. ALBUMS (20 albums)
SET IDENTITY_INSERT ALBUMS ON;
INSERT INTO ALBUMS (album_id, title, artist_id, release_year, cover_image_url, record_label) VALUES
(1,  N'M-TP M-TP',                  1,  2017, 'https://img.com/album1.jpg',  N'M-TP Entertainment'),
(2,  N'Sky Tour',                    1,  2020, 'https://img.com/album2.jpg',  N'M-TP Entertainment'),
(3,  N'Đông Kiếm Em',              2,  2021, 'https://img.com/album3.jpg',  N'Independent'),
(4,  N'The Album',                   4,  2020, 'https://img.com/album4.jpg',  N'YG Entertainment'),
(5,  N'Lover',                       8,  2019, 'https://img.com/album5.jpg',  N'Republic Records'),
(6,  N'÷ (Divide)',                 9,  2017, 'https://img.com/album6.jpg',  N'Atlantic Records'),
(7,  N'Bích Phương Collection',    6,  2020, 'https://img.com/album7.jpg',  N'Independent'),
(8,  N'Trúc Nhân Hits',            5,  2022, 'https://img.com/album8.jpg',  N'Independent'),
(9,  N'Hòa Minzy Best',            3,  2021, 'https://img.com/album9.jpg',  N'Independent'),
(10, N'Jack Universe',               7,  2023, 'https://img.com/album10.jpg', N'Independent'),
(11, N'Tâm 9',                      11, 2018, 'https://img.com/album11.jpg', N'Independent'),
(12, N'Xin Lỗi Anh Quá Phiền',   12, 2021, 'https://img.com/album12.jpg', N'Independent'),
(13, N'Chạm Khẽ Tim Anh',         13, 2019, 'https://img.com/album13.jpg', N'Independent'),
(14, N'Trên Tình Bạn Dưới Tình Yêu', 14, 2020, 'https://img.com/album14.jpg', N'Universal Music'),
(15, N'Lạ Lùng',                    15, 2019, 'https://img.com/album15.jpg', N'Independent'),
(16, N'Map of the Soul: 7',          16, 2020, 'https://img.com/album16.jpg', N'Big Hit Entertainment'),
(17, N'24K Magic',                    17, 2016, 'https://img.com/album17.jpg', N'Atlantic Records'),
(18, N'30',                           18, 2021, 'https://img.com/album18.jpg', N'Columbia Records'),
(19, N'Có Chàng Trai Viết Lên Cây', 19, 2019, 'https://img.com/album19.jpg', N'Independent'),
(20, N'Big Girls Don''t Cry',        20, 2016, 'https://img.com/album20.jpg', N'Universal Music');
SET IDENTITY_INSERT ALBUMS OFF;
GO

-- 8. SONGS (45 songs)
SET IDENTITY_INSERT SONGS ON;
INSERT INTO SONGS (song_id, name, album_id, duration, file_path, lyrics) VALUES
-- Album 1: M-TP M-TP (Sơn Tùng)
(1,  N'Lạc Trôi',                       1,  280, '/music/lac_troi.mp3',           N'Lạc trôi giữa dòng đời vô định...'),
(2,  N'Nơi Này Có Anh',                1,  300, '/music/noi_nay_co_anh.mp3',     N'Nơi này có anh, ngàn hoa bay theo gió...'),
(6,  N'Nắng Ấm Xa Dần',               1,  250, '/music/nang_am_xa_dan.mp3',     N'Nắng ấm nay đã xa dần...'),
-- Album 2: Sky Tour (Sơn Tùng)
(3,  N'Chạy Ngay Đi',                  2,  265, '/music/chay_ngay_di.mp3',       N'Chạy ngay đi, chạy ngay đi...'),
(4,  N'Hãy Trao Cho Anh',              2,  310, '/music/hay_trao_cho_anh.mp3',   N'Give it to me, hãy trao cho anh...'),
(5,  N'Muộn Rồi Mà Sao Còn',          2,  295, '/music/muon_roi.mp3',           N'Muộn rồi mà sao còn mong...'),
(24, N'Waiting For You',                 2,  220, '/music/waiting_for_you.mp3',    N'Waiting for you, em ơi...'),
-- Album 3: Đông Kiếm Em (Đen Vâu)
(7,  N'Bài Này Chill Phết',            3,  275, '/music/bai_nay_chill.mp3',      N'Bài này chill phết, nghe đi rồi biết...'),
(8,  N'Đưa Nhau Đi Trốn',             3,  260, '/music/dua_nhau_di_tron.mp3',   N'Đưa nhau đi trốn khỏi thế gian...'),
(23, N'Nắng Có Mang Em Về',            3,  290, '/music/nang_co_mang.mp3',       N'Nắng có mang em về nơi đó...'),
-- Album 4: The Album (BLACKPINK)
(9,  N'How You Like That',              4,  190, '/music/hylt.mp3',               N'How you like that, how you like that...'),
(10, N'Lovesick Girls',                  4,  210, '/music/lovesick_girls.mp3',     N'We are lovesick girls...'),
-- Album 5: Lover (Taylor Swift)
(19, N'Lover',                           5,  221, '/music/lover.mp3',              N'We could leave the Christmas lights up...'),
(20, N'Shake It Off',                    5,  242, '/music/shake_it_off.mp3',       N'Cause the players gonna play play play...'),
-- Album 6: Divide (Ed Sheeran)
(17, N'Shape of You',                    6,  234, '/music/shape_of_you.mp3',       N'The club isn''t the best place to find a lover...'),
(18, N'Perfect',                         6,  263, '/music/perfect.mp3',            N'I found a love for me...'),
-- Album 7: Bích Phương Collection
(11, N'Đi Đu Đưa Đi',                 7,  205, '/music/di_du_dua_di.mp3',       N'Đi đu đưa đi, đi đu đưa đi...'),
(12, N'Bùa Yêu',                        7,  240, '/music/bua_yeu.mp3',            N'Bùa yêu bùa yêu...'),
-- Album 8: Trúc Nhân Hits
(13, N'Có Không Giữ Mất Đừng Tìm',    8,  230, '/music/co_khong_giu.mp3',       N'Có không giữ, mất đừng tìm...'),
(14, N'Sáng Mắt Chưa',                 8,  215, '/music/sang_mat_chua.mp3',      N'Sáng mắt chưa, sáng mắt chưa...'),
-- Album 9: Hòa Minzy Best
(15, N'Rời Bỏ',                         9,  285, '/music/roi_bo.mp3',             N'Rời bỏ, em rời bỏ...'),
(16, N'Không Thể Cùng Nhau Suốt Kiếp', 9,  270, '/music/khong_the.mp3',          N'Không thể cùng nhau suốt kiếp...'),
-- Album 10: Jack Universe
(21, N'Hồng Nhan',                      10, 255, '/music/hong_nhan.mp3',          N'Hồng nhan bạc phận...'),
(22, N'Sóng Gió',                       10, 248, '/music/song_gio.mp3',           N'Sóng gió cuộc đời...'),
(25, N'Cô Thắm Không Về',              10, 235, '/music/co_tham.mp3',            N'Cô Thắm không về, cô Thắm không về...'),
-- Album 11: Tâm 9 (Mỹ Tâm)
(26, N'Hãy Về Đây Bên Anh',           11, 268, '/music/hay_ve_day.mp3',         N'Hãy về đây bên anh, khi chiều nắng tắt...'),
(27, N'Người Hãy Quên Em Đi',          11, 245, '/music/nguoi_hay_quen.mp3',     N'Người hãy quên em đi...'),
-- Album 12: Xin Lỗi (Đông Nhi)
(28, N'Xin Lỗi Anh Quá Phiền',       12, 222, '/music/xin_loi_anh.mp3',        N'Xin lỗi anh quá phiền...'),
(29, N'Badboy',                          12, 198, '/music/badboy.mp3',             N'You are my bad boy...'),
-- Album 13: Chạm Khẽ (Noo Phước Thịnh)
(30, N'Chạm Khẽ Tim Anh Một Chút Thôi', 13, 275, '/music/cham_khe_tim.mp3',    N'Chạm khẽ tim anh một chút thôi...'),
(31, N'Cause I Love You',                13, 253, '/music/cause_i_love_you.mp3',  N'Cause I love you...'),
-- Album 14: Trên Tình Bạn (MIN)
(32, N'Trên Tình Bạn Dưới Tình Yêu',  14, 237, '/music/tren_tinh_ban.mp3',     N'Trên tình bạn dưới tình yêu...'),
(33, N'Cứ Chill Thôi',                  14, 288, '/music/cu_chill_thoi.mp3',      N'Cứ chill thôi mà, bình yên thôi mà...'),
-- Album 15: Lạ Lùng (Vũ.)
(34, N'Lạ Lùng',                        15, 302, '/music/la_lung.mp3',            N'Lạ lùng cứ thế cuốn em...'),
(35, N'Đông',                            15, 265, '/music/dong_vu.mp3',            N'Mùa đông không lạnh bằng...'),
-- Album 16: Map of the Soul (BTS)
(36, N'Dynamite',                         16, 199, '/music/dynamite.mp3',           N'Cause I I I''m in the stars tonight...'),
(37, N'Butter',                           16, 188, '/music/butter.mp3',             N'Smooth like butter...'),
-- Album 17: 24K Magic (Bruno Mars)
(38, N'24K Magic',                        17, 226, '/music/24k_magic.mp3',          N'24 karat magic in the air...'),
(39, N'Just The Way You Are',             17, 238, '/music/just_the_way.mp3',       N'Oh her eyes, her eyes...'),
-- Album 18: 30 (Adele)
(40, N'Rolling in the Deep',              18, 228, '/music/rolling_deep.mp3',       N'There''s a fire starting in my heart...'),
(41, N'Someone Like You',                 18, 285, '/music/someone_like_you.mp3',   N'I heard that you''re settled down...'),
-- Album 19: Có Chàng Trai (Phan Mạnh Quỳnh)
(42, N'Có Chàng Trai Viết Lên Cây',    19, 312, '/music/co_chang_trai.mp3',      N'Có chàng trai viết lên cây...'),
(43, N'Nước Ngoài',                      19, 258, '/music/nuoc_ngoai.mp3',         N'Nước ngoài có gì vui...'),
-- Album 20: Big Girls Don't Cry (Tóc Tiên)
(44, N'Big Girls Don''t Cry',            20, 241, '/music/big_girls.mp3',          N'Big girls don''t cry...'),
(45, N'Em Đây Chẳng Phải Thúy Kiều',  20, 218, '/music/em_day_chang.mp3',       N'Em đây chẳng phải Thúy Kiều...');
SET IDENTITY_INSERT SONGS OFF;
GO

-- 9. SONG_ARTISTS (55 rows)
-- Collabs (2+ artists): songs 4,15,22,23,24,25,33,45 -> Q20,Q21
INSERT INTO SONG_ARTISTS (song_id, artist_id, role) VALUES
-- Sơn Tùng M-TP (artist 1): 7 songs
(1,  1, 'main'),
(2,  1, 'main'),
(3,  1, 'main'),
(4,  1, 'main'),     (4,  10, 'featured'),   -- ft. Karik
(5,  1, 'main'),
(6,  1, 'main'),
(24, 1, 'main'),     (24, 10, 'featured'),   -- ft. Karik
-- Đen Vâu (artist 2): 3 songs + collabs
(7,  2, 'main'),
(8,  2, 'main'),
(23, 2, 'main'),     (23, 3,  'featured'),   -- ft. Hòa Minzy
-- BLACKPINK (artist 4)
(9,  4, 'main'),
(10, 4, 'main'),
-- Trúc Nhân (artist 5)
(13, 5, 'main'),
(14, 5, 'main'),
-- Bích Phương (artist 6)
(11, 6, 'main'),
(12, 6, 'main'),
-- Jack (artist 7)
(21, 7, 'main'),
(22, 7, 'main'),     (22, 10, 'featured'),   -- ft. Karik
(25, 7, 'main'),     (25, 2,  'featured'),   -- ft. Đen Vâu
-- Taylor Swift (artist 8)
(19, 8, 'main'),
(20, 8, 'main'),
-- Ed Sheeran (artist 9)
(17, 9, 'main'),
(18, 9, 'main'),
-- Hòa Minzy (artist 3): song 15 ft. Trúc Nhân -> Q9
(15, 3, 'main'),     (15, 5,  'featured'),
(16, 3, 'main'),
-- Mỹ Tâm (artist 11)
(26, 11, 'main'),
(27, 11, 'main'),
-- Đông Nhi (artist 12)
(28, 12, 'main'),
(29, 12, 'main'),
-- Noo Phước Thịnh (artist 13)
(30, 13, 'main'),
(31, 13, 'main'),
-- MIN (artist 14)
(32, 14, 'main'),
(33, 14, 'main'),    (33, 2,  'featured'),   -- Cứ Chill Thôi ft. Đen Vâu
-- Vũ. (artist 15)
(34, 15, 'main'),
(35, 15, 'main'),
-- BTS (artist 16)
(36, 16, 'main'),
(37, 16, 'main'),
-- Bruno Mars (artist 17)
(38, 17, 'main'),
(39, 17, 'main'),
-- Adele (artist 18)
(40, 18, 'main'),
(41, 18, 'main'),
-- Phan Mạnh Quỳnh (artist 19)
(42, 19, 'main'),
(43, 19, 'main'),
-- Tóc Tiên (artist 20)
(44, 20, 'main'),
(45, 20, 'main'),    (45, 10, 'featured');   -- ft. Karik
GO

-- 10. GENRES (20 genres)
SET IDENTITY_INSERT GENRES ON;
INSERT INTO GENRES (genre_id, genre_name, description) VALUES
(1,  N'Pop',          N'Nhạc Pop quốc tế'),
(2,  N'Rock',         N'Nhạc Rock'),
(3,  N'Vpop',         N'Nhạc Pop Việt Nam'),
(4,  N'Ballad',       N'Nhạc trữ tình'),
(5,  N'R&B',          N'Rhythm and Blues'),
(6,  N'EDM',          N'Electronic Dance Music'),
(7,  N'Kpop',         N'Nhạc Pop Hàn Quốc'),
(8,  N'Hip-Hop/Rap',  N'Nhạc Hip-Hop và Rap'),
(9,  N'Jazz',         N'Nhạc Jazz'),
(10, N'Classical',     N'Nhạc cổ điển'),
(11, N'Country',       N'Nhạc Country'),
(12, N'Indie',         N'Nhạc độc lập'),
(13, N'Lo-fi',         N'Nhạc Lo-fi thư giãn'),
(14, N'Latin',         N'Nhạc Latin'),
(15, N'Reggae',        N'Nhạc Reggae'),
(16, N'Blues',          N'Nhạc Blues'),
(17, N'Metal',         N'Nhạc Metal'),
(18, N'Acoustic',      N'Nhạc Acoustic'),
(19, N'Soul',          N'Nhạc Soul'),
(20, N'Funk',          N'Nhạc Funk');
SET IDENTITY_INSERT GENRES OFF;
GO

-- 11. SONG_GENRES (~85 rows)
INSERT INTO SONG_GENRES (song_id, genre_id) VALUES
-- Original 25 songs
(1,  3), (1,  1),                -- Lạc Trôi: Vpop, Pop
(2,  3), (2,  4),                -- Nơi Này Có Anh: Vpop, Ballad
(3,  3), (3,  6),                -- Chạy Ngay Đi: Vpop, EDM
(4,  3), (4,  1), (4,  8),      -- Hãy Trao Cho Anh: Vpop, Pop, Hip-Hop/Rap
(5,  3), (5,  4),                -- Muộn Rồi: Vpop, Ballad
(6,  3), (6,  1),                -- Nắng Ấm Xa Dần: Vpop, Pop
(7,  3), (7,  8),                -- Bài Này Chill Phết: Vpop, Hip-Hop/Rap
(8,  3),                          -- Đưa Nhau Đi Trốn: Vpop
(9,  7), (9,  1), (9,  6),      -- How You Like That: Kpop, Pop, EDM
(10, 7), (10, 1),                -- Lovesick Girls: Kpop, Pop
(11, 3), (11, 1), (11, 6),      -- Đi Đu Đưa Đi: Vpop, Pop, EDM
(12, 3), (12, 1),                -- Bùa Yêu: Vpop, Pop
(13, 3), (13, 1),                -- Có Không Giữ: Vpop, Pop
(14, 3), (14, 1), (14, 6),      -- Sáng Mắt Chưa: Vpop, Pop, EDM
(15, 3), (15, 4),                -- Rời Bỏ: Vpop, Ballad
(16, 3), (16, 4),                -- Không Thể: Vpop, Ballad
(17, 1),                          -- Shape of You: Pop
(18, 1), (18, 4),                -- Perfect: Pop, Ballad
(19, 1),                          -- Lover: Pop
(20, 1),                          -- Shake It Off: Pop
(21, 3), (21, 4),                -- Hồng Nhan: Vpop, Ballad
(22, 3), (22, 8),                -- Sóng Gió: Vpop, Hip-Hop/Rap
(23, 3), (23, 4),                -- Nắng Có Mang Em Về: Vpop, Ballad
(24, 3), (24, 8),                -- Waiting For You: Vpop, Hip-Hop/Rap
(25, 3),                          -- Cô Thắm: Vpop
-- New 20 songs (26-45)
(26, 3), (26, 4),                -- Hãy Về Đây Bên Anh: Vpop, Ballad
(27, 3), (27, 1),                -- Người Hãy Quên Em Đi: Vpop, Pop
(28, 3), (28, 1), (28, 6),      -- Xin Lỗi Anh: Vpop, Pop, EDM
(29, 3), (29, 1),                -- Badboy: Vpop, Pop
(30, 3), (30, 1),                -- Chạm Khẽ Tim Anh: Vpop, Pop
(31, 3), (31, 4),                -- Cause I Love You: Vpop, Ballad
(32, 3), (32, 1),                -- Trên Tình Bạn: Vpop, Pop
(33, 3), (33, 8), (33, 13),     -- Cứ Chill Thôi: Vpop, Hip-Hop/Rap, Lo-fi
(34, 3), (34, 12), (34, 18),    -- Lạ Lùng: Vpop, Indie, Acoustic
(35, 3), (35, 12),               -- Đông: Vpop, Indie
(36, 7), (36, 1),                -- Dynamite: Kpop, Pop
(37, 7), (37, 1), (37, 20),     -- Butter: Kpop, Pop, Funk
(38, 1), (38, 20), (38, 5),     -- 24K Magic: Pop, Funk, R&B
(39, 1), (39, 5),                -- Just The Way You Are: Pop, R&B
(40, 1), (40, 19),               -- Rolling in the Deep: Pop, Soul
(41, 1), (41, 4),                -- Someone Like You: Pop, Ballad
(42, 3), (42, 4), (42, 18),     -- Có Chàng Trai: Vpop, Ballad, Acoustic
(43, 3), (43, 1),                -- Nước Ngoài: Vpop, Pop
(44, 3), (44, 1), (44, 6),      -- Big Girls Don't Cry: Vpop, Pop, EDM
(45, 3), (45, 8);                -- Em Đây Chẳng Phải: Vpop, Hip-Hop/Rap
GO

-- 12. PLAYLISTS (20 playlists)
SET IDENTITY_INSERT PLAYLISTS ON;
INSERT INTO PLAYLISTS (playlist_id, user_id, name, description, is_public, created_at) VALUES
(1,  1,  N'Nhạc Chill Cuối Tuần',    N'Danh sách nhạc thư giãn cuối tuần',        1, '2026-01-15 10:00:00'),
(2,  2,  N'Vpop Hay Nhất 2026',       N'Tổng hợp nhạc Vpop hay nhất',              1, '2026-02-01 11:00:00'),
(3,  4,  N'Nhạc Của Tui',             N'Playlist cá nhân yêu thích',                1, '2026-02-10 12:00:00'),
(4,  4,  N'Nhạc Buồn Đêm Khuya',    N'Những bài hát buồn nghe đêm khuya',        0, '2026-02-15 13:00:00'),
(5,  5,  N'Party Mix',                 N'Nhạc sôi động cho party',                   1, '2026-03-01 14:00:00'),
(6,  3,  N'Morning Vibes',             N'Nhạc nhẹ nhàng buổi sáng',                 1, '2026-03-05 15:00:00'),
(7,  11, N'Tình Khúc Bất Hủ',        N'Những bài hát tình cảm kinh điển',          1, '2026-01-20 08:00:00'),
(8,  12, N'Workout Playlist',          N'Nhạc tập gym sôi động',                     1, '2026-02-05 09:00:00'),
(9,  13, N'Indie Việt',                N'Nhạc Indie Việt Nam hay nhất',              1, '2026-02-12 10:00:00'),
(10, 14, N'Kpop Favorites',            N'Tuyển tập Kpop yêu thích',                  1, '2026-02-20 11:00:00'),
(11, 15, N'Study Time',                N'Nhạc nghe khi học bài',                      1, '2026-03-01 12:00:00'),
(12, 16, N'Road Trip',                 N'Nhạc cho chuyến đi xa',                     1, '2026-03-03 13:00:00'),
(13, 17, N'Ballad Việt',              N'Tuyển tập Ballad hay nhất',                  1, '2026-03-06 14:00:00'),
(14, 18, N'US-UK Hits',                N'Nhạc US-UK hay nhất 2026',                  1, '2026-03-08 15:00:00'),
(15, 19, N'Top Rap Việt',             N'Nhạc Rap Việt Nam hay nhất',                 1, '2026-03-10 16:00:00'),
(16, 20, N'Nhạc Trẻ Hot',            N'Nhạc trẻ thịnh hành nhất',                   1, '2026-03-12 17:00:00'),
(17, 1,  N'My Favorites',              N'Bài hát yêu thích nhất của tui',            0, '2026-01-10 08:00:00'),
(18, 8,  N'EDM Night',                 N'Nhạc EDM cho đêm dài',                      1, '2026-02-18 19:00:00'),
(19, 9,  N'Acoustic Corner',           N'Nhạc Acoustic nhẹ nhàng',                   0, '2026-03-02 20:00:00'),
(20, 10, N'Throwback Hits',            N'Nhạc cũ nghe lại vẫn hay',                  1, '2026-03-05 21:00:00');
SET IDENTITY_INSERT PLAYLISTS OFF;
GO

-- 13. PLAYLIST_SONGS (60 rows)
-- playlist_id=1 does NOT contain song_id=10 initially (Q33 adds it, Q37 removes it)
INSERT INTO PLAYLIST_SONGS (playlist_id, song_id, position) VALUES
-- Playlist 1: Nhạc Chill (user_1)
(1, 7,  1), (1, 8,  2), (1, 23, 3), (1, 2,  4), (1, 18, 5),
-- Playlist 2: Vpop Hay Nhất (user_2)
(2, 1,  1), (2, 3,  2), (2, 4,  3), (2, 6,  4), (2, 12, 5),
-- Playlist 3: Nhạc Của Tui (user_4)
(3, 9,  1), (3, 10, 2), (3, 17, 3), (3, 20, 4),
-- Playlist 4: Nhạc Buồn (user_4, private)
(4, 2,  1), (4, 5,  2), (4, 15, 3), (4, 16, 4), (4, 41, 5),
-- Playlist 5: Party Mix (user_5)
(5, 3,  1), (5, 9,  2), (5, 11, 3), (5, 14, 4), (5, 17, 5),
-- Playlist 6: Morning Vibes (user_3)
(6, 18, 1), (6, 19, 2), (6, 23, 3), (6, 34, 4),
-- Playlist 7: Tình Khúc (user_9)
(7, 26, 1), (7, 27, 2), (7, 31, 3), (7, 42, 4), (7, 15, 5),
-- Playlist 8: Workout (user_10)
(8, 36, 1), (8, 37, 2), (8, 38, 3), (8, 9,  4), (8, 3,  5),
-- Playlist 9: Indie Việt (user_11)
(9, 34, 1), (9, 35, 2), (9, 7,  3),
-- Playlist 10: Kpop Favorites (user_12)
(10, 9,  1), (10, 10, 2), (10, 36, 3), (10, 37, 4),
-- Playlist 11: Study Time (user_13)
(11, 18, 1), (11, 34, 2), (11, 35, 3), (11, 42, 4),
-- Playlist 12: Road Trip (user_14)
(12, 1,  1), (12, 4,  2), (12, 38, 3), (12, 39, 4), (12, 44, 5),
-- Playlist 13: Ballad Việt (user_15)
(13, 2,  1), (13, 5,  2), (13, 15, 3), (13, 26, 4), (13, 31, 5),
-- Playlist 14: US-UK Hits (user_16)
(14, 17, 1), (14, 19, 2), (14, 20, 3), (14, 40, 4), (14, 41, 5),
-- Playlist 15: Top Rap Việt (user_17)
(15, 7,  1), (15, 22, 2), (15, 24, 3), (15, 33, 4),
-- Playlist 16: Nhạc Trẻ (user_18)
(16, 28, 1), (16, 29, 2), (16, 30, 3), (16, 43, 4), (16, 44, 5);
GO

-- 14. SONG_COMMENTS (35 rows)
-- user_1 is top commenter (11 comments) -> Q17
SET IDENTITY_INSERT SONG_COMMENTS ON;
INSERT INTO SONG_COMMENTS (comment_id, user_id, song_id, comment_text, timestamp_position, created_at) VALUES
-- Song 6 (Nắng Ấm Xa Dần) - 6 comments -> Q12
(1,  1,  6,  N'Bài hát hay quá! Nghe hoài không chán',              30,  '2026-03-01 10:00:00'),
(2,  2,  6,  N'Giai điệu tuyệt vời, rất cảm xúc',                  60,  '2026-03-02 11:00:00'),
(3,  3,  6,  N'Nghe đi nghe lại vẫn thấy hay',                      90,  '2026-03-03 12:00:00'),
(4,  4,  6,  N'Nắng ấm xa dần, lòng buồn man mác',                 120, '2026-03-04 09:00:00'),
(5,  5,  6,  N'Sơn Tùng hát hay lắm!',                              150, '2026-03-05 14:00:00'),
(6,  1,  6,  N'Replay lần thứ 100 rồi nè',                          45,  '2026-03-06 16:00:00'),

-- Song 20 (Shake It Off) - 4 comments -> Q11
(7,  1,  20, N'Taylor Swift is the best!',                            50,  '2026-03-10 08:00:00'),
(8,  2,  20, N'Great song! Can''t stop listening',                    100, '2026-03-11 09:00:00'),
(9,  3,  20, N'Can''t stop dancing to this',                          80,  '2026-03-12 10:00:00'),
(10, 5,  20, N'Love this track so much!',                             120, '2026-03-13 11:00:00'),

-- Comments by user_1 on other songs -> Q13
(11, 1,  1,  N'Lạc trôi nghe phê quá!',                              60,  '2026-03-05 10:00:00'),
(12, 1,  3,  N'Chạy ngay đi - beat cực đỉnh!',                      30,  '2026-03-06 11:00:00'),
(13, 1,  15, N'Rời bỏ - bài hát buồn nhất của Hòa Minzy',          100, '2026-03-07 12:00:00'),
(20, 1,  17, N'Shape of You cực hay, Ed Sheeran quá tài!',          60,  '2026-03-14 19:00:00'),

-- More comments on various songs
(14, 2,  15, N'Hòa Minzy hát quá xuất sắc luôn',                    50,  '2026-03-08 13:00:00'),
(15, 4,  15, N'Bài hát cảm xúc nhất mình từng nghe',               120, '2026-03-09 14:00:00'),
(16, 3,  1,  N'Classic Sơn Tùng! Không bao giờ lỗi thời',          40,  '2026-03-10 15:00:00'),
(17, 5,  7,  N'Đen Vâu flow quá đỉnh',                              70,  '2026-03-11 16:00:00'),
(18, 2,  9,  N'BLACKPINK in your area!',                              30,  '2026-03-12 17:00:00'),
(19, 4,  12, N'Bùa yêu - Bích Phương hay lắm nha!',                90,  '2026-03-13 18:00:00'),

-- NEW: more comments on new songs (by various users including new ones)
(21, 11, 26, N'Mỹ Tâm luôn là diva số 1!',                          40,  '2026-03-01 09:00:00'),
(22, 12, 28, N'Đông Nhi dễ thương quá',                              55,  '2026-03-02 10:00:00'),
(23, 13, 30, N'Chạm khẽ tim anh - quá đỉnh!',                      80,  '2026-03-03 11:00:00'),
(24, 14, 34, N'Indie vibes cực chill',                                65,  '2026-03-04 12:00:00'),
(25, 15, 36, N'Dynamite cực hay!',                                    45,  '2026-03-05 13:00:00'),
(26, 16, 38, N'Bruno Mars quá đỉnh luôn!',                           50,  '2026-03-06 14:00:00'),
(27, 17, 40, N'Rolling in the Deep - kinh điển',                      70,  '2026-03-07 15:00:00'),
(28, 18, 42, N'Phan Mạnh Quỳnh viết nhạc hay quá trời',            90,  '2026-03-08 16:00:00'),
(29, 1,  33, N'Cứ chill thôi mà, bình yên thôi mà!',               110, '2026-03-09 17:00:00'),
(30, 1,  36, N'BTS Dynamite nghe là muốn nhảy!',                     30,  '2026-03-10 18:00:00'),
(31, 19, 22, N'Sóng gió Jack ft. Karik hay lắm!',                   60,  '2026-03-11 19:00:00'),
(32, 20, 44, N'Tóc Tiên quá slay!',                                  45,  '2026-03-12 20:00:00'),
(33, 2,  41, N'Someone Like You nghe là khóc',                        80,  '2026-03-13 21:00:00'),
(34, 3,  39, N'Just The Way You Are cực lãng mạn',                   50,  '2026-03-14 22:00:00'),

-- comment_id=100 by user_id=5 on song 20 -> Q38
(100, 5, 20, N'Comment này sẽ bị xóa bởi admin hoặc chủ sở hữu',   30,  '2026-03-15 20:00:00');
SET IDENTITY_INSERT SONG_COMMENTS OFF;
GO

-- 15. COMMENT_LIKES (35 rows)
INSERT INTO COMMENT_LIKES (user_id, comment_id, liked_at) VALUES
-- Likes on song 6 comments -> Q12, Q14 (use @song_id=6)
(2,  1,  '2026-03-02 12:00:00'),   -- comment 1 (user_1): 4 likes
(3,  1,  '2026-03-03 12:00:00'),
(4,  1,  '2026-03-04 12:00:00'),
(5,  1,  '2026-03-05 12:00:00'),
(1,  2,  '2026-03-03 12:00:00'),   -- comment 2 (user_2): 3 likes
(4,  2,  '2026-03-04 12:00:00'),
(5,  2,  '2026-03-05 12:00:00'),
(1,  3,  '2026-03-04 12:00:00'),   -- comment 3 (user_3): 2 likes
(2,  3,  '2026-03-05 12:00:00'),
(1,  4,  '2026-03-05 12:00:00'),   -- comment 4 (user_4): 1 like
(3,  5,  '2026-03-06 12:00:00'),   -- comment 5 (user_5): 2 likes
(1,  5,  '2026-03-07 12:00:00'),
(2,  6,  '2026-03-07 12:00:00'),   -- comment 6 (user_1): 1 like
-- Likes on other comments
(2,  7,  '2026-03-11 12:00:00'),
(3,  7,  '2026-03-12 12:00:00'),
(5,  8,  '2026-03-12 12:00:00'),
(1,  9,  '2026-03-13 12:00:00'),
(4,  11, '2026-03-06 12:00:00'),
(5,  11, '2026-03-07 12:00:00'),
(3,  12, '2026-03-07 12:00:00'),
(2,  13, '2026-03-08 12:00:00'),
(1,  14, '2026-03-09 12:00:00'),
-- Likes on new comments
(11, 21, '2026-03-02 13:00:00'),
(12, 22, '2026-03-03 14:00:00'),
(1,  23, '2026-03-04 15:00:00'),
(2,  24, '2026-03-05 16:00:00'),
(3,  25, '2026-03-06 17:00:00'),
(4,  26, '2026-03-07 18:00:00'),
(5,  27, '2026-03-08 19:00:00'),
(1,  28, '2026-03-09 20:00:00'),
(11, 29, '2026-03-10 21:00:00'),
(12, 30, '2026-03-11 22:00:00'),
-- Likes on comment 100 -> Q18 (use comment_id=100)
(3,  100, '2026-03-16 12:00:00'),
(4,  100, '2026-03-16 13:00:00'),
(1,  100, '2026-03-16 14:00:00');
GO

-- 16. SONG_LIKES (50 rows)
-- user_id=5 likes song_id=20 -> Q39
INSERT INTO SONG_LIKES (user_id, song_id, liked_at) VALUES
-- Song 1: 5 likes
(1,  1,  '2026-03-01 10:00:00'),
(2,  1,  '2026-03-02 10:00:00'),
(3,  1,  '2026-03-03 10:00:00'),
(4,  1,  '2026-03-04 10:00:00'),
(5,  1,  '2026-03-05 10:00:00'),
-- Song 3: 3 likes
(1,  3,  '2026-03-02 11:00:00'),
(2,  3,  '2026-03-03 11:00:00'),
(3,  3,  '2026-03-04 11:00:00'),
-- Song 4: 4 likes
(1,  4,  '2026-03-03 12:00:00'),
(2,  4,  '2026-03-04 12:00:00'),
(3,  4,  '2026-03-05 12:00:00'),
(4,  4,  '2026-03-06 12:00:00'),
-- Song 6: 3 likes
(1,  6,  '2026-03-01 14:00:00'),
(2,  6,  '2026-03-02 14:00:00'),
(3,  6,  '2026-03-03 14:00:00'),
-- Song 7: 2 likes
(1,  7,  '2026-03-05 15:00:00'),
(2,  7,  '2026-03-06 15:00:00'),
-- Song 9: 5 likes
(1,  9,  '2026-03-07 16:00:00'),
(2,  9,  '2026-03-08 16:00:00'),
(3,  9,  '2026-03-09 16:00:00'),
(4,  9,  '2026-03-10 16:00:00'),
(5,  9,  '2026-03-11 16:00:00'),
-- Song 12: 2 likes
(1,  12, '2026-03-08 17:00:00'),
(3,  12, '2026-03-09 17:00:00'),
-- Song 15: 3 likes
(1,  15, '2026-03-10 18:00:00'),
(2,  15, '2026-03-11 18:00:00'),
(4,  15, '2026-03-12 18:00:00'),
-- Song 17: 3 likes
(1,  17, '2026-03-11 19:00:00'),
(2,  17, '2026-03-12 19:00:00'),
(3,  17, '2026-03-13 19:00:00'),
-- Song 20: 3 likes (incl. user_5 -> Q39)
(5,  20, '2026-03-12 20:00:00'),
(1,  20, '2026-03-13 20:00:00'),
(2,  20, '2026-03-14 20:00:00'),
-- Song 22: 2 likes
(1,  22, '2026-03-14 21:00:00'),
(2,  22, '2026-03-15 21:00:00'),
-- NEW: likes on new songs
(11, 26, '2026-03-01 08:00:00'),
(12, 26, '2026-03-02 08:00:00'),
(13, 30, '2026-03-03 08:00:00'),
(14, 30, '2026-03-04 08:00:00'),
(15, 34, '2026-03-05 08:00:00'),
(16, 36, '2026-03-06 08:00:00'),
(17, 36, '2026-03-07 08:00:00'),
(18, 38, '2026-03-08 08:00:00'),
(19, 40, '2026-03-09 08:00:00'),
(20, 40, '2026-03-10 08:00:00'),
(11, 42, '2026-03-11 08:00:00'),
(12, 42, '2026-03-12 08:00:00'),
(13, 42, '2026-03-13 08:00:00'),
(14, 44, '2026-03-14 08:00:00'),
(15, 44, '2026-03-15 08:00:00'),
(16, 41, '2026-03-16 08:00:00');
GO

-- 17. USER_SONGS (150 rows - Listen history)
-- user_1 has most listens -> Q29
-- song 1 has most total plays -> Q26
-- Recent (last 7 days) for trending -> Q27
INSERT INTO USER_SONGS (user_id, song_id, listened_at) VALUES
-- ===== RECENT (last 7 days: Mar 11-17, 2026) =====
-- Song 1 - Lạc Trôi (8 recent plays)
(1,  1,  '2026-03-11 08:00:00'),
(1,  1,  '2026-03-12 09:00:00'),
(1,  1,  '2026-03-13 10:00:00'),
(2,  1,  '2026-03-14 11:00:00'),
(3,  1,  '2026-03-15 12:00:00'),
(4,  1,  '2026-03-16 08:00:00'),
(5,  1,  '2026-03-17 09:00:00'),
(11, 1,  '2026-03-17 10:00:00'),
-- Song 3 - Chạy Ngay Đi (5 recent)
(1,  3,  '2026-03-11 10:00:00'),
(2,  3,  '2026-03-12 11:00:00'),
(3,  3,  '2026-03-13 12:00:00'),
(4,  3,  '2026-03-14 13:00:00'),
(5,  3,  '2026-03-15 14:00:00'),
-- Song 4 - Hãy Trao Cho Anh (5 recent)
(1,  4,  '2026-03-11 14:00:00'),
(2,  4,  '2026-03-12 15:00:00'),
(3,  4,  '2026-03-13 16:00:00'),
(4,  4,  '2026-03-14 17:00:00'),
(12, 4,  '2026-03-15 08:00:00'),
-- Song 6 - Nắng Ấm Xa Dần (3 recent)
(1,  6,  '2026-03-12 08:00:00'),
(2,  6,  '2026-03-13 09:00:00'),
(3,  6,  '2026-03-14 10:00:00'),
-- Song 7 - Bài Này Chill Phết (3 recent)
(1,  7,  '2026-03-15 11:00:00'),
(2,  7,  '2026-03-16 12:00:00'),
(3,  7,  '2026-03-17 13:00:00'),
-- Song 9 - How You Like That (7 recent)
(1,  9,  '2026-03-11 15:00:00'),
(2,  9,  '2026-03-12 16:00:00'),
(3,  9,  '2026-03-13 17:00:00'),
(4,  9,  '2026-03-14 18:00:00'),
(5,  9,  '2026-03-15 19:00:00'),
(1,  9,  '2026-03-16 20:00:00'),
(14, 9,  '2026-03-17 08:00:00'),
-- Song 12 - Bùa Yêu (2 recent)
(1,  12, '2026-03-14 08:00:00'),
(2,  12, '2026-03-15 09:00:00'),
-- Song 15 - Rời Bỏ (2 recent)
(1,  15, '2026-03-16 10:00:00'),
(2,  15, '2026-03-17 11:00:00'),
-- Song 17 - Shape of You (4 recent)
(1,  17, '2026-03-13 12:00:00'),
(2,  17, '2026-03-14 13:00:00'),
(3,  17, '2026-03-15 14:00:00'),
(13, 17, '2026-03-16 08:00:00'),
-- Song 20 - Shake It Off (3 recent)
(1,  20, '2026-03-11 16:00:00'),
(2,  20, '2026-03-12 17:00:00'),
(5,  20, '2026-03-13 18:00:00'),
-- Song 22 - Sóng Gió (3 recent)
(1,  22, '2026-03-15 15:00:00'),
(2,  22, '2026-03-16 16:00:00'),
(15, 22, '2026-03-17 09:00:00'),
-- Song 36 - Dynamite (4 recent)
(14, 36, '2026-03-11 08:00:00'),
(15, 36, '2026-03-12 09:00:00'),
(16, 36, '2026-03-13 10:00:00'),
(1,  36, '2026-03-14 11:00:00'),
-- Song 26 - Hãy Về Đây Bên Anh (3 recent)
(11, 26, '2026-03-12 08:00:00'),
(12, 26, '2026-03-13 09:00:00'),
(1,  26, '2026-03-14 10:00:00'),
-- Song 30 - Chạm Khẽ Tim Anh (2 recent)
(13, 30, '2026-03-15 08:00:00'),
(1,  30, '2026-03-16 09:00:00'),
-- Song 38 - 24K Magic (3 recent)
(16, 38, '2026-03-13 08:00:00'),
(17, 38, '2026-03-14 09:00:00'),
(1,  38, '2026-03-15 10:00:00'),
-- Song 34 - Lạ Lùng (2 recent)
(15, 34, '2026-03-14 08:00:00'),
(1,  34, '2026-03-15 09:00:00'),
-- Song 42 - Có Chàng Trai (2 recent)
(18, 42, '2026-03-16 08:00:00'),
(19, 42, '2026-03-17 09:00:00'),
-- Song 40 - Rolling in the Deep (2 recent)
(17, 40, '2026-03-15 08:00:00'),
(18, 40, '2026-03-16 09:00:00'),

-- ===== OLDER (Feb 2026) =====
-- Song 1 (4 older -> total 12)
(1,  1,  '2026-02-01 08:00:00'),
(1,  1,  '2026-02-05 09:00:00'),
(2,  1,  '2026-02-10 10:00:00'),
(3,  1,  '2026-02-15 11:00:00'),
-- Song 2 (3 plays total)
(1,  2,  '2026-02-01 12:00:00'),
(2,  2,  '2026-02-05 13:00:00'),
(3,  2,  '2026-02-10 14:00:00'),
-- Song 3 (2 older -> total 7)
(1,  3,  '2026-02-01 15:00:00'),
(2,  3,  '2026-02-05 16:00:00'),
-- Song 4 (5 older -> total 10)
(1,  4,  '2026-02-02 08:00:00'),
(2,  4,  '2026-02-06 09:00:00'),
(3,  4,  '2026-02-11 10:00:00'),
(4,  4,  '2026-02-16 11:00:00'),
(5,  4,  '2026-02-20 12:00:00'),
-- Song 5 (2 plays total)
(1,  5,  '2026-02-03 13:00:00'),
(2,  5,  '2026-02-07 14:00:00'),
-- Song 6 (3 older -> total 6)
(1,  6,  '2026-02-04 15:00:00'),
(2,  6,  '2026-02-08 16:00:00'),
(3,  6,  '2026-02-12 17:00:00'),
-- Song 7 (1 older -> total 4)
(1,  7,  '2026-02-05 18:00:00'),
-- Song 9 (4 older -> total 11)
(1,  9,  '2026-02-06 08:00:00'),
(2,  9,  '2026-02-10 09:00:00'),
(3,  9,  '2026-02-14 10:00:00'),
(4,  9,  '2026-02-18 11:00:00'),
-- Song 10 (2 plays total)
(1,  10, '2026-02-07 12:00:00'),
(2,  10, '2026-02-11 13:00:00'),
-- Song 12 (1 older -> total 3)
(1,  12, '2026-02-08 14:00:00'),
-- Song 15 (3 older -> total 5)
(1,  15, '2026-02-09 15:00:00'),
(2,  15, '2026-02-13 16:00:00'),
(3,  15, '2026-02-17 17:00:00'),
-- Song 17 (2 older -> total 6)
(1,  17, '2026-02-10 18:00:00'),
(2,  17, '2026-02-14 08:00:00'),
-- Song 19 (2 plays total)
(1,  19, '2026-02-11 09:00:00'),
(2,  19, '2026-02-15 10:00:00'),
-- Song 20 (3 older -> total 6)
(1,  20, '2026-02-12 11:00:00'),
(2,  20, '2026-02-16 12:00:00'),
(3,  20, '2026-02-20 13:00:00'),
-- Song 21 (2 plays total)
(1,  21, '2026-02-13 14:00:00'),
(2,  21, '2026-02-17 15:00:00'),
-- Song 22 (1 older -> total 4)
(1,  22, '2026-02-14 16:00:00'),
-- Song 23 (2 plays total)
(1,  23, '2026-02-15 17:00:00'),
(2,  23, '2026-02-19 18:00:00'),
-- New songs older plays
-- Song 26 (2 older -> total 5)
(11, 26, '2026-02-01 08:00:00'),
(1,  26, '2026-02-10 09:00:00'),
-- Song 27 (2 plays)
(11, 27, '2026-02-02 10:00:00'),
(12, 27, '2026-02-12 11:00:00'),
-- Song 28 (2 plays)
(12, 28, '2026-02-03 12:00:00'),
(13, 28, '2026-02-13 13:00:00'),
-- Song 29 (2 plays)
(12, 29, '2026-02-04 14:00:00'),
(14, 29, '2026-02-14 15:00:00'),
-- Song 30 (2 older -> total 4)
(13, 30, '2026-02-05 16:00:00'),
(1,  30, '2026-02-15 17:00:00'),
-- Song 31 (2 plays)
(13, 31, '2026-02-06 18:00:00'),
(11, 31, '2026-02-16 08:00:00'),
-- Song 32 (2 plays)
(14, 32, '2026-02-07 09:00:00'),
(15, 32, '2026-02-17 10:00:00'),
-- Song 33 (2 plays)
(14, 33, '2026-02-08 11:00:00'),
(1,  33, '2026-02-18 12:00:00'),
-- Song 34 (2 older -> total 4)
(15, 34, '2026-02-09 13:00:00'),
(1,  34, '2026-02-19 14:00:00'),
-- Song 35 (2 plays)
(15, 35, '2026-02-10 15:00:00'),
(16, 35, '2026-02-20 16:00:00'),
-- Song 36 (3 older -> total 7)
(16, 36, '2026-02-01 17:00:00'),
(14, 36, '2026-02-11 18:00:00'),
(1,  36, '2026-02-21 08:00:00'),
-- Song 37 (2 plays)
(16, 37, '2026-02-02 09:00:00'),
(14, 37, '2026-02-12 10:00:00'),
-- Song 38 (2 older -> total 5)
(17, 38, '2026-02-03 11:00:00'),
(1,  38, '2026-02-13 12:00:00'),
-- Song 39 (2 plays)
(17, 39, '2026-02-04 13:00:00'),
(18, 39, '2026-02-14 14:00:00'),
-- Song 40 (2 older -> total 4)
(18, 40, '2026-02-05 15:00:00'),
(17, 40, '2026-02-15 16:00:00'),
-- Song 41 (2 plays)
(18, 41, '2026-02-06 17:00:00'),
(16, 41, '2026-02-16 18:00:00'),
-- Song 42 (2 older -> total 4)
(19, 42, '2026-02-07 08:00:00'),
(1,  42, '2026-02-17 09:00:00'),
-- Song 43 (2 plays)
(19, 43, '2026-02-08 10:00:00'),
(20, 43, '2026-02-18 11:00:00'),
-- Song 44 (2 plays)
(20, 44, '2026-02-09 12:00:00'),
(14, 44, '2026-02-19 13:00:00'),
-- Song 45 (2 plays)
(20, 45, '2026-02-10 14:00:00'),
(1,  45, '2026-02-20 15:00:00');
GO

-- =============================================
-- RECORD COUNTS SUMMARY:
-- =============================================
-- ROLES:               3  (excluded)
-- USERS:              20
-- SUBSCRIPTION_PLANS:  5  (excluded)
-- USER_SUBSCRIPTIONS: 25
-- PAYMENTS:           30
-- ARTISTS:            20
-- ALBUMS:             20
-- SONGS:              45
-- SONG_ARTISTS:       55
-- GENRES:             20
-- SONG_GENRES:        85
-- PLAYLISTS:          20
-- PLAYLIST_SONGS:     60
-- SONG_COMMENTS:      35
-- COMMENT_LIKES:      35
-- SONG_LIKES:         50
-- USER_SONGS:        150
-- =============================================
-- Q7:  use album_id=2 (Sky Tour: 4 songs)
-- Q14: use @song_id=6
-- Q16: use @song_id=6, @timestamp=30
-- Q18: use comment_id=100
-- =============================================
