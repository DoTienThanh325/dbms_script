USE music_streamingDB;
GO

-- 1. ROLES
INSERT INTO ROLES (role_name, permissions)
VALUES 
    ('admin', 'ALL_PRIVILEGES'),
    ('moderator', 'MANAGE_USERS, MANAGE_CONTENT'),
    ('user', 'BASIC_ACCESS');
GO

-- 2. USERS (Mật khẩu được băm giả định)
INSERT INTO USERS (username, email, password_hash, avatar_url, role_id)
VALUES 
    (N'admin_boss', 'admin@music.com', 'hashed_pw_123', 'https://avatar.com/admin.jpg', 1),
    (N'hieu_nguyen', 'hieu@email.com', 'hashed_pw_456', 'https://avatar.com/hieu.jpg', 3),
    (N'music_lover99', 'lover99@email.com', 'hashed_pw_789', 'https://avatar.com/lover.jpg', 3),
    (N'mod_anh', 'mod@music.com', 'hashed_pw_012', NULL, 2);
GO

-- 3. SUBSCRIPTION_PLANS
INSERT INTO SUBSCRIPTION_PLANS (plan_name, price, duration_months, ad_free, high_quality_audio, max_downloads)
VALUES 
    ('Free', 0.00, 1, 0, 0, 0),
    ('Premium Individual', 59000.00, 1, 1, 1, 10000),
    ('Premium Student', 29000.00, 1, 1, 1, 10000),
    ('Premium Family', 89000.00, 1, 1, 1, 30000);
GO

-- 4. USER_SUBSCRIPTIONS
INSERT INTO USER_SUBSCRIPTIONS (user_id, plan_id, start_date, end_date, status, auto_renew)
VALUES 
    (2, 2, '2023-10-01', '2023-11-01', 'active', 1),  -- hieu_nguyen xài Premium Individual
    (3, 1, '2023-01-01', '2099-12-31', 'active', 0),  -- music_lover99 xài Free
    (2, 2, '2023-09-01', '2023-10-01', 'expired', 1); -- Gói cũ của hieu_nguyen
GO

-- 5. PAYMENTS
INSERT INTO PAYMENTS (subscription_id, amount, payment_date, status, transaction_id)
VALUES 
    (1, 59000.00, '2023-10-01 08:30:00', 'completed', 'TXN-99887766'),
    (3, 59000.00, '2023-09-01 08:30:00', 'completed', 'TXN-11223344');
GO

-- 6. ARTISTS
INSERT INTO ARTISTS (name, country, bio, cover_image_url)
VALUES 
    (N'Sơn Tùng M-TP', 'Vietnam', N'Hoàng tử V-Pop', 'https://img.com/sontung.jpg'),
    (N'Taylor Swift', 'USA', N'Pop superstar and songwriter', 'https://img.com/taylor.jpg'),
    (N'Da LAB', 'Vietnam', N'Nhóm nhạc Rap/Indie nổi tiếng', 'https://img.com/dalab.jpg');
GO

-- 7. ALBUMS
INSERT INTO ALBUMS (title, artist_id, release_year, cover_image_url, record_label)
VALUES 
    (N'Chúng Ta Của Hiện Tại', 1, 2020, 'https://img.com/chungta.jpg', 'M-TP Entertainment'),
    (N'1989 (Taylor''s Version)', 2, 2023, 'https://img.com/1989.jpg', 'Republic Records'),
    (N'Gác Lại Âu Lo', 3, 2020, 'https://img.com/gaclai.jpg', 'Da LAB Independent');
GO

-- 8. SONGS
-- Lưu ý: duration tính bằng giây
INSERT INTO SONGS (name, album_id, duration, file_path, lyrics, uploaded_at)
VALUES 
    (N'Chúng Ta Của Hiện Tại', 1, 301, '/audio/chung_ta_cua_hien_tai.mp3', N'Mùa thu mang giấc mơ quay về...', GETDATE()),
    (N'Blank Space', 2, 231, '/audio/blank_space.mp3', N'Nice to meet you, where you been?', GETDATE()),
    (N'Gác Lại Âu Lo', 3, 274, '/audio/gac_lai_au_lo.mp3', N'Gác lại âu lo, làm ly cối...', GETDATE()),
    (N'Shake It Off', 2, 219, '/audio/shake_it_off.mp3', N'I stay out too late...', GETDATE());
GO

-- 9. SONG_ARTISTS (N-N)
-- roles: main, featured, composer, producer
INSERT INTO SONG_ARTISTS (song_id, artist_id, role)
VALUES 
    (1, 1, 'main'),
    (1, 1, 'composer'),
    (2, 2, 'main'),
    (3, 3, 'main'),
    (4, 2, 'main');
GO

-- 10. GENRES
INSERT INTO GENRES (genre_name, description)
VALUES 
    ('V-Pop', N'Nhạc Pop Việt Nam'),
    ('Pop', N'Nhạc Pop Quốc Tế'),
    ('Indie', N'Âm nhạc độc lập'),
    ('Rap', N'Nhạc Rap / Hip Hop');
GO

-- 11. SONG_GENRES (N-N)
INSERT INTO SONG_GENRES (song_id, genre_id)
VALUES 
    (1, 1), -- Chúng Ta Của Hiện Tại -> V-Pop
    (2, 2), -- Blank Space -> Pop
    (3, 3), -- Gác Lại Âu Lo -> Indie
    (3, 4), -- Gác Lại Âu Lo -> Rap
    (4, 2); -- Shake It Off -> Pop
GO

-- 12. PLAYLISTS
INSERT INTO PLAYLISTS (user_id, name, description, is_public)
VALUES 
    (2, N'Chill Cuối Tuần', N'Nhạc nghe thư giãn ngày Chủ Nhật', 1),
    (2, N'Lái Xe', N'Nhạc nghe trên ô tô', 0), -- Private playlist
    (3, N'Nhạc US-UK', N'Top hits', 1);
GO

-- 13. PLAYLIST_SONGS (N-N)
INSERT INTO PLAYLIST_SONGS (playlist_id, song_id, position)
VALUES 
    (1, 1, 1),
    (1, 3, 2),
    (2, 1, 1),
    (3, 2, 1),
    (3, 4, 2);
GO

-- 14. SONG_COMMENTS
INSERT INTO SONG_COMMENTS (user_id, song_id, comment_text, timestamp_position)
VALUES 
    (2, 1, N'Bài này beat cháy quá!', 65), -- Comment tại giây thứ 65
    (3, 2, N'Masterpiece!', 0),
    (4, 1, N'Giọng Sơn Tùng đỉnh thật', 120);
GO

-- 15. COMMENT_LIKES
INSERT INTO COMMENT_LIKES (user_id, comment_id)
VALUES 
    (3, 1), -- music_lover99 likes comment của hieu_nguyen
    (2, 2); -- hieu_nguyen likes comment của music_lover99
GO

-- 16. SONG_LIKES
INSERT INTO SONG_LIKES (user_id, song_id)
VALUES 
    (2, 1),
    (2, 3),
    (3, 2),
    (3, 4);
GO

-- 17. USER_SONGS (Lịch sử nghe nhạc)
INSERT INTO USER_SONGS (user_id, song_id, listened_at)
VALUES 
    (2, 1, DATEADD(DAY, -2, GETDATE())),
    (2, 3, DATEADD(HOUR, -5, GETDATE())),
    (2, 1, DATEADD(HOUR, -1, GETDATE())), -- Nghe lại
    (3, 2, DATEADD(DAY, -1, GETDATE())),
    (3, 4, GETDATE());
GO