#query soal 1

SELECT angkatan, COUNT(nim) AS Total_Mahasiswa
FROM mahasiswa
GROUP BY angkatan
HAVING COUNT(nim) > 1
ORDER BY Total_Mahasiswa DESC;


#query soal 2

SELECT 
    MIN(sks) AS SKS_Minimal,
    MAX(sks) AS SKS_Maksimal,
    AVG(sks) AS Rata_Rata_SKS,
    COUNT(kode_mk) AS Total_Mata_Kuliah
FROM mata_kuliah;


#query soal 3

SELECT m.nim, m.nama, SUM(mk.sks) AS Total_SKS
FROM mahasiswa m
JOIN krs k ON m.nim = k.nim
JOIN mata_kuliah mk ON k.kode_mk = mk.kode_mk
WHERE k.semester IN (1, 3)
GROUP BY m.nim, m.nama;


#query soal 4

SELECT k.nim, SUM(mk.sks) AS Total_SKS
FROM krs k
JOIN mata_kuliah mk ON k.kode_mk = mk.kode_mk
GROUP BY k.nim
HAVING SUM(mk.sks) > 5;


#query soal 5

SELECT 
    sks, 
    COUNT(kode_mk) AS Total_MK,
    SUM(sks) AS Total_Akumulasi_SKS
FROM mata_kuliah
GROUP BY sks
HAVING COUNT(kode_mk) > 1;
