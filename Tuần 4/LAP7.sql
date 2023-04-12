go 
use QLBanHangg
go

-- cau 1--
go
CREATE PROCEDURE Cau_1 (@mahangsx INT, @tenhang VARCHAR(50), @diachi VARCHAR(50), @sodt VARCHAR(15), @email VARCHAR(50))
AS
BEGIN
    IF EXISTS (SELECT * FROM Hangsx WHERE tenhang = @tenhang)
        PRINT N'Đã tồn tại tên hàng.'
    ELSE
        INSERT INTO Hangsx(mahangsx, tenhang, diachi, sodt, email) VALUES (@mahangsx, @tenhang, @diachi, @sodt, @email)
END
go
go
EXEC Cau_1 @mahangsx = 123, @tenhang = N'Oppo1', @diachi = N'Trung Quốc', @sodt = N'0123456789', @email = N'contact@oppo.com'
go

-- cau 2--
go
CREATE PROCEDURE Cau_2
    @masp NVARCHAR(10),
    @mahangsx NVARCHAR(10),
    @tensp NVARCHAR(50),
    @soluong INT,
    @mausac NVARCHAR(20),
    @giaban FLOAT,
    @donvitinh NVARCHAR(20),
    @mota NVARCHAR(200)
AS
BEGIN
    IF EXISTS (SELECT * FROM sanpham WHERE masp = @masp)
    BEGIN
        UPDATE sanpham SET 
            mahangsx = @mahangsx,
            tensp = @tensp,
            soluong = @soluong,
            mausac = @mausac,
            giaban = @giaban,
            donvitinh = @donvitinh,
            mota = @mota
        WHERE masp = @masp
    END
    ELSE
    BEGIN
        INSERT INTO sanpham (masp, mahangsx, tensp, soluong, mausac, giaban, donvitinh, mota)
        VALUES (@masp, @mahangsx, @tensp, @soluong, @mausac, @giaban, @donvitinh, @mota)
    END
END
go

--Cau 3--
go
CREATE PROCEDURE Cau_3
    @tenhang NVARCHAR(50)
AS
BEGIN
 
    IF NOT EXISTS (SELECT * FROM Hangsx WHERE tenhang = @tenhang)
    BEGIN
        PRINT N'Hãng sản xuất không tồn tại '
        RETURN
    END

    BEGIN TRANSACTION

    DELETE FROM Sanpham WHERE mahangsx = (SELECT mahangsx FROM Hangsx WHERE tenhang = @tenhang)


    DELETE FROM Hangsx WHERE tenhang = @tenhang

    COMMIT TRANSACTION
END
go

--Cau 4--
go
CREATE PROCEDURE Cau_4
    @manv VARCHAR(10),
    @tennv NVARCHAR(50),
    @gioitinh NVARCHAR(3),
    @diachi NVARCHAR(100),
    @sodt VARCHAR(20),
    @email NVARCHAR(50),
    @phong NVARCHAR(50),
    @flag BIT
AS
BEGIN
    IF @flag = 0
    BEGIN
        UPDATE Nhanvien
        SET tennv = @tennv,
            gioitinh = @gioitinh,
            diachi = @diachi,
            sodt = @sodt,
            email = @email,
            phong = @phong
        WHERE manv = @manv;
    END
    ELSE
    BEGIN
        IF EXISTS (SELECT * FROM Nhanvien WHERE manv = @manv)
        BEGIN
            RAISERROR('Mã nhân viên đã tồn tại!', 16, 1);
            RETURN;
        END
        INSERT INTO Nhanvien (manv, tennv, gioitinh, diachi, sodt, email, phong)
        VALUES (@manv, @tennv, @gioitinh, @diachi, @sodt, @email, @phong);
    END
END
go

--Cau 5--
go
CREATE PROCEDURE Cau_5(@sohdn varchar(20), @masp varchar(20), @manv varchar(20), @ngaynhap date, @soluongN int, @dongiaN float)
AS
BEGIN
    IF NOT EXISTS(SELECT * FROM Sanpham WHERE masp = @masp)
    BEGIN
        PRINT 'Mã sản phẩm không tồn tại'
        RETURN
    END
END
 