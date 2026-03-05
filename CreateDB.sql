create database music_streaming;
go

use music_streaming;
go

-- 1. ROLES
CREATE TABLE ROLES (
    role_id INT IDENTITY(1,1) PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL, -- admin/user/moderator
    permissions VARCHAR(255)
);

-- 2. USERS
CREATE TABLE USERS (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(100) UNIQUE NOT NULL,
    email NVARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    avatar_url NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE(),
    role_id INT FOREIGN KEY REFERENCES ROLES(role_id)
);

-- 3. SUBSCRIPTION_PLANS
CREATE TABLE SUBSCRIPTION_PLANS (
    plan_id INT IDENTITY(1,1) PRIMARY KEY,
    plan_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    duration_months INT NOT NULL CHECK (duration_months > 0),
    ad_free BIT NOT NULL DEFAULT 0,
    high_quality_audio BIT NOT NULL DEFAULT 0,
    max_downloads INT NOT NULL DEFAULT 0 CHECK (max_downloads >= 0)
);

-- 4. USER_SUBSCRIPTIONS
CREATE TABLE USER_SUBSCRIPTIONS (
    subscription_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL FOREIGN KEY REFERENCES USERS(user_id) ON DELETE CASCADE,
    plan_id INT NOT NULL FOREIGN KEY REFERENCES SUBSCRIPTION_PLANS(plan_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50) NOT NULL CHECK (status IN ('active', 'expired', 'cancelled', 'paused')),
    auto_renew BIT NOT NULL DEFAULT 0
);

-- 5. PAYMENTS
CREATE TABLE PAYMENTS (
    payment_id INT IDENTITY(1,1) PRIMARY KEY,
    subscription_id INT NOT NULL FOREIGN KEY REFERENCES USER_SUBSCRIPTIONS(subscription_id),
    amount DECIMAL(10,2) NOT NULL CHECK (amount > 0),
    payment_date DATETIME DEFAULT GETDATE(),
    status VARCHAR(50) NOT NULL CHECK (status IN ('pending', 'completed', 'failed', 'refunded')),
    transaction_id VARCHAR(100) UNIQUE
);

-- 6. ARTISTS
CREATE TABLE ARTISTS (
    artist_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    country NVARCHAR(100),
    bio NVARCHAR(MAX),
    cover_image_url VARCHAR(255)
);

-- 7. ALBUMS
CREATE TABLE ALBUMS (
    album_id INT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(255) NOT NULL,
    artist_id INT FOREIGN KEY REFERENCES ARTISTS(artist_id),
    release_year INT,
    cover_image_url VARCHAR(255),
    record_label NVARCHAR(255)
);

-- 8. SONGS
CREATE TABLE SONGS (
    song_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    album_id INT FOREIGN KEY REFERENCES ALBUMS(album_id) ON DELETE SET NULL,
    duration INT NOT NULL CHECK (duration > 0),
    file_path VARCHAR(255) UNIQUE NOT NULL,
    lyrics NVARCHAR(MAX),
    uploaded_at DATETIME DEFAULT GETDATE()
);

-- 9. SONG_ARTISTS (N-N)
CREATE TABLE SONG_ARTISTS (
    song_id INT FOREIGN KEY REFERENCES SONGS(song_id) ON DELETE CASCADE,
    artist_id INT FOREIGN KEY REFERENCES ARTISTS(artist_id) ON DELETE CASCADE,
    role VARCHAR(50) NOT NULL CHECK (role IN ('main', 'featured', 'composer', 'producer')),
    PRIMARY KEY (song_id, artist_id)
);

-- 10. GENRES
CREATE TABLE GENRES (
    genre_id INT IDENTITY(1,1) PRIMARY KEY,
    genre_name NVARCHAR(100) UNIQUE NOT NULL,
    description NVARCHAR(500)
);

-- 11. SONG_GENRES (N-N)
CREATE TABLE SONG_GENRES (
    song_id INT FOREIGN KEY REFERENCES SONGS(song_id) ON DELETE CASCADE,
    genre_id INT FOREIGN KEY REFERENCES GENRES(genre_id) ON DELETE CASCADE,
    PRIMARY KEY (song_id, genre_id)
);

-- 12. PLAYLISTS
CREATE TABLE PLAYLISTS (
    playlist_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL FOREIGN KEY REFERENCES USERS(user_id) ON DELETE CASCADE,
    name NVARCHAR(255) NOT NULL,
    description NVARCHAR(MAX),
    is_public BIT NOT NULL DEFAULT 1,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
);

-- 13. PLAYLIST_SONGS (N-N)
CREATE TABLE PLAYLIST_SONGS (
    playlist_id INT FOREIGN KEY REFERENCES PLAYLISTS(playlist_id) ON DELETE CASCADE,
    song_id INT FOREIGN KEY REFERENCES SONGS(song_id),
    position INT NOT NULL CHECK (position > 0),
    added_at DATETIME DEFAULT GETDATE(),
    PRIMARY KEY (playlist_id, song_id)
);

-- 14. SONG_COMMENTS
CREATE TABLE SONG_COMMENTS (
    comment_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL FOREIGN KEY REFERENCES USERS(user_id),
    song_id INT NOT NULL FOREIGN KEY REFERENCES SONGS(song_id) ON DELETE CASCADE,
    comment_text NVARCHAR(MAX) NOT NULL,
    parent_comment_id INT FOREIGN KEY REFERENCES SONG_COMMENTS(comment_id), -- Self-referencing FK
    timestamp_position INT CHECK (timestamp_position >= 0),
    created_at DATETIME DEFAULT GETDATE()
);

-- 15. COMMENT_LIKES
CREATE TABLE COMMENT_LIKES (
    user_id INT FOREIGN KEY REFERENCES USERS(user_id) ON DELETE NO ACTION,
    comment_id INT FOREIGN KEY REFERENCES SONG_COMMENTS(comment_id) ON DELETE NO ACTION,
    liked_at DATETIME DEFAULT GETDATE(),
    PRIMARY KEY (user_id, comment_id)
);

-- 16. SONG_LIKES
CREATE TABLE SONG_LIKES (
    user_id INT FOREIGN KEY REFERENCES USERS(user_id) ON DELETE NO ACTION,
    song_id INT FOREIGN KEY REFERENCES SONGS(song_id) ON DELETE NO ACTION,
    liked_at DATETIME DEFAULT GETDATE(),
    PRIMARY KEY (user_id, song_id)
);
GO

-- 17. USER_SONGS (listen history)
CREATE TABLE USER_SONGS (
    listen_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL FOREIGN KEY REFERENCES USERS(user_id) ON DELETE CASCADE,
    song_id INT NOT NULL FOREIGN KEY REFERENCES SONGS(song_id),
    listened_at DATETIME DEFAULT GETDATE()
);
GO
