
----6. Đưa ra thông tin phiếu xuất gồm: sohdx, masp, tensp, tenhang, soluongX, giaban,
----tienxuat-soluongX*giaban, mausac, donvitinh, ngayxuat, tennv, phong trong tháng 10
----năm 2018, sắp xếp theo chiều tăng dần của sohdx.
SELECT Xuat.sohdx, Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Xuat.soluongX, Sanpham.giaban, 
       Xuat.soluongX*Sanpham.giaban AS tienxuat, Sanpham.mausac, Sanpham.donvitinh, Xuat.ngayxuat, 
       Nhanvien.tennv, Nhanvien.phong
FROM Xuat
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
INNER JOIN Nhanvien ON Xuat.manv = Nhanvien.manv
WHERE MONTH(Xuat.ngayxuat) = 10 AND YEAR(Xuat.ngayxuat) = 2018
ORDER BY Xuat.sohdx ASC;

----7. Đưa ra các thông tin về các hóa đơn mà hãng samsung đã nhập trong năm 2017, gồm:
----sohdn, masp, tensp, soluongN, dongiaN, ngaynhap, tennv, phong.
SELECT sohdn, Sanpham.masp, tensp, soluongN, dongiaN, ngaynhap, tennv, phong
FROM Nhap 
JOIN Sanpham ON Nhap.masp = Sanpham.masp 
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
WHERE Hangsx.tenhang = 'Samsung' AND YEAR(ngaynhap) = 2017;

----8. Đưa ra Top 10 hỏa đơn xuất có số lượng xuất nhiều nhất trong năm 2018, sắp xếp theo
----chiều giảm dần của soluongX.
SELECT TOP 10 Xuat.sohdx, Sanpham.tensp, Xuat.soluongX FROM Xuat 
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
WHERE YEAR(Xuat.ngayxuat) = '2023' 
ORDER BY Xuat.soluongX DESC;

----9. Đưa ra thông tin 10 sản phẩm có giá bán cao nhất trong của hàng, theo chiều giảm dẫn
----gia bản.
SELECT TOP 10 tenSP, giaBan FROM SanPham
ORDER BY giaBan DESC;

----10. Đưa ra các thông tin sản phẩm có gia bản từ 100.000 đến 500.000 của hãng samsung.
SELECT * FROM Sanpham
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung' AND Sanpham.giaban >= 100000 AND Sanpham.giaban <= 500000

----11. Tính tổng tiền đã nhập trong năm 2018 của bảng samsung.
SELECT SUM(soluongN * dongiaN) AS tongtien
FROM Nhap
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung' AND YEAR(ngaynhap) = 2018

----12. Thống kê tổng tiền đã xuất trong ngày 2/9/2018
SELECT SUM(Xuat.soluongX * Sanpham.giaban) AS Tongtien
FROM Xuat
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
WHERE Xuat.ngayxuat = '2018-09-02'

----13. Đưa ra sohdn, ngaynhap có tiến nhập phải trả cao nhất trong năm 2018
SELECT TOP 1 sohdn, ngaynhap, dongiaN
FROM Nhap
ORDER BY dongiaN DESC

----14. Đưa ra 10 mặt hàng có soluongN nhiều nhất trong năm 2019.
SELECT TOP 10 Sanpham.tensp, SUM(Nhap.soluongN) AS TongSoLuongN 
FROM Sanpham 
INNER JOIN Nhap ON Sanpham.masp = Nhap.masp 
WHERE YEAR(Nhap.ngaynhap) = 2019 
GROUP BY Sanpham.tensp 
ORDER BY TongSoLuongN DESC