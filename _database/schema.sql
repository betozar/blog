DROP TABLE IF EXISTS files;

DROP TABLE IF EXISTS social_links;
DROP TABLE IF EXISTS profiles;
DROP TABLE IF EXISTS users;

DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS categories;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT,
    email VARCHAR(256) NOT NULL UNIQUE,
    password VARCHAR(256) NOT NULL,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT NOW(),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS profiles (
    id INT AUTO_INCREMENT,
    user_id INT NOT NULL UNIQUE,
    avatar_url VARCHAR(1024),
    fullname VARCHAR(32),
    profession VARCHAR(32),
    cv_url VARCHAR(1024),
    excerpt_md MEDIUMTEXT,
    excerpt_html MEDIUMTEXT,
    content_md MEDIUMTEXT,
    content_html MEDIUMTEXT,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT NOW(),
    PRIMARY KEY(id),
    FOREIGN KEY(user_id)
        REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS social_links (
    id INT AUTO_INCREMENT,
    profile_id INT NOT NULL UNIQUE,
    name VARCHAR(32),
    icon MEDIUMTEXT,
    url VARCHAR(1024),
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT NOW(),
    PRIMARY KEY(id),
    FOREIGN KEY(profile_id)
        REFERENCES profiles(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS files (
    id INT AUTO_INCREMENT,
    is_public BOOLEAN DEFAULT 0,
    name VARCHAR(256) NOT NULL,
    slug VARCHAR(512) NOT NULL UNIQUE,
    type VARCHAR(32) NOT NULL,
    size INT NOT NULL,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT NOW(),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS categories (
    id INT AUTO_INCREMENT,
    parent_id INT,
    is_favorite BOOLEAN DEFAULT 0,
    name VARCHAR(256) NOT NULL,
    slug VARCHAR(512) NOT NULL UNIQUE,
    icon MEDIUMTEXT,
    excerpt VARCHAR(256),
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT NOW(),
    PRIMARY KEY(id),
    FOREIGN KEY(parent_id)
        REFERENCES categories(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS posts (
    id INT AUTO_INCREMENT,
    category_id INT,
    is_public BOOLEAN DEFAULT 0,
    title VARCHAR(256) NOT NULL,
    slug VARCHAR(512) NOT NULL UNIQUE,
    thumb_url VARCHAR(1024),
    excerpt_md MEDIUMTEXT,
    excerpt_html MEDIUMTEXT,
    content_md LONGTEXT,
    content_html LONGTEXT,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT NOW(),
    PRIMARY KEY(id),
    FOREIGN KEY(category_id)
        REFERENCES categories(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

