INSERT INTO ROLES (role_name, permissions) VALUES
('admin', 'ALL'),
('user', 'BASIC'),
('moderator', 'MODERATE');

INSERT INTO USERS (username, email, password_hash, avatar_url, role_id) VALUES
('admin1','admin1@mail.com','hash1',NULL,1),
('mod1','mod1@mail.com','hash2',NULL,3),
('user1','user1@mail.com','hash3',NULL,2),
('user2','user2@mail.com','hash4',NULL,2),
('user3','user3@mail.com','hash5',NULL,2),
('user4','user4@mail.com','hash6',NULL,2),
('user5','user5@mail.com','hash7',NULL,2),
('user6','user6@mail.com','hash8',NULL,2),
('user7','user7@mail.com','hash9',NULL,2),
('user8','user8@mail.com','hash10',NULL,2),
('user9','user9@mail.com','hash11',NULL,2),
('user10','user10@mail.com','hash12',NULL,2),
('user11','user11@mail.com','hash13',NULL,2),
('user12','user12@mail.com','hash14',NULL,2),
('user13','user13@mail.com','hash15',NULL,2),
('user14','user14@mail.com','hash16',NULL,2),
('user15','user15@mail.com','hash17',NULL,2),
('user16','user16@mail.com','hash18',NULL,2),
('user17','user17@mail.com','hash19',NULL,2),
('user18','user18@mail.com','hash20',NULL,2);

INSERT INTO SUBSCRIPTION_PLANS 
(plan_name, price, duration_months, ad_free, high_quality_audio, max_downloads)
VALUES
('Free',0,0,0,0,0),
('Premium',9.99,1,1,1,100),
('Family',19.99,1,1,1,500);

INSERT INTO ARTISTS (name, country, bio, cover_image_url) VALUES
(N'Sơn Tùng M-TP',N'Vietnam',N'Pop singer',NULL),
(N'Jack',N'Vietnam',N'Vpop artist',NULL),
(N'BTS',N'Korea',N'Kpop group',NULL),
(N'Taylor Swift',N'USA',N'Pop star',NULL),
(N'Ed Sheeran',N'UK',N'Pop artist',NULL),
(N'Justin Bieber',N'Canada',N'Pop singer',NULL),
(N'Ariana Grande',N'USA',N'Pop singer',NULL),
(N'Drake',N'Canada',N'Rapper',NULL),
(N'Bruno Mars',N'USA',N'Pop singer',NULL),
(N'The Weeknd',N'Canada',N'R&B artist',NULL),
(N'Blackpink',N'Korea',N'Girl group',NULL),
(N'Big Bang',N'Korea',N'Kpop group',NULL),
(N'Coldplay',N'UK',N'Band',NULL),
(N'Maroon 5',N'USA',N'Band',NULL),
(N'Dua Lipa',N'UK',N'Pop singer',NULL),
(N'Billie Eilish',N'USA',N'Pop singer',NULL),
(N'Imagine Dragons',N'USA',N'Band',NULL),
(N'Charlie Puth',N'USA',N'Pop singer',NULL),
(N'Sam Smith',N'UK',N'Pop singer',NULL),
(N'Adele',N'UK',N'Pop singer',NULL);

INSERT INTO ALBUMS (title, artist_id, release_year, cover_image_url, record_label) VALUES
(N'Album 1',1,2020,NULL,N'MTP'),
(N'Album 2',2,2021,NULL,N'J97'),
(N'Album 3',3,2022,NULL,N'Hybe'),
(N'Album 4',4,2023,NULL,N'Republic'),
(N'Album 5',5,2020,NULL,N'Atlantic'),
(N'Album 6',6,2021,NULL,N'Def Jam'),
(N'Album 7',7,2022,NULL,N'Republic'),
(N'Album 8',8,2023,NULL,N'OVO'),
(N'Album 9',9,2019,NULL,N'Atlantic'),
(N'Album 10',10,2022,NULL,N'Republic'),
(N'Album 11',11,2020,NULL,N'YG'),
(N'Album 12',12,2018,NULL,N'YG'),
(N'Album 13',13,2021,NULL,N'Parlophone'),
(N'Album 14',14,2020,NULL,N'Interscope'),
(N'Album 15',15,2022,NULL,N'Warner'),
(N'Album 16',16,2021,NULL,N'Darkroom'),
(N'Album 17',17,2023,NULL,N'Interscope'),
(N'Album 18',18,2020,NULL,N'Atlantic'),
(N'Album 19',19,2021,NULL,N'Capitol'),
(N'Album 20',20,2022,NULL,N'Columbia');

INSERT INTO SONGS (name, album_id, duration, file_path, lyrics) VALUES
(N'Song 1',1,210,'/music/song1.mp3',NULL),
(N'Song 2',2,200,'/music/song2.mp3',NULL),
(N'Song 3',3,180,'/music/song3.mp3',NULL),
(N'Song 4',4,240,'/music/song4.mp3',NULL),
(N'Song 5',5,230,'/music/song5.mp3',NULL),
(N'Song 6',6,220,'/music/song6.mp3',NULL),
(N'Song 7',7,210,'/music/song7.mp3',NULL),
(N'Song 8',8,250,'/music/song8.mp3',NULL),
(N'Song 9',9,260,'/music/song9.mp3',NULL),
(N'Song 10',10,190,'/music/song10.mp3',NULL),
(N'Song 11',11,210,'/music/song11.mp3',NULL),
(N'Song 12',12,220,'/music/song12.mp3',NULL),
(N'Song 13',13,200,'/music/song13.mp3',NULL),
(N'Song 14',14,230,'/music/song14.mp3',NULL),
(N'Song 15',15,240,'/music/song15.mp3',NULL),
(N'Song 16',16,210,'/music/song16.mp3',NULL),
(N'Song 17',17,200,'/music/song17.mp3',NULL),
(N'Song 18',18,190,'/music/song18.mp3',NULL),
(N'Song 19',19,220,'/music/song19.mp3',NULL),
(N'Song 20',20,230,'/music/song20.mp3',NULL),
(N'Song 21',1,200,'/music/song21.mp3',NULL),
(N'Song 22',2,210,'/music/song22.mp3',NULL),
(N'Song 23',3,220,'/music/song23.mp3',NULL),
(N'Song 24',4,230,'/music/song24.mp3',NULL),
(N'Song 25',5,240,'/music/song25.mp3',NULL);

INSERT INTO USER_SUBSCRIPTIONS 
(user_id, plan_id, start_date, end_date, status, auto_renew) VALUES
(1,2,'2025-01-01','2025-02-01','active',1),
(2,2,'2025-01-05','2025-02-05','active',1),
(3,1,'2025-01-01',NULL,'free',0),
(4,2,'2025-01-10','2025-02-10','active',1),
(5,3,'2025-01-15','2025-02-15','active',1),
(6,2,'2025-01-01','2025-02-01','expired',0),
(7,1,'2025-01-01',NULL,'free',0),
(8,2,'2025-01-03','2025-02-03','active',1),
(9,3,'2025-01-07','2025-02-07','active',1),
(10,2,'2025-01-02','2025-02-02','active',1),
(11,1,'2025-01-01',NULL,'free',0),
(12,2,'2025-01-12','2025-02-12','active',1),
(13,3,'2025-01-20','2025-02-20','active',1),
(14,2,'2025-01-08','2025-02-08','active',1),
(15,1,'2025-01-01',NULL,'free',0),
(16,2,'2025-01-14','2025-02-14','active',1),
(17,2,'2025-01-11','2025-02-11','active',1),
(18,3,'2025-01-09','2025-02-09','active',1),
(19,1,'2025-01-01',NULL,'free',0),
(20,2,'2025-01-18','2025-02-18','active',1);

INSERT INTO PAYMENTS
(subscription_id, amount, status, transaction_id) VALUES
(1,9.99,'success','TXN001'),
(2,9.99,'success','TXN002'),
(4,9.99,'success','TXN003'),
(5,19.99,'success','TXN004'),
(6,9.99,'failed','TXN005'),
(8,9.99,'success','TXN006'),
(9,19.99,'success','TXN007'),
(10,9.99,'success','TXN008'),
(12,9.99,'success','TXN009'),
(13,19.99,'success','TXN010'),
(14,9.99,'success','TXN011'),
(16,9.99,'success','TXN012'),
(17,9.99,'success','TXN013'),
(18,19.99,'success','TXN014'),
(1,9.99,'success','TXN015'),
(2,9.99,'success','TXN016'),
(4,9.99,'success','TXN017'),
(5,19.99,'success','TXN018'),
(8,9.99,'success','TXN019'),
(9,19.99,'success','TXN020');

INSERT INTO SONG_ARTISTS (song_id, artist_id, role) VALUES
(1,1,'main'),
(2,2,'main'),
(3,3,'main'),
(4,4,'main'),
(5,5,'main'),
(6,6,'main'),
(7,7,'main'),
(8,8,'main'),
(9,9,'main'),
(10,10,'main'),
(11,11,'main'),
(12,12,'main'),
(13,13,'main'),
(14,14,'main'),
(15,15,'main'),
(16,16,'main'),
(17,17,'main'),
(18,18,'main'),
(19,19,'main'),
(20,20,'main'),
(21,1,'featured'),
(22,2,'featured'),
(23,3,'featured'),
(24,4,'featured'),
(25,5,'featured');


INSERT INTO GENRES (genre_name, description) VALUES
(N'Pop',N'Popular music'),
(N'Rock',N'Rock music'),
(N'Hip Hop',N'Hip Hop music'),
(N'R&B',N'R&B music'),
(N'EDM',N'Electronic'),
(N'Ballad',N'Slow music'),
(N'Jazz',N'Jazz music'),
(N'Classical',N'Classical music'),
(N'Country',N'Country music'),
(N'Blues',N'Blues music'),
(N'Kpop',N'Korean pop'),
(N'Vpop',N'Vietnamese pop'),
(N'Rap',N'Rap music'),
(N'Indie',N'Independent music'),
(N'Folk',N'Folk music'),
(N'Metal',N'Metal music'),
(N'Reggae',N'Reggae music'),
(N'Latin',N'Latin music'),
(N'Dance',N'Dance music'),
(N'Soul',N'Soul music');

INSERT INTO SONG_GENRES (song_id, genre_id) VALUES
(1,12),(2,12),(3,11),(4,1),(5,1),
(6,1),(7,1),(8,3),(9,1),(10,4),
(11,11),(12,11),(13,2),(14,2),(15,1),
(16,1),(17,2),(18,1),(19,1),(20,1),
(21,12),(22,12),(23,11),(24,1),(25,1);


INSERT INTO PLAYLISTS (user_id, name, description, is_public) VALUES
(1,N'Admin Playlist',N'Admin favorites',1),
(2,N'Mod Playlist',N'Moderator picks',1),
(3,N'User1 Playlist',N'My songs',1),
(4,N'Chill',N'Chill vibes',1),
(5,N'Workout',N'Gym songs',1),
(6,N'Focus',N'Focus music',1),
(7,N'Party',N'Party hits',1),
(8,N'Love',N'Love songs',1),
(9,N'Roadtrip',N'Roadtrip mix',1),
(10,N'Sad',N'Sad songs',1),
(11,N'Happy',N'Happy mood',1),
(12,N'Sleep',N'Sleep time',1),
(13,N'Rap Mix',N'Rap songs',1),
(14,N'Kpop Hits',N'Kpop collection',1),
(15,N'Vpop Hits',N'Vpop collection',1),
(16,N'Rock Mix',N'Rock songs',1),
(17,N'EDM Mix',N'EDM songs',1),
(18,N'Jazz Night',N'Jazz songs',1),
(19,N'Classic',N'Classic music',1),
(20,N'Daily Mix',N'Daily music',1);


INSERT INTO PLAYLIST_SONGS (playlist_id, song_id, position) VALUES
(1,1,1),(1,2,2),(1,3,3),
(2,4,1),(2,5,2),
(3,6,1),(3,7,2),
(4,8,1),(4,9,2),
(5,10,1),(5,11,2),
(6,12,1),(6,13,2),
(7,14,1),(7,15,2),
(8,16,1),(8,17,2),
(9,18,1),(9,19,2),
(10,20,1),(11,21,1),(12,22,1),
(13,23,1),(14,24,1),(15,25,1);


INSERT INTO SONG_COMMENTS 
(user_id, song_id, comment_text, parent_comment_id, timestamp_position, likes_count)
VALUES
(3,1,N'Great song!',NULL,30,5),
(4,1,N'Love it!',1,40,2),
(5,2,N'Amazing!',NULL,50,3),
(6,3,N'Nice beat',NULL,60,4),
(7,4,N'Awesome',NULL,20,6),
(8,5,N'On repeat',NULL,10,1),
(9,6,N'So good',NULL,15,2),
(10,7,N'Fantastic',NULL,25,3),
(11,8,N'Chill vibe',NULL,35,2),
(12,9,N'Perfect',NULL,45,4),
(13,10,N'Nice lyrics',NULL,55,3),
(14,11,N'Kpop king',NULL,30,5),
(15,12,N'Legend',NULL,20,2),
(16,13,N'Rock on',NULL,40,1),
(17,14,N'Cool',NULL,50,2),
(18,15,N'Love this',NULL,60,3),
(19,16,N'Beautiful',NULL,70,4),
(20,17,N'Nice',NULL,80,2),
(3,18,N'Wow',NULL,90,1),
(4,19,N'Best song',NULL,100,5),
(5,20,N'Good vibe',NULL,30,3),
(6,21,N'Nice track',NULL,40,2),
(7,22,N'Great one',NULL,50,1),
(8,23,N'Fire',NULL,60,4),
(9,24,N'Superb',NULL,70,2);


INSERT INTO COMMENT_LIKES (user_id, comment_id) VALUES
(3,1),(4,1),(5,1),
(6,2),(7,2),
(8,3),(9,3),
(10,4),(11,4),
(12,5),(13,5),
(14,6),(15,6),
(16,7),(17,7),
(18,8),(19,8),
(20,9),(3,10),
(4,11),(5,12),
(6,13),(7,14),
(8,15),(9,16);


INSERT INTO USER_SUBSCRIPTIONS
(user_id, plan_id, start_date, end_date, status, auto_renew)
VALUES
(1,3,'2025-03-01','2025-04-01','active',1),
(2,2,'2025-03-02','2025-04-02','active',1),
(3,2,'2025-03-03','2025-04-03','active',1),
(4,3,'2025-03-04','2025-04-04','active',1),
(5,2,'2025-03-05','2025-04-05','active',1),
(6,3,'2025-03-06','2025-04-06','active',1),
(7,2,'2025-03-07','2025-04-07','active',1),
(8,3,'2025-03-08','2025-04-08','active',1),
(9,2,'2025-03-09','2025-04-09','active',1),
(10,3,'2025-03-10','2025-04-10','active',1),
(11,2,'2025-03-11','2025-04-11','active',1),
(12,3,'2025-03-12','2025-04-12','active',1),
(13,2,'2025-03-13','2025-04-13','active',1),
(14,3,'2025-03-14','2025-04-14','active',1),
(15,2,'2025-03-15','2025-04-15','active',1),
(16,3,'2025-03-16','2025-04-16','active',1),
(17,2,'2025-03-17','2025-04-17','active',1),
(18,3,'2025-03-18','2025-04-18','active',1),
(19,2,'2025-03-19','2025-04-19','active',1),
(20,3,'2025-03-20','2025-04-20','active',1);


INSERT INTO PAYMENTS
(subscription_id, amount, status, transaction_id)
VALUES
(21,19.99,'success','TXN021'),
(22,9.99,'success','TXN022'),
(23,9.99,'success','TXN023'),
(24,19.99,'success','TXN024'),
(25,9.99,'success','TXN025'),
(26,19.99,'success','TXN026'),
(27,9.99,'success','TXN027'),
(28,19.99,'success','TXN028'),
(29,9.99,'success','TXN029'),
(30,19.99,'success','TXN030'),
(31,9.99,'success','TXN031'),
(32,19.99,'success','TXN032'),
(33,9.99,'success','TXN033'),
(34,19.99,'success','TXN034'),
(35,9.99,'success','TXN035'),
(36,19.99,'success','TXN036'),
(37,9.99,'success','TXN037'),
(38,19.99,'success','TXN038'),
(39,9.99,'success','TXN039'),
(40,19.99,'success','TXN040');

INSERT INTO USER_SONGS (user_id, song_id, listened_at)
SELECT TOP 500
    u.user_id,
    s.song_id,
    DATEADD(
        DAY,
        -ABS(CHECKSUM(NEWID()) % 14),  -- random trong 14 ngày
        GETDATE()
    )
FROM USERS u
CROSS JOIN SONGS s
ORDER BY NEWID();