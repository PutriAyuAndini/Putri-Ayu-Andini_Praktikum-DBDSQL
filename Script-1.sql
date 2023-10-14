CREATE TABLE MOVIE (
  KODE_DVD VARCHAR(10) NOT NULL,
  JUDUL VARCHAR(60) NULL,
  HARGA_SEWA DOUBLE NULL,
  DENDA DOUBLE NULL,
  TAHUN_RILIS SMALLINT UNSIGNED NULL,
  PRIMARY KEY(KODE_DVD)
);

CREATE TABLE GENRE (
  ID_GENRE SMALLINT UNSIGNED NOT NULL,
  GENRE VARCHAR(45) NULL,
  PRIMARY KEY(ID_GENRE)
);

CREATE TABLE GENRE_MOVIE (
  MOVIE_KODE_DVD VARCHAR(10) NOT NULL,
  GENRE_ID_GENRE SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY(MOVIE_KODE_DVD, GENRE_ID_GENRE),
  INDEX GENRE_MOVIE_FKIndex1(GENRE_ID_GENRE),
  INDEX GENRE_MOVIE_FKIndex2(MOVIE_KODE_DVD)
);

CREATE TABLE TRANSAKSI (
  TANGGAL_SEWA DATE NOT NULL,
  MOVIE_KODE_DVD VARCHAR(10) NOT NULL,
  PELANGGAN_KODE_PELANGGAN VARCHAR(10) NOT NULL,
  TANGGAL_WAJIB_KEMBALI DATE NULL,
  TANGGAL_REALISASI_KEMBALI DATE NULL,
  PRIMARY KEY(TANGGAL_SEWA, MOVIE_KODE_DVD, PELANGGAN_KODE_PELANGGAN),
  INDEX TRANSAKSI_FKIndex1(PELANGGAN_KODE_PELANGGAN),
  INDEX TRANSAKSI_FKIndex2(MOVIE_KODE_DVD)
);

CREATE TABLE PELANGGAN (
  KODE_PELANGGAN VARCHAR(10) NOT NULL,
  KELURAHAN_ID_KELURAHAN SMALLINT UNSIGNED NOT NULL,
  NAMA VARCHAR(45) NULL,
  ALAMAT VARCHAR(60) NULL,
  JENIS_KELAMIN CHAR(1) NULL,
  PRIMARY KEY(KODE_PELANGGAN),
  INDEX PELANGGAN_FKIndex1(KELURAHAN_ID_KELURAHAN)
);

CREATE TABLE KONTAK_PELANGGAN (
  PELANGGAN_KODE_PELANGGAN VARCHAR(10) NOT NULL,
  NO_HP VARCHAR(25) NULL,
  INDEX KONTAK_PELANGGAN_FKIndex1(PELANGGAN_KODE_PELANGGAN),
  UNIQUE INDEX KONTAK_PELANGGAN_index2315(NO_HP)
);

CREATE TABLE KELURAHAN (
  ID_KELURAHAN SMALLINT UNSIGNED NOT NULL,
  KECAMATAN_ID_KECAMATAN SMALLINT UNSIGNED NOT NULL,
  KELURAHAN VARCHAR(45) NULL,
  PRIMARY KEY(ID_KELURAHAN),
  INDEX KELURAHAN_FKIndex1(KECAMATAN_ID_KECAMATAN)
);

CREATE TABLE KECAMATAN (
  ID_KECAMATAN SMALLINT UNSIGNED NOT NULL,
  KECAMATAN VARCHAR(45) NULL,
  PRIMARY KEY(ID_KECAMATAN)
);

ALTER TABLE PELANGGAN 
  ADD CONSTRAINT CK_JENIS_KELAMIN CHECK (JENIS_KELAMIN IN ('P', 'L'));

ALTER TABLE MOVIE 
  MODIFY TAHUN_RILIS YEAR(4);