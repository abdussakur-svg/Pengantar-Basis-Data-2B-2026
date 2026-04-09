CREATE TABLE dokter(
id_dokter INT PRIMARY KEY,
nama_dokter VARCHAR(50),
spesialis VARCHAR(50)
);


CREATE TABLE pasien(
id_pasien INT PRIMARY KEY,
nama_pasien VARCHAR(50),
tanggal_lahir DATE,
no_telepon INT
);


CREATE TABLE rekam_medis(
id_rekam INT PRIMARY KEY,
id_pasien INT,
id_dokter INT,
tanggal_periksa DATE,
diagnosis TEXT,

FOREIGN KEY (id_pasien)
 REFERENCES pasien(id_pasien)
 ON DELETE RESTRICT,
 
FOREIGN KEY (id_dokter)
 REFERENCES dokter(id_dokter)
 ON DELETE RESTRICT
);




INSERT INTO dokter VALUES
(1,'dr.Budi','Jantung'),
(2,'dr.Agus','Paru-paru');


INSERT INTO pasien VALUES
(101,'Asep','1999-05-15','0987654321'),
(102,'Udin','1945-08-17','0123456789');


INSERT INTO rekam_medis VALUES
(1,101,1,'2026-03-15','LemahJantung'),
(2,102,2,'2026-03-25','Asma');


INSERT INTO rekam_medis VALUES
(3,101,10,'2026-03-15','Batuk');


UPDATE pasien
SET no_telepon = 0213465798
WHERE id_pasien = 101;


UPDATE dokter
SET spesialis = 'saraf'
WHERE id_dokter = 1;


DELETE FROM rekam_medis
WHERE id_rekam = 002;


DROP TABLE rekam_medis



CREATE TABLE rekam_medis_new(
id_rekam INT PRIMARY KEY,
id_pasien INT,
id_dokter INT,
tanggal_periksa DATE,
diagnosis TEXT,

FOREIGN KEY (id_pasien)
 REFERENCES pasien(id_pasien)
 ON DELETE RESTRICT,
 
FOREIGN KEY (id_dokter)
 REFERENCES dokter(id_dokter)
 ON DELETE CASCADE
);


INSERT INTO rekam_medis_new VALUES
(1,101,1,'2026-03-15','Batuk'),
(2,102,1,'2026-03-25','Asma');


DELETE FROM dokter
WHERE id_dokter = 1;






CREATE TABLE rekam_medis_new2(
id_rekam INT PRIMARY KEY,
id_pasien INT,
id_dokter INT,
tanggal_periksa DATE,
diagnosis TEXT,

FOREIGN KEY (id_pasien)
 REFERENCES pasien(id_pasien)
 ON DELETE RESTRICT,
 
FOREIGN KEY (id_dokter)
 REFERENCES dokter(id_dokter)
 ON DELETE RESTRICT
);


INSERT INTO rekam_medis_new2 VALUES
(1,101,2,'2026-03-15','flu'),
(2,102,2,'2026-03-25','Asma');

TRUNCATE TABLE rekam_medis_new2

TRUNCATE TABLE pasien;


