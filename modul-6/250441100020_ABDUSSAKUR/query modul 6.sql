# queri soal 1

SELECT 
    m.nim,
    m.nama,
    n.nilai_angka
FROM mahasiswa m
JOIN nilai n
ON m.nim = n.nim
WHERE n.nilai_angka > (
    SELECT AVG(nilai_angka)
    FROM nilai
);


# queri soal 2

SELECT 
    mk.kode_mk,
    mk.nama_mk
FROM mahasiswa m
JOIN krs k
ON m.nim = k.nim
JOIN mata_kuliah mk
ON k.kode_mk = mk.kode_mk
WHERE m.nama = 'Budi Santoso';


# queri soal 3

SELECT 
    m.nim,
    m.nama
FROM mahasiswa m
WHERE EXISTS (
    SELECT *
    FROM nilai n
    WHERE n.nim = m.nim
);


# queri soal 4

SELECT 
    kode_mk,
    AVG(nilai_angka) AS rata_rata_nilai
FROM (
    SELECT *
    FROM nilai
    WHERE kode_mk IN ('MK01', 'MK02')
) AS nilai_filtered
GROUP BY kode_mk;


# queri soal 5
#A
CREATE VIEW v_transkrip_lengkap AS
SELECT
    m.nim,
    m.nama AS nama_mahasiswa,
    mk.nama_mk,
    n.nilai_huruf
FROM mahasiswa m
JOIN nilai n
ON m.nim = n.nim
JOIN mata_kuliah mk
ON n.kode_mk = mk.kode_mk;

#B
SELECT * FROM v_transkrip_lengkap
WHERE nilai_huruf = 'A';

