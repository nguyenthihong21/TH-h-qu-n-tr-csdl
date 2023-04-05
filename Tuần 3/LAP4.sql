use [QLBanHangg]
go

CREATE VIEW Lab2_C1_sanpham AS
SELECT * FROM SanPham;
go

Select * from Lab2_C1_sanpham
go

CREATE VIEW Lab2_C1_Hangsx AS
SELECT * FROM Hangsx;
go

Select * from Lab2_C1_Hangsx
go

CREATE VIEW Lab2_C1_Nhanvien AS
SELECT * FROM Nhanvien;
go
Select * from Lab2_C1_Nhanvien
go

CREATE VIEW Lab2_C1_Nhap AS
SELECT * FROM Nhap;
go

Select * from Lab2_C1_Nhap
go

CREATE VIEW Lab2_C1_Xuat AS
SELECT * FROM Xuat;
go

Select * from Lab2_C1_Xuat
go

CREATE VIEW Lab2_C2 AS
SELECT Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Sanpham.soluong, Sanpham.mausac, Sanpham.giaban, Sanpham.donvitinh, Sanpham.mota
FROM SanPham
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
go

Select * from Lab2_C2 ORDER BY Lab2_C2.giaban DESC;
go

CREATE VIEW Lab2_C3 AS
SELECT Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Sanpham.soluong, Sanpham.mausac, Sanpham.giaban, 
Sanpham.donvitinh, Sanpham.mota
FROM Sanpham
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung'
go

Select * from Lab2_C3 
go


CREATE VIEW Lab2_C4 AS
SELECT * FROM nhanvien
WHERE gioitinh = 'N?' AND phong = 'K? toán'
go

Select * from Lab2_C4
go

CREATE VIEW Lab2_C5 AS
SELECT Nhap.sohdn, Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Nhap.soluongN, Nhap.dongiaN, 
Nhap.soluongN*Nhap.dongiaN AS tiennhap, Sanpham.mausac, Sanpham.donvitinh, Nhap.ngaynhap,
Nhanvien.tennv, Nhanvien.phong
FROM Nhap
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
go

Select * from Lab2_C5 ORDER BY Lab2_C5.sohdn ASC;
go

CREATE VIEW Lab2_C6 AS
SELECT Xuat.sohdx, Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Xuat.soluongX, Sanpham.giaban, 
       Xuat.soluongX*Sanpham.giaban AS tienxuat, Sanpham.mausac, Sanpham.donvitinh, Xuat.ngayxuat, 
       Nhanvien.tennv, Nhanvien.phong
FROM Xuat
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
INNER JOIN Nhanvien ON Xuat.manv = Nhanvien.manv
WHERE MONTH(Xuat.ngayxuat) = 10 AND YEAR(Xuat.ngayxuat) = 2018
go

Select * from Lab2_C6 ORDER BY Lab2_C6.sohdx ASC;
go

CREATE VIEW Lab2_C7 AS
SELECT sohdn, Sanpham.masp, tensp, soluongN, dongiaN, ngaynhap, tennv, phong
FROM Nhap 
JOIN Sanpham ON Nhap.masp = Sanpham.masp 
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
WHERE Hangsx.tenhang = 'Samsung' AND YEAR(ngaynhap) = 2017;
go

Select * from Lab2_C7 
go

CREATE VIEW Lab2_C_8 AS
SELECT TOP 10 Xuat.sohdx, Sanpham.tensp, Xuat.soluongX
FROM Xuat 
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
WHERE YEAR(Xuat.ngayxuat) = '2018' 
ORDER BY Xuat.soluongX DESC;
go

Select * from Lab2_C_8 ORDER BY Lab2_C_8.soluongX DESC
go

CREATE VIEW Lab2_C9 AS
SELECT TOP 10 tenSP, giaBan
FROM SanPham
ORDER BY giaBan DESC;
go

Select * from Lab2_C9 ORDER BY Lab2_C9.giaBan DESC
go

CREATE VIEW Lab2_C_10 AS
SELECT masp, tensp, tenhang, soluong, mausac, giaban, donvitinh, mota
FROM Sanpham
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung' AND Sanpham.giaban >= 100000 AND Sanpham.giaban <= 500000
go

Select * from Lab2_C_10 
go

CREATE VIEW Lab2_C_11 AS
SELECT SUM(soluongN * dongiaN) AS tongtien
FROM Nhap
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung' AND YEAR(ngaynhap) = 2018
go

Select * from Lab2_C_11 
go

CREATE VIEW Lab2_C_12 AS
SELECT SUM(Xuat.soluongX * Sanpham.giaban) AS Tongtien
FROM Xuat
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
WHERE Xuat.ngayxuat = '2018-09-02'
go

Select * from Lab2_C_12 
go

CREATE VIEW Lab2_C_13 AS
SELECT TOP 1 sohdn, ngaynhap, dongiaN
FROM Nhap
ORDER BY dongiaN DESC
go

Select * from Lab2_C_13 
go

CREATE VIEW Lab2_C_14 AS
SELECT TOP 10 Sanpham.tensp, SUM(Nhap.soluongN) AS TongSoLuongN 
FROM Sanpham 
INNER JOIN Nhap ON Sanpham.masp = Nhap.masp 
WHERE YEAR(Nhap.ngaynhap) = 2019 
GROUP BY Sanpham.tensp 
ORDER BY TongSoLuongN DESC
go

Select * from Lab2_C_14 
go

CREATE VIEW Lab2_C_15 AS
SELECT Sanpham.masp, Sanpham.tensp
FROM Sanpham
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
INNER JOIN Nhap ON Sanpham.masp = Nhap.masp
INNER JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
WHERE Hangsx.tenhang = 'Samsung' AND Nhanvien.manv = 'NV01';
go

Select * from Lab2_C_15
go

CREATE VIEW Lab2_C_16 AS
SELECT sohdn, masp, soluongN, ngaynhap
FROM Nhap
WHERE masp = 'SP02' AND manv = 'NV02'
go

Select * from Lab2_C_16
go

CREATE VIEW Lab2_C_17 AS
SELECT Nhanvien.manv, Nhanvien.tennv
FROM Nhanvien
INNER JOIN Xuat ON Nhanvien.manv = Xuat.manv
WHERE Xuat.masp = 'SP02' AND Xuat.ngayxuat = '2020-03-02'
go

Select * from Lab2_C_17
go

CREATE VIEW Lab3_C_1 AS
SELECT Hangsx.tenhang, COUNT(Sanpham.masp) AS SoLuongLoaiSP
FROM Hangsx
JOIN Sanpham ON Hangsx.mahangsx = Sanpham.mahangsx
GROUP BY Hangsx.tenhang;
go

Select * from Lab3_C_1
go

CREATE VIEW Lab3_C_2 AS
SELECT Sanpham.tensp, SUM(Nhap.soluongN * Nhap.dongiaN) AS TongTienNhap
FROM Sanpham
JOIN Nhap ON Sanpham.masp = Nhap.masp
WHERE YEAR(Nhap.ngaynhap) = 2018
GROUP BY Sanpham.tensp;
go

Select * from Lab3_C_2
go

CREATE VIEW Lab3_C_3 AS
SELECT Sanpham.tensp, SUM(Xuat.soluongX) AS TongSoLuongXuat
FROM Sanpham
JOIN Xuat ON Sanpham.masp = Xuat.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'samsung' AND YEAR(Xuat.ngayxuat) = 2018
GROUP BY Sanpham.tensp
HAVING SUM(Xuat.soluongX) > 10000
go

Select * from Lab3_C_3
go

CREATE VIEW Lab3_C_4 AS
SELECT Nhanvien.phong, COUNT(Nhanvien.manv) AS SoLuongNam
FROM Nhanvien
WHERE Nhanvien.gioitinh = 'Nam'
GROUP BY Nhanvien.phong;
go

Select * from Lab3_C_4
go

CREATE VIEW Lab3_C_5 AS
SELECT Hangsx.tenhang, SUM(Nhap.soluongN) AS TongSoLuongNhap
FROM Hangsx
JOIN Sanpham ON Hangsx.mahangsx = Sanpham.mahangsx
JOIN Nhap ON Sanpham.masp = Nhap.masp
WHERE YEAR(Nhap.ngaynhap) = 2018
GROUP BY Hangsx.tenhang;
go

Select * from Lab3_C_5
go

CREATE VIEW Lab3_C_6 AS
SELECT Nhanvien.tennv, SUM(Sanpham.giaban * Xuat.soluongX) AS TongTienXuat
FROM Nhanvien
JOIN Xuat ON Nhanvien.manv = Xuat.manv
JOIN Sanpham ON Xuat.masp = Sanpham.masp
WHERE YEAR(Xuat.ngayxuat) = 2018
GROUP BY Nhanvien.tennv;
go

Select * from Lab3_C_6
go

CREATE VIEW Lab3_C_7 AS
SELECT Nhanvien.tennv, SUM(Nhap.soluongN * Nhap.dongiaN) AS TongTienNhap
FROM Nhanvien
JOIN Nhap ON Nhanvien.manv = Nhap.manv
WHERE MONTH(Nhap.ngaynhap) = 8 AND YEAR(Nhap.ngaynhap) = 2018
GROUP BY Nhanvien.tennv
HAVING SUM(Nhap.soluongN * Nhap.dongiaN) > 100000;
go

Select * from Lab3_C_7
go

CREATE VIEW Lab3_C_8 AS
SELECT *
FROM Sanpham
WHERE NOT EXISTS (
    SELECT *
    FROM Xuat
    WHERE Sanpham.masp = Xuat.masp
);
go

Select * from Lab3_C_8
go

CREATE VIEW Lab3_C_9 AS
SELECT DISTINCT Sanpham.*
FROM Sanpham
INNER JOIN Nhap ON Sanpham.masp = Nhap.masp
INNER JOIN Xuat ON Sanpham.masp = Xuat.masp
WHERE YEAR(Nhap.ngaynhap) = 2018 AND YEAR(Xuat.ngayxuat) = 2018;
go

Select * from Lab3_C_9
go

CREATE VIEW Lab3_C_10 AS
SELECT DISTINCT Nhanvien.*
FROM Nhanvien
INNER JOIN Nhap ON Nhanvien.manv = Nhap.manv
INNER JOIN Xuat ON Nhanvien.manv = Xuat.manv;
go

Select * from Lab3_C_10
go

CREATE VIEW Lab3_C_11 AS
	SELECT *
FROM Nhanvien
WHERE Nhanvien.manv NOT IN (SELECT DISTINCT manv FROM Nhap)
  AND Nhanvien.manv NOT IN (SELECT DISTINCT manv FROM Xuat);
go

Select * from Lab3_C_11
go