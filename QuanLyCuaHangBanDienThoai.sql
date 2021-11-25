CREATE DATABASE QuanLyCuaHangDienThoai
ON PRIMARY
(
	NAME = QuanLyCuaHangDienThoai_Data,
	FILENAME = 'E:\BTL-CSDL\QuanLyCuaHangDienThoai_data.mdf',
	SIZE = 10MB,
	MAXSIZE = UNLIMITED,
	FILEGROWTH = 2MB
)
LOG ON 
(
	NAME = QLCuaHangDienThoai_Log,
	FILENAME = 'E:\BTL-CSDL\QuanLyCuaHangDienThoai_log.ldf',
	SIZE = 5MB,
	MAXSIZE = UNLIMITED,
	FILEGROWTH = 1MB
)

USE QuanLyCuaHangDienThoai
GO

CREATE TABLE NhanVien
(
	MaNV VARCHAR(8) PRIMARY KEY,
	HoTen NVARCHAR(255),
	GioiTinh NVARCHAR(8) CHECK(GioiTinh = N'Nam' OR GioiTinh = N'Nữ'),
	NgaySinh DATE,
	DiaChi NVARCHAR(255),
	SDT VARCHAR(32),
	ChucVu NVARCHAR(255),
	Luong FLOAT
)
GO

CREATE TABLE KhachHang
(
	MaKH VARCHAR(8) PRIMARY KEY,
	TenKH NVARCHAR(255),
	GioiTinh NVARCHAR(8) CHECK(GioiTinh = N'Nam' OR GioiTinh = N'Nữ'),
	DiaChi NVARCHAR(255),
	SDT VARCHAR(32)
)
GO

CREATE TABLE HangSX
(
	ID_HangSX VARCHAR(8) PRIMARY KEY,
	TenHangSX NVARCHAR(255)
)
GO

CREATE TABLE MatHang
(
	MaMH VARCHAR(8) PRIMARY KEY,
	TenMH NVARCHAR(255),
	SoLuong INT,
	DonGiaNhap FLOAT,
	DonGiaBan FLOAT,
	ID_HangSX VARCHAR(8),
	NgayNhapHang DATE,
	CONSTRAINT FK_MatHang_HangSX FOREIGN KEY(ID_HangSX) REFERENCES HangSX(ID_HangSX)
)
GO

CREATE TABLE HoaDon
(
	MaHD VARCHAR(32) PRIMARY KEY,
	MaNV VARCHAR(8),
	NgayBan DATE,
	MaKH VARCHAR(8),
	TongTien FLOAT,
	CONSTRAINT FK_HoaDon_NhanVien FOREIGN KEY(MaNV) REFERENCES NhanVien(MaNV),
	CONSTRAINT FK_HoaDon_KhachHang FOREIGN KEY(MaKH) REFERENCES KhachHang(MaKH)
)
GO

CREATE TABLE ChiTietHoaDon
(
	MaHD VARCHAR(32),
	MaMH VARCHAR(8),
	PRIMARY KEY(MaHD,MaMH),
	SoLuong INT,
	GiamGia FLOAT,
	ThanhTien FLOAT,
	CONSTRAINT FK_ChiTietHoaDon_HoaDon FOREIGN KEY(MaHD) REFERENCES HoaDon(MaHD),
	CONSTRAINT FK_ChiTietHoaDon_MatHang FOREIGN KEY(MaMH) REFERENCES MatHang(MaMH)
)
GO



--Thêm dữ liệu vào bảng NhanVien

INSERT INTO dbo.NhanVien(MaNV,HoTen,GioiTinh,NgaySinh,DiaChi,SDT,ChucVu,Luong)
VALUES('TCLKT1',N'Nguyễn Văn Nam',N'Nam','20000702',N'Hòa Bình','0356977685',N'Quản lý',20000000)

INSERT INTO dbo.NhanVien(MaNV,HoTen,GioiTinh,NgaySinh,DiaChi,SDT,ChucVu,Luong)
VALUES('TCLKT2',N'Trần Thị Lan Anh',N'Nữ','19990513',N'Thái Bình','0975692312',N'Quản lý',15000000)

INSERT INTO dbo.NhanVien(MaNV,HoTen,GioiTinh,NgaySinh,DiaChi,SDT,ChucVu,Luong)
VALUES('TCLKT3',N'Nguyễn Văn Toàn',N'Nam','19980611',N'Hải Dương','0965254768',N'Nhân viên',7000000)

INSERT INTO dbo.NhanVien(MaNV,HoTen,GioiTinh,NgaySinh,DiaChi,SDT,ChucVu,Luong)
VALUES('TCLKT4',N'Trần Thị Thu Thủy',N'Nữ','19990812',N'Hưng Yên','0972384438',N'Nhân viên',6500000)

INSERT INTO dbo.NhanVien(MaNV,HoTen,GioiTinh,NgaySinh,DiaChi,SDT,ChucVu,Luong)
VALUES('TCLKT5',N'Đỗ Duy Mạnh',N'Nam','19971123',N'Hà Nội','0692494733',N'Nhân viên',7500000)

INSERT INTO dbo.NhanVien(MaNV,HoTen,GioiTinh,NgaySinh,DiaChi,SDT,ChucVu,Luong)
VALUES('TCLKT6',N'Bùi Tiến Dũng',N'Nam','19960407',N'Thanh Hóa','0953925615',N'Nhân viên',8000000)

SELECT * FROM dbo.NhanVien

--Thêm dữ liệu vào bảng KhachHang

INSERT INTO dbo.KhachHang(MaKH,TenKH,GioiTinh,DiaChi,SDT)
VALUES('KH01',N'Đào Minh Khoa',N'Nam',N'Chương Mỹ','0953285343')

INSERT INTO dbo.KhachHang(MaKH,TenKH,GioiTinh,DiaChi,SDT)
VALUES('KH02',N'Tô Văn Tuấn',N'Nam',N'Phú Xuyên','0966265732')

INSERT INTO dbo.KhachHang(MaKH,TenKH,GioiTinh,DiaChi,SDT)
VALUES('KH03',N'Phạm Thị Hoàng Châu',N'Nữ',N'Thái Bình','0353285984')

INSERT INTO dbo.KhachHang(MaKH,TenKH,GioiTinh,DiaChi,SDT)
VALUES('KH04',N'Nguyễn Quang Quân',N'Nam',N'Ba Vì','0952855856')

INSERT INTO dbo.KhachHang(MaKH,TenKH,GioiTinh,DiaChi,SDT)
VALUES('KH05',N'Nguyễn Viết Thành Trung',N'Nam',N'Hà Nội','0951945347')

INSERT INTO dbo.KhachHang(MaKH,TenKH,GioiTinh,DiaChi,SDT)
VALUES('KH06',N'Bùi Văn Đức',N'Nam',N'Nam Định','0963355736')

INSERT INTO dbo.KhachHang(MaKH,TenKH,GioiTinh,DiaChi,SDT)
VALUES('KH07',N'Nguyễn Thị Vân Anh',N'Nữ',N'Thanh Oai','0962235932')

INSERT INTO dbo.KhachHang(MaKH,TenKH,GioiTinh,DiaChi,SDT)
VALUES('KH08',N'Phùng Đức Đạt',N'Nam',N'Phú Xuyên','0956213344')

INSERT INTO dbo.KhachHang(MaKH,TenKH,GioiTinh,DiaChi,SDT)
VALUES('KH09',N'Vũ Đăng Dũng',N'Nam',N'Bắc Ninh','0963245642')

INSERT INTO dbo.KhachHang(MaKH,TenKH,GioiTinh,DiaChi,SDT)
VALUES('KH10',N'Trần Thị Chinh',N'Nam',N'Quốc Oai','0964275293')

INSERT INTO dbo.KhachHang(MaKH,TenKH,GioiTinh,DiaChi,SDT)
VALUES('KH11',N'Trần Thế Kha',N'Nam',N'Ba Vì','0952865924')

INSERT INTO dbo.KhachHang(MaKH,TenKH,GioiTinh,DiaChi,SDT)
VALUES('KH12',N'Lê Trần Hiếu',N'Nam',N'Hà Nam','0963225446')

INSERT INTO dbo.KhachHang(MaKH,TenKH,GioiTinh,DiaChi,SDT)
VALUES('KH13',N'Nguyễn Quốc Tỉnh',N'Nam',N'Hà Nội','0958535341')

INSERT INTO dbo.KhachHang(MaKH,TenKH,GioiTinh,DiaChi,SDT)
VALUES('KH14',N'Lê Thị Thùy Dương',N'Nữ',N'Chương Mỹ','0958325752')

INSERT INTO dbo.KhachHang(MaKH,TenKH,GioiTinh,DiaChi,SDT)
VALUES('KH15',N'Trần Văn Lực',N'Nam',N'Ninh Bình','0983256263')

INSERT INTO dbo.KhachHang(MaKH,TenKH,GioiTinh,DiaChi,SDT)
VALUES('KH16',N'Nguyễn Đức Mạnh',N'Nam',N'Sơn Tây','0699285472')

INSERT INTO dbo.KhachHang(MaKH,TenKH,GioiTinh,DiaChi,SDT)
VALUES('KH17',N'Lê Văn Hoàng',N'Nam',N'Hà Nội','0693226682')

INSERT INTO dbo.KhachHang(MaKH,TenKH,GioiTinh,DiaChi,SDT)
VALUES('KH18',N'Trương Việt Bách',N'Nam',N'Thái Nguyên','0955295852')

INSERT INTO dbo.KhachHang(MaKH,TenKH,GioiTinh,DiaChi,SDT)
VALUES('KH19',N'Bùi Hiền Trang',N'Nữ',N'Tuyên Quang','0963925942')

INSERT INTO dbo.KhachHang(MaKH,TenKH,GioiTinh,DiaChi,SDT)
VALUES('KH20',N'Đỗ Minh Hiếu',N'Nam',N'Hà Nội','0683485545')

INSERT INTO dbo.KhachHang(MaKH,TenKH,GioiTinh,DiaChi,SDT)
VALUES('KH21',N'Nguyễn Xuân Thanh',N'Nam',N'Quốc Oai','0983482275')

INSERT INTO dbo.KhachHang(MaKH,TenKH,GioiTinh,DiaChi,SDT)
VALUES('KH22',N'Lê Anh Dũng',N'Nam',N'Thường Tín','0683425538')

INSERT INTO dbo.KhachHang(MaKH,TenKH,GioiTinh,DiaChi,SDT)
VALUES('KH23',N'Nguyễn Thùy Linh',N'Nữ',N'Hà Nội','0682285325')

INSERT INTO dbo.KhachHang(MaKH,TenKH,GioiTinh,DiaChi,SDT)
VALUES('KH24',N'Nguyễn Văn Đức',N'Nam',N'Hưng Yên','0982335445')

INSERT INTO dbo.KhachHang(MaKH,TenKH,GioiTinh,DiaChi,SDT)
VALUES('KH25',N'Vũ Minh Tuấn',N'Nam',N'Hà Nội','0983483325')

SELECT * FROM dbo.KhachHang

--Thêm dữ liệu vào bảng HangSX

INSERT INTO dbo.HangSX(ID_HangSX,TenHangSX) VALUES('HSX01',N'Samsung')
INSERT INTO dbo.HangSX(ID_HangSX,TenHangSX) VALUES('HSX02',N'Apple')
INSERT INTO dbo.HangSX(ID_HangSX,TenHangSX) VALUES('HSX03',N'Oppo')
INSERT INTO dbo.HangSX(ID_HangSX,TenHangSX) VALUES('HSX04',N'Sony')
INSERT INTO dbo.HangSX(ID_HangSX,TenHangSX) VALUES('HSX05',N'Nokia')
INSERT INTO dbo.HangSX(ID_HangSX,TenHangSX) VALUES('HSX06',N'Xiaomi')
INSERT INTO dbo.HangSX(ID_HangSX,TenHangSX) VALUES('HSX07',N'Huawei')
INSERT INTO dbo.HangSX(ID_HangSX,TenHangSX) VALUES('HSX08',N'Realme')
INSERT INTO dbo.HangSX(ID_HangSX,TenHangSX) VALUES('HSX09',N'Vivo')
INSERT INTO dbo.HangSX(ID_HangSX,TenHangSX) VALUES('HSX10',N'Anker') 
INSERT INTO dbo.HangSX(ID_HangSX,TenHangSX) VALUES('HSX11',N'Asus')
INSERT INTO dbo.HangSX(ID_HangSX,TenHangSX) VALUES('HSX12',N'Panasonic')
INSERT INTO dbo.HangSX(ID_HangSX,TenHangSX) VALUES('HSX13',N'Pisen')
INSERT INTO dbo.HangSX(ID_HangSX,TenHangSX) VALUES('HSX14',N'Esave')
INSERT INTO dbo.HangSX(ID_HangSX,TenHangSX) VALUES('HSX15',N'Hyper')

SELECT * FROM dbo.HangSX

--Thêm dữ liệu vào bảng MatHang

INSERT INTO dbo.MatHang(MaMH,TenMH,SoLuong,DonGiaNhap,DonGiaBan,ID_HangSX,NgayNhapHang)
VALUES('MH01',N'Điện thoại Samsung Galaxy Note 20 Ultra',26,24000000,25990000,'HSX01','20200224')

INSERT INTO dbo.MatHang(MaMH,TenMH,SoLuong,DonGiaNhap,DonGiaBan,ID_HangSX,NgayNhapHang)
VALUES('MH02',N'Điện thoại Samsung Galaxy M51',21,8000000,9400000,'HSX01','20200224')

INSERT INTO dbo.MatHang(MaMH,TenMH,SoLuong,DonGiaNhap,DonGiaBan,ID_HangSX,NgayNhapHang)
VALUES('MH03',N'Tai nghe Bluetooth Samsung MG900E',42,700000,850000,'HSX01','20200224')

INSERT INTO dbo.MatHang(MaMH,TenMH,SoLuong,DonGiaNhap,DonGiaBan,ID_HangSX,NgayNhapHang)
VALUES('MH04',N'Pin sạc dự phòng SamSung EB-P3300X 10.000 MAH',33,800000,990000,'HSX01','20200224')

INSERT INTO dbo.MatHang(MaMH,TenMH,SoLuong,DonGiaNhap,DonGiaBan,ID_HangSX,NgayNhapHang)
VALUES('MH05',N'IPhone 12 mini 64GB',23,18000000,19290000,'HSX02','20200228')

INSERT INTO dbo.MatHang(MaMH,TenMH,SoLuong,DonGiaNhap,DonGiaBan,ID_HangSX,NgayNhapHang)
VALUES('MH06',N'IPhone 12 Pro Max 512GB',18,39000000,41290000,'HSX02','20200228')

INSERT INTO dbo.MatHang(MaMH,TenMH,SoLuong,DonGiaNhap,DonGiaBan,ID_HangSX,NgayNhapHang)
VALUES('MH07',N'Tai nghe AirPods Pro sạc không dây Apple MWP22',31,4000000,5990000,'HSX02','20200228')

INSERT INTO dbo.MatHang(MaMH,TenMH,SoLuong,DonGiaNhap,DonGiaBan,ID_HangSX,NgayNhapHang)
VALUES('MH08',N'Điện thoại OPPO Reno4',28,7000000,8490000,'HSX03','20200302')

INSERT INTO dbo.MatHang(MaMH,TenMH,SoLuong,DonGiaNhap,DonGiaBan,ID_HangSX,NgayNhapHang)
VALUES('MH09',N'Điện thoại OPPO A53 (2020)',32,3000000,4490000,'HSX03','20200302')

INSERT INTO dbo.MatHang(MaMH,TenMH,SoLuong,DonGiaNhap,DonGiaBan,ID_HangSX,NgayNhapHang)
VALUES('MH10',N'Điện thoại OPPO Find X2',25,18000000,19990000,'HSX03','20200302')

INSERT INTO dbo.MatHang(MaMH,TenMH,SoLuong,DonGiaNhap,DonGiaBan,ID_HangSX,NgayNhapHang)
VALUES('MH11',N'Tai nghe chụp tai Bluetooth Sony WH-XB900N',28,4000000,5290000,'HSX04','20200302')

INSERT INTO dbo.MatHang(MaMH,TenMH,SoLuong,DonGiaNhap,DonGiaBan,ID_HangSX,NgayNhapHang)
VALUES('MH12',N'Tai nghe Bluetooth Sony WI-C200 Đen',34,700000,840000,'HSX04','20200302')

INSERT INTO dbo.MatHang(MaMH,TenMH,SoLuong,DonGiaNhap,DonGiaBan,ID_HangSX,NgayNhapHang)
VALUES('MH13',N'Điện thoại Xiaomi Mi 10T Pro 5G',29,11000000,12990000,'HSX04','20200307')

INSERT INTO dbo.MatHang(MaMH,TenMH,SoLuong,DonGiaNhap,DonGiaBan,ID_HangSX,NgayNhapHang)
VALUES('MH14',N'Điện thoại Xiaomi Redmi Note 8 Pro (6GB/128GB)',26,4500000,5990000,'HSX06','20200307')

INSERT INTO dbo.MatHang(MaMH,TenMH,SoLuong,DonGiaNhap,DonGiaBan,ID_HangSX,NgayNhapHang)
VALUES('MH15',N'Pin sạc dự phòng Polymer 10.000mAh AVA PJ JP191S',34,180000,270000,'HSX06','20200307')

INSERT INTO dbo.MatHang(MaMH,TenMH,SoLuong,DonGiaNhap,DonGiaBan,ID_HangSX,NgayNhapHang)
VALUES('MH16',N'Điện thoại Huawei Nova 7i (Nền tảng Huawei Mobile Service)',27,5500000,6990000,'HSX07','20200309')

INSERT INTO dbo.MatHang(MaMH,TenMH,SoLuong,DonGiaNhap,DonGiaBan,ID_HangSX,NgayNhapHang)
VALUES('MH17',N'Điện thoại Realme 7 Pro',24,7500000,8500000,'HSX08','20200309')

INSERT INTO dbo.MatHang(MaMH,TenMH,SoLuong,DonGiaNhap,DonGiaBan,ID_HangSX,NgayNhapHang)
VALUES('MH18',N'Điện thoại Vivo X50 Pro',17,16000000,17990000,'HSX09','20200309')

INSERT INTO dbo.MatHang(MaMH,TenMH,SoLuong,DonGiaNhap,DonGiaBan,ID_HangSX,NgayNhapHang)
VALUES('MH19',N'Adapter Sạc Type C PD 20W Anker PowerPort III Nano A2633 Trắng',38,230000,320000,'HSX10','20200311')

INSERT INTO dbo.MatHang(MaMH,TenMH,SoLuong,DonGiaNhap,DonGiaBan,ID_HangSX,NgayNhapHang)
VALUES('MH20',N'Cáp Lightning MFI 0.9m Anker Powerline II A8432',42,250000,330000,'HSX10','20200311')

INSERT INTO dbo.MatHang(MaMH,TenMH,SoLuong,DonGiaNhap,DonGiaBan,ID_HangSX,NgayNhapHang)
VALUES('MH21',N'Loa Bluetooth Anker Soundcore Flare 2 A3165 Đen',29,1600000,1785000,'HSX10','20200311')

INSERT INTO dbo.MatHang(MaMH,TenMH,SoLuong,DonGiaNhap,DonGiaBan,ID_HangSX,NgayNhapHang)
VALUES('MH22',N'Loa bluetooth Sony Extra Bass SRS-XB01',27,650000,799000,'HSX04','20200311')

INSERT INTO dbo.MatHang(MaMH,TenMH,SoLuong,DonGiaNhap,DonGiaBan,ID_HangSX,NgayNhapHang)
VALUES('MH23',N'Tai nghe Bluetooth Pisen LE002+ Đen',32,150000,280000,'HSX13','20200311')

INSERT INTO dbo.MatHang(MaMH,TenMH,SoLuong,DonGiaNhap,DonGiaBan,ID_HangSX,NgayNhapHang)
VALUES('MH24',N'Adapter sạc 4 cổng USB Type C PD 100W HyperJuice HJ-GAN100 Trắng',19,2400000,2590000,'HSX15','20200311')

INSERT INTO dbo.MatHang(MaMH,TenMH,SoLuong,DonGiaNhap,DonGiaBan,ID_HangSX,NgayNhapHang)
VALUES('MH25',N'Pin sạc dự phòng Polymer 10.000 mAh Type C eSaver PJ JP106S',17,300000,455000,'HSX14','20200311')

INSERT INTO dbo.MatHang(MaMH,TenMH,SoLuong,DonGiaNhap,DonGiaBan,ID_HangSX,NgayNhapHang)
VALUES('MH26',N'Máy tính bảng Samsung Galaxy Tab A7 (2020)',12,5500000,6999000,'HSX01','20200313')

INSERT INTO dbo.MatHang(MaMH,TenMH,SoLuong,DonGiaNhap,DonGiaBan,ID_HangSX,NgayNhapHang)
VALUES('MH27',N'Máy tính bảng iPad 8 Wifi Cellular 32GB (2020)',15,11300000,12990000,'HSX02','20200313')

SELECT * FROM dbo.MatHang

--Thêm dữ liệu vào bảng HoaDon

INSERT INTO dbo.HoaDon(MaHD,MaNV,NgayBan,MaKH) VALUES('HDB20200325|1','TCLKT3','20200325','KH01')
INSERT INTO dbo.HoaDon(MaHD,MaNV,NgayBan,MaKH) VALUES('HDB20200325|2','TCLKT4','20200325','KH02')
INSERT INTO dbo.HoaDon(MaHD,MaNV,NgayBan,MaKH) VALUES('HDB20200325|3','TCLKT5','20200325','KH03')
INSERT INTO dbo.HoaDon(MaHD,MaNV,NgayBan,MaKH) VALUES('HDB20200325|4','TCLKT6','20200325','KH04')
INSERT INTO dbo.HoaDon(MaHD,MaNV,NgayBan,MaKH) VALUES('HDB20200325|5','TCLKT6','20200325','KH05')
INSERT INTO dbo.HoaDon(MaHD,MaNV,NgayBan,MaKH) VALUES('HDB20200325|6','TCLKT4','20200325','KH06')
INSERT INTO dbo.HoaDon(MaHD,MaNV,NgayBan,MaKH) VALUES('HDB20200325|7','TCLKT5','20200325','KH07')
INSERT INTO dbo.HoaDon(MaHD,MaNV,NgayBan,MaKH) VALUES('HDB20200325|8','TCLKT6','20200325','KH08')
INSERT INTO dbo.HoaDon(MaHD,MaNV,NgayBan,MaKH) VALUES('HDB20200325|9','TCLKT3','20200325','KH09')
INSERT INTO dbo.HoaDon(MaHD,MaNV,NgayBan,MaKH) VALUES('HDB20200325|10','TCLKT4','20200325','KH10')
INSERT INTO dbo.HoaDon(MaHD,MaNV,NgayBan,MaKH) VALUES('HDB20200325|11','TCLKT3','20200325','KH11')
INSERT INTO dbo.HoaDon(MaHD,MaNV,NgayBan,MaKH) VALUES('HDB20200325|12','TCLKT5','20200325','KH12')
INSERT INTO dbo.HoaDon(MaHD,MaNV,NgayBan,MaKH) VALUES('HDB20200326|13','TCLKT6','20200326','KH13')
INSERT INTO dbo.HoaDon(MaHD,MaNV,NgayBan,MaKH) VALUES('HDB20200326|14','TCLKT4','20200326','KH14')
INSERT INTO dbo.HoaDon(MaHD,MaNV,NgayBan,MaKH) VALUES('HDB20200326|15','TCLKT3','20200326','KH15')
INSERT INTO dbo.HoaDon(MaHD,MaNV,NgayBan,MaKH) VALUES('HDB20200326|16','TCLKT3','20200326','KH16')
INSERT INTO dbo.HoaDon(MaHD,MaNV,NgayBan,MaKH) VALUES('HDB20200326|17','TCLKT4','20200326','KH17')
INSERT INTO dbo.HoaDon(MaHD,MaNV,NgayBan,MaKH) VALUES('HDB20200326|18','TCLKT5','20200326','KH18')
INSERT INTO dbo.HoaDon(MaHD,MaNV,NgayBan,MaKH) VALUES('HDB20200326|19','TCLKT6','20200326','KH19')
INSERT INTO dbo.HoaDon(MaHD,MaNV,NgayBan,MaKH) VALUES('HDB20200326|20','TCLKT6','20200326','KH20')
INSERT INTO dbo.HoaDon(MaHD,MaNV,NgayBan,MaKH) VALUES('HDB20200326|21','TCLKT3','20200326','KH21')
INSERT INTO dbo.HoaDon(MaHD,MaNV,NgayBan,MaKH) VALUES('HDB20200326|22','TCLKT4','20200326','KH22')
INSERT INTO dbo.HoaDon(MaHD,MaNV,NgayBan,MaKH) VALUES('HDB20200326|23','TCLKT5','20200326','KH23')
INSERT INTO dbo.HoaDon(MaHD,MaNV,NgayBan,MaKH) VALUES('HDB20200326|24','TCLKT5','20200326','KH24')
INSERT INTO dbo.HoaDon(MaHD,MaNV,NgayBan,MaKH) VALUES('HDB20200326|25','TCLKT6','20200326','KH25')
INSERT INTO dbo.HoaDon(MaHD,MaNV,NgayBan,MaKH) VALUES('HDB20200327|26','TCLKT3','20200327','KH14')
INSERT INTO dbo.HoaDon(MaHD,MaNV,NgayBan,MaKH) VALUES('HDB20200328|27','TCLKT4','20200328','KH07')
INSERT INTO dbo.HoaDon(MaHD,MaNV,NgayBan,MaKH) VALUES('HDB20200329|28','TCLKT4','20200329','KH09')

SELECT * FROM dbo.HoaDon

--Thêm dữ liệu vào bảng ChiTietHoaDon

INSERT INTO dbo.ChiTietHoaDon(MaHD,MaMH,SoLuong,GiamGia) VALUES ('HDB20200325|1','MH01',1,0.01)
INSERT INTO dbo.ChiTietHoaDon(MaHD,MaMH,SoLuong,GiamGia) VALUES ('HDB20200325|1','MH03',1,0.04)
INSERT INTO dbo.ChiTietHoaDon(MaHD,MaMH,SoLuong,GiamGia) VALUES ('HDB20200325|2','MH02',1,0.03)
INSERT INTO dbo.ChiTietHoaDon(MaHD,MaMH,SoLuong,GiamGia) VALUES ('HDB20200325|3','MH03',2,0.04)
INSERT INTO dbo.ChiTietHoaDon(MaHD,MaMH,SoLuong,GiamGia) VALUES ('HDB20200325|4','MH04',3,0.05)
INSERT INTO dbo.ChiTietHoaDon(MaHD,MaMH,SoLuong,GiamGia) VALUES ('HDB20200325|5','MH05',1,0.02)
INSERT INTO dbo.ChiTietHoaDon(MaHD,MaMH,SoLuong,GiamGia) VALUES ('HDB20200325|6','MH06',1,0.01)
INSERT INTO dbo.ChiTietHoaDon(MaHD,MaMH,SoLuong,GiamGia) VALUES ('HDB20200325|7','MH07',2,0.02)
INSERT INTO dbo.ChiTietHoaDon(MaHD,MaMH,SoLuong,GiamGia) VALUES ('HDB20200325|8','MH08',1,0.03)
INSERT INTO dbo.ChiTietHoaDon(MaHD,MaMH,SoLuong,GiamGia) VALUES ('HDB20200325|9','MH09',1,0.04)
INSERT INTO dbo.ChiTietHoaDon(MaHD,MaMH,SoLuong,GiamGia) VALUES ('HDB20200325|10','MH10',1,0.02)
INSERT INTO dbo.ChiTietHoaDon(MaHD,MaMH,SoLuong,GiamGia) VALUES ('HDB20200325|11','MH11',2,0.03)
INSERT INTO dbo.ChiTietHoaDon(MaHD,MaMH,SoLuong,GiamGia) VALUES ('HDB20200325|12','MH12',1,0.02)
INSERT INTO dbo.ChiTietHoaDon(MaHD,MaMH,SoLuong,GiamGia) VALUES ('HDB20200326|13','MH13',1,0.02)
INSERT INTO dbo.ChiTietHoaDon(MaHD,MaMH,SoLuong,GiamGia) VALUES ('HDB20200326|14','MH14',1,0.03)
INSERT INTO dbo.ChiTietHoaDon(MaHD,MaMH,SoLuong,GiamGia) VALUES ('HDB20200326|15','MH15',2,0.05)
INSERT INTO dbo.ChiTietHoaDon(MaHD,MaMH,SoLuong,GiamGia) VALUES ('HDB20200326|16','MH16',1,0.03)
INSERT INTO dbo.ChiTietHoaDon(MaHD,MaMH,SoLuong,GiamGia) VALUES ('HDB20200326|17','MH17',2,0.05)
INSERT INTO dbo.ChiTietHoaDon(MaHD,MaMH,SoLuong,GiamGia) VALUES ('HDB20200326|18','MH18',1,0.02)
INSERT INTO dbo.ChiTietHoaDon(MaHD,MaMH,SoLuong,GiamGia) VALUES ('HDB20200326|19','MH19',2,0.05)
INSERT INTO dbo.ChiTietHoaDon(MaHD,MaMH,SoLuong,GiamGia) VALUES ('HDB20200326|20','MH20',3,0.05)
INSERT INTO dbo.ChiTietHoaDon(MaHD,MaMH,SoLuong,GiamGia) VALUES ('HDB20200326|21','MH21',3,0.05)
INSERT INTO dbo.ChiTietHoaDon(MaHD,MaMH,SoLuong,GiamGia) VALUES ('HDB20200326|22','MH24',4,0.05)
INSERT INTO dbo.ChiTietHoaDon(MaHD,MaMH,SoLuong,GiamGia) VALUES ('HDB20200326|23','MH23',2,0.05)
INSERT INTO dbo.ChiTietHoaDon(MaHD,MaMH,SoLuong,GiamGia) VALUES ('HDB20200326|24','MH26',1,0.02)
INSERT INTO dbo.ChiTietHoaDon(MaHD,MaMH,SoLuong,GiamGia) VALUES ('HDB20200326|25','MH27',1,0.01)
INSERT INTO dbo.ChiTietHoaDon(MaHD,MaMH,SoLuong,GiamGia) VALUES ('HDB20200327|26','MH24',1,0.05)
INSERT INTO dbo.ChiTietHoaDon(MaHD,MaMH,SoLuong,GiamGia) VALUES ('HDB20200328|27','MH25',1,0.04)
INSERT INTO dbo.ChiTietHoaDon(MaHD,MaMH,SoLuong,GiamGia) VALUES ('HDB20200329|28','MH27',1,0.01)
INSERT INTO dbo.ChiTietHoaDon(MaHD,MaMH,SoLuong,GiamGia) VALUES ('HDB20200329|28','MH25',1,0.04)

SELECT * FROM dbo.ChiTietHoaDon


--Nguyễn Văn Nam - 1851171740 - 60PM1 (Nhóm 6)

----------------------------------------STORE PROCEDURE(Thủ tục)-----------------------------------------------------

--Câu 1:Thủ tục để cập nhật trường ThanhTien
--cho bảng ChiTietHoaDon sao cho ThanhTien = SoLuong * DonGia*(1-GiamGia)
CREATE PROCEDURE SP_ThanhTien 
AS
BEGIN
	UPDATE ChiTietHoaDon 
	SET ThanhTien = SoLuong * (SELECT DonGiaBan FROM MatHang 
	WHERE MatHang.MaMH  = ChiTietHoaDon.MaMH)*(1-GiamGia)
END
GO

--Thực thi thủ tục:
EXECUTE SP_ThanhTien
GO

SELECT * FROM dbo.ChiTietHoaDon
GO

--Câu 2: Tạo thủ tục để cập nhật trường TongTien 
--cho bảng HoaDon bằng tổng ThanhTien của tất cả các sản phẩm trong đơn hàng

CREATE PROCEDURE SP_TongTien 
AS
BEGIN
	UPDATE HoaDon 
	SET TongTien = (SELECT SUM(ThanhTien) FROM ChiTietHoaDon 
	WHERE ChiTietHoaDon.MaHD = HoaDon.MaHD)
END
GO

--Thực thi thủ tục: 
EXECUTE SP_TongTien
GO


--Câu 3: Tạo để thống kê và in ra màn hình số lượng hóa đơn bán được theo ngày trong tuần,
--và in ra màn hình xem ngày nào trong tuần thường có nhiều người mua hàng nhất.

CREATE PROCEDURE SP_ThongKe
AS
BEGIN
	DECLARE @i INT = 1, @Max INT = 0, @NgayMax NVARCHAR(32)
	PRINT N'Số lượng hóa đơn theo ngày trong tuần: '
	PRINT ''
	WHILE(@i<8)
	BEGIN
		DECLARE @Ngay NVARCHAR(32)
		SELECT @Ngay = 
		(
		CASE @i
			WHEN 1 THEN N'Chủ nhật'
			WHEN 2 THEN N'Thứ hai'
			WHEN 3 THEN N'Thứ ba'
			WHEN 4 THEN N'Thứ tư'
			WHEN 5 THEN N'Thứ năm'
			WHEN 6 THEN N'Thứ sáu'
			WHEN 7 THEN N'Thứ bảy'
			END 
		)
		DECLARE @SoLuong INT
		SELECT @SoLuong = COUNT(MaHD) FROM dbo.HoaDon WHERE DATEPART(WEEKDAY,NgayBan)=@i
		SET @i=@i+1
		IF (@Max<@SoLuong) 
		BEGIN
		SET @Max=@SoLuong
		SET @NgayMax =@Ngay
		END
		PRINT @Ngay+ ': '+CAST(@SoLuong AS VARCHAR(8));
	END
	PRINT ''
	PRINT '--> '+@NgayMax+ N' có nhiều người mua hàng nhất với số lượng: '+CONVERT(VARCHAR(8),@Max) + N' người mua hàng';
END
GO

--Chạy thử: 
EXECUTE SP_ThongKe
GO

 --Câu 4: Tạo thủ tục để hiện số lượng đã bán được của một mặt hàng bất kỳ
 --Nếu mã mặt hàng không tồn tại trong CSLD thì thống kê số lượng bán được của tất cả các mặt hàng

CREATE PROCEDURE SP_SoLuongBanMH
@MaMH VARCHAR(8)
AS
BEGIN
	 IF EXISTS(SELECT * FROM dbo.MatHang WHERE MaMH = @MaMH)
	 BEGIN
		 SELECT MH.MaMH, MH.TenMH,SUM(CTDH.SoLuong) AS N'Số lượng đã bán được'
		 FROM dbo.ChiTietHoaDon AS CTDH, dbo.MatHang AS MH
		 WHERE CTDH.MaMH = MH.MaMH AND CTDH.MaMH = @MaMH
		 GROUP BY MH.MaMH, MH.TenMH
	 END
	 ELSE
	 BEGIN
		SELECT MH.MaMH, MH.TenMH,SUM(CTDH.SoLuong) AS N'Số lượng đã bán được'
		 FROM dbo.ChiTietHoaDon AS CTDH, dbo.MatHang AS MH
		 WHERE CTDH.MaMH = MH.MaMH
		 GROUP BY MH.MaMH, MH.TenMH
	 END
 END
 GO

 --Trường hợp mã mặt hàng tồn tại
 EXECUTE SP_SoLuongBanMH 'MH01'
 GO

 --Trường hợp mã mặt hàng không tồn tại
 EXECUTE SP_SoLuongBanMH'abc'
 GO
 
--Câu 5: Thủ tục tìm kiếm hàng theo tên hãng sản xuất
CREATE PROCEDURE sp_TimKiem_Hang_TenHangSX
@TenHangSX NVARCHAR(255)
AS
BEGIN
    SELECT * FROM vw_Hang_HangSX
	WHERE TenHangSX LIKE '%'+@TenHangSX+'%'
END

--Chạy thử:
EXECUTE sp_TimKiem_Hang_TenHangSX N'Oppo'
GO

--Câu 6: Thủ tục xóa hóa đơn và chi tiết hóa đơn tương ứng với mã hóa đơn truyền vào

CREATE PROCEDURE sp_Xoa_HoaDon_CTHD
@MaHD VARCHAR(32)
AS
BEGIN
	DECLARE con_tro_CTHD CURSOR
	DYNAMIC SCROLL
	FOR
		SELECT MaMH FROM ChiTietHoaDon

	OPEN con_tro_CTHD

	DECLARE @MaMH VARCHAR(8)
	FETCH NEXT FROM con_tro_CTHD INTO @MaMH
	WHILE(@@FETCH_STATUS=0)
		BEGIN
			DELETE FROM ChiTietHoaDon
			WHERE MaHD=@MaHD AND MaMH=@MaMH
			FETCH NEXT FROM con_tro_CTHD INTO @MaMH
		END

	CLOSE con_tro_CTHD
	DEALLOCATE con_tro_CTHD 
	DELETE FROM HoaDon
	WHERE MaHD=@MaHD
END

--Chạy thử:
EXECUTE sp_Xoa_HoaDon_CTHD 'HDB20200329|28'
GO

SELECT * FROM dbo.ChiTietHoaDon
SELECT * from HoaDon
GO

---------------------------------------------FUNCTION(Hàm)---------------------------------------------------------------

 --Câu 1: Tạo hàm hiển thị toàn bộ danh sách mặt hàng của hãng sản xuất nào đó
 --với tên hãng sản xuất là tham số được truyền vào. Nếu tên hãng sản xuất nhập vào không có trong CSDL
 --Thì in danh sách toàn bộ mặt hàng cùng với tên hãng sản xuất của mặt hàng đó

 CREATE FUNCTION UF_HangSX(@TenHSX NVARCHAR(255))
 RETURNS @List TABLE(MaMH VARCHAR(8), TenMH NVARCHAR(255),GiaNhap FLOAT,TenHSX NVARCHAR(255))
 AS
 BEGIN
	IF EXISTS(SELECT * FROM dbo.HangSX WHERE TenHangSX = @TenHSX)
	BEGIN
		INSERT INTO @List 
		SELECT MH.MaMH, MH.TenMH, MH.DonGiaNhap,HSX.TenHangSX
		FROM dbo.MatHang AS MH, dbo.HangSX AS HSX
		WHERE MH.ID_HangSX = HSX.ID_HangSX AND HSX.TenHangSX = @TenHSX
	END
	ELSE
	BEGIN
		INSERT INTO @List 
		SELECT MH.MaMH, MH.TenMH, MH.DonGiaNhap,HSX.TenHangSX
		FROM dbo.MatHang AS MH, dbo.HangSX AS HSX
		WHERE MH.ID_HangSX = HSX.ID_HangSX 		 
	END
	RETURN
 END
 GO

 --Trường hợp tên hãng sản xuất truyền vào tồn tại trong csdl
 SELECT * FROM dbo.UF_HangSX(N'SamSung')

 --Trường hợp tên hãng sản xuất truyền vào không tồn tại trong csdl
 SELECT * FROM dbo.UF_HangSX(N'abc')
 GO
 --Câu 2: Viết hàm tính số doanh thu mà nhân viên đó đã mang về cho cửa hàng trong một khoảng thời gian nào đó
 -- với mã nhân viên,ngày đầu và ngày cuối là tham số truyền vào
 
 CREATE FUNCTION UF_DoanhThuTheoNV(@MaNV VARCHAR(8), @NgayDau DATE, @NgayCuoi DATE)
 RETURNS FLOAT
 AS
 BEGIN
	DECLARE @DoanhThu FLOAT
	SELECT @DoanhThu=(SELECT SUM(TongTien) 
					  FROM dbo.HoaDon 
					  WHERE MaNV = @MaNV AND NgayBan BETWEEN @NgayDau AND @NgayCuoi)
	RETURN @DoanhThu
 END
 GO

 --Chạy thử:
 SELECT dbo.UF_DoanhThuTheoNV('TCLKT3','20200301','20200331') AS N'Doanh thu mang về cho cửa hàng'
 GO

--Câu 3:hàm tính tổng lợi nhuận mà nhân viên nào đó đã mang lại cho cửa hàng trong một khoảng thời gian nào đó
 --với mã nhân viên,ngày đầu và ngày cuối là tham số truyền vào

CREATE FUNCTION UF_LoiNhuanTheoNV(@MaNV VARCHAR(8),@NgayDau DATE, @NgayCuoi DATE)
 RETURNS FLOAT
 AS
 BEGIN
	DECLARE @LoiNhuan FLOAT,@DoanhThu FLOAT
	SELECT @DoanhThu = dbo.UF_DoanhThuTheoNV(@MaNV,@NgayDau,@NgayCuoi)
	SELECT @LoiNhuan = @DoanhThu - SUM(MH.DonGiaNhap*CTHD.SoLuong)
	FROM dbo.MatHang AS MH, dbo.ChiTietHoaDon AS CTHD, dbo.HoaDon AS HD
	WHERE MH.MaMH = CTHD.MaMH AND CTHD.MaHD = HD.MaHD AND HD.MaNV = @MaNV
		  AND HD.NgayBan BETWEEN @NgayDau AND @NgayCuoi
	RETURN @LoiNhuan
 END
 GO

 --Chạy thử:
 SELECT dbo.UF_LoiNhuanTheoNV('TCLKT3','20200301','20200331') AS N'Lợi nhuận mang về cho cửa hàng'
 GO

--Câu 4: Thống kê số lượng hóa đơn của cửa hàng trong một khoảng thời gian nào đó
--với ngày đầu và ngày cuối là tham số đầu vào của hàm
CREATE FUNCTION UF_HoaDonTheoNgay(@NgayDau DATE, @NgayCuoi DATE)
RETURNS INT 
AS
BEGIN
	DECLARE @SoLuong INT
	SELECT @SoLuong = (SELECT COUNT(*) FROM HoaDon WHERE NgayBan BETWEEN @NgayDau AND @NgayCuoi)
	RETURN @SoLuong
END
GO

--Chạy thử:
SELECT dbo.UF_HoaDonTheoNgay('20200301','20200331') AS N'Số hóa đơn'

SELECT * FROM dbo.HoaDon
GO

-----------------------------------------------VIEW(Khung nhìn)-----------------------------------------------------

--Câu 1: Tạo view cho biết số lượng đã được bán của từng mặt hàng

CREATE VIEW vw_SLBanTheoMH
AS
 SELECT MH.MaMH, MH.TenMH, SUM(CTHD.SoLuong) AS N'Số lượng đã bán'
 FROM MatHang AS MH, ChiTietHoaDon AS CTHD
 WHERE MH.MaMH = CTHD.MaMH
 GROUP BY MH.MaMH, MH.TenMH
GO

--Chạy thử:
SELECT * FROM vw_SLBanTheoMH
GO
--Câu 2: Tạo view để thống kê số hóa đơn từng nhân viên tạo được

CREATE VIEW vw_TongSoHoaDon_NhanVien
AS 
	SELECT NV.MaNV, NV.HoTen, COUNT(*) AS N'Số hóa đơn tạo được'
	FROM dbo.NhanVien AS NV, dbo.HoaDon AS HD
	WHERE NV.MaNV = HD.MaNV
	GROUP BY NV.MaNV, NV.HoTen
GO

SELECT * FROM vw_TongSoHoaDon_NhanVien
GO

--Câu 3: Tạo view hiển thị thông tin mặt hàng và tên hãng sản xuất
CREATE VIEW vw_Hang_HangSX
AS
	SELECT MH.MaMH,MH.TenMH,HSX.ID_HangSX, HSX.TenHangSX, MH.SoLuong,MH.DonGiaNhap, MH.DonGiaBan, MH.NgayNhapHang
	FROM dbo.MatHang AS MH, dbo.HangSX AS HSX
	WHERE MH.ID_HangSX = HSX.ID_HangSX

--Chạy thử
SELECT * FROM dbo.vw_Hang_HangSX
GO

-----------------------------------------------------TRIGGER---------------------------------------------------------

--Câu 1: Tạo trigger cập nhật tự động trường ThanhTien trong bảng ChiTietHoaDon khi thực hiện
--thao tác thêm hoặc sửa một bản ghi trong bảng ChiTietDonHang

CREATE TRIGGER UTG_Update_ThanhTien
ON ChiTietHoaDon
FOR INSERT, UPDATE
AS
BEGIN
	UPDATE ChiTietHoaDon
	SET ThanhTien = ChiTietHoaDon.SoLuong*(1-ChiTietHoaDon.GiamGia)*MatHang.DonGiaBan
	FROM MatHang, inserted
	WHERE MatHang.MaMH = ChiTietHoaDon.MaMH AND ChiTietHoaDon.MaMH = inserted.MaMH AND ChiTietHoaDon.MaHD = inserted.MaHD
END
GO

INSERT INTO dbo.ChiTietHoaDon(MaHD,MaMH,SoLuong,GiamGia) VALUES ('HDB20200328|27','MH04',2,0.04)
UPDATE dbo.ChiTietHoaDon SET SoLuong = 3 WHERE MaHD = 'HDB20200328|27' AND MaMH = 'MH04'

SELECT * FROM dbo.ChiTietHoaDon

DELETE FROM dbo.ChiTietHoaDon WHERE MaHD = 'HDB20200328|27' AND MaMH = 'MH04'
GO

--Câu 2: Tạo trigger cập nhật tự động trường TongTien trong bảng HoaDon khi thực hiện
--thao tác thêm hoặc sửa một bản ghi trong bảng ChiTietDonHang

CREATE TRIGGER UTG_UPDATE_TongTien
ON ChiTietHoaDon
FOR INSERT, UPDATE
AS
BEGIN
	UPDATE HoaDon 
	SET TongTien = (SELECT SUM(ThanhTien) FROM ChiTietHoaDon 
	WHERE ChiTietHoaDon.MaHD = HoaDon.MaHD)
	FROM inserted
	WHERE HoaDon.MaHD = inserted.MaHD
END
GO

INSERT INTO dbo.ChiTietHoaDon(MaHD,MaMH,SoLuong,GiamGia) VALUES ('HDB20200328|27','MH04',2,0.04)
UPDATE dbo.ChiTietHoaDon SET SoLuong = 5 WHERE MaHD = 'HDB20200328|27' AND MaMH = 'MH04'

SELECT * FROM dbo.ChiTietHoaDon
SELECT * FROM dbo.HoaDon
GO

--Câu 3: Tạo trigger thực hiện xóa các bản ghi tương ứng trong bảng HoaDon Và ChiTietHoaDon
--Khi xóa một khách hàng khỏi bảng khách hàng

ALTER TABLE dbo.HoaDon ADD CONSTRAINT FK_HoaDon_KhachHang_New FOREIGN KEY(MaKH)
REFERENCES dbo.KhachHang(MaKH)
ON DELETE CASCADE;

ALTER TABLE dbo.ChiTietHoaDon ADD CONSTRAINT FK_ChiTietHoaDon_HoaDon_New FOREIGN KEY(MaHD)
REFERENCES dbo.HoaDon(MaHD)
ON DELETE CASCADE;
GO

CREATE TRIGGER UTG_DeleteKH
ON KhachHang
FOR DELETE
AS
BEGIN
	DELETE dbo.HoaDon
	WHERE MaKH = (SELECT MaKH FROM deleted)
	DELETE dbo.ChiTietHoaDon
	WHERE MaHD = (SELECT MaHD FROM dbo.HoaDon WHERE MaKH = (SELECT MaKH FROM deleted))
END
GO

DELETE dbo.KhachHang WHERE MaKH = 'KH01'

SELECT * FROM dbo.KhachHang
SELECT * FROM dbo.HoaDon
SELECT * FROM dbo.ChiTietHoaDon
GO

--Câu 4: Tạo trigger kiểm tra MaKH, MaNV khi thêm mới một hóa đơn

CREATE TRIGGER UTR_Check_ThemHD
ON HoaDon
INSTEAD OF INSERT 
AS
BEGIN
	IF((SELECT MaNV FROM inserted) NOT IN (SELECT MaNV FROM dbo.NhanVien))
	BEGIN
		PRINT N'Mã nhân viên này không tồn tại!'
		ROLLBACK
	END
	ELSE iF((SELECT MaKH FROM inserted) NOT IN (SELECT MaKH FROM dbo.KhachHang))
	BEGIN
		PRINT N'Mã khách hàng này không tồn tại!'
		ROLLBACK TRAN
	END
	ELSE 
	BEGIN
		PRINT N'Thêm hóa đơn thành công'
		INSERT INTO dbo.HoaDon(MaHD,MaNV,NgayBan,MaKH)
		SELECT MaHD,MaNV,NgayBan,MaKH FROM inserted
	END
END
GO

INSERT INTO dbo.HoaDon(MaHD,MaNV,NgayBan,MaKH) VALUES('HDB20200328|29','NV04','20200328','KH08')
INSERT INTO dbo.HoaDon(MaHD,MaNV,NgayBan,MaKH) VALUES('HDB20200328|29','TCLKT4','20200328','KH08')

SELECT * FROM dbo.HoaDon

--------------------------------------------------CURSOR(Con Trỏ)---------------------------------------------------------

--Câu 1: Sử dụng con trỏ để in ra tên mặt hàng và tên hãng sản xuất của mặt hàng đó

DECLARE con_tro_mh CURSOR
DYNAMIC SCROLL
FOR 
	SELECT MH.TenMH,HSX.TenHangSX 
	FROM dbo.MatHang AS MH, dbo.HangSX AS HSX
	WHERE MH.ID_HangSX = HSX.ID_HangSX

OPEN con_tro_mh

DECLARE @TenMH NVARCHAR(255), @TenHSX NVARCHAR(255)
FETCH NEXT FROM con_tro_mh INTO @TenMH, @TenHSX
WHILE(@@FETCH_STATUS = 0)
BEGIN
	PRINT ''
	PRINT @TenMH+N' ------> thuộc hãng: '+@TenHSX
	FETCH NEXT FROM con_tro_mh INTO @TenMH, @TenHSX
END
CLOSE con_tro_mh
DEALLOCATE con_tro_mh

--Câu 2: Sử dụng con trỏ để cập nhật lương cho nhân viên theo lợi nhuận mang về cho cửa hàng
--(Thường Thực hiện khi tính lương cho nhân viên, 1 tháng 1 lần)
 
DECLARE Update_Luong CURSOR
DYNAMIC SCROLL
FOR 
	SELECT MaNV, dbo.UF_LoiNhuanTheoNV(MaNV,'20200301','20200331') FROM dbo.NhanVien WHERE ChucVu = N'Nhân viên'

OPEN Update_Luong

DECLARE @MaNV VARCHAR(8)
DECLARE @LoiNhuan FLOAT

FETCH NEXT FROM Update_Luong INTO @MaNV, @LoiNhuan

WHILE(@@FETCH_STATUS = 0)
BEGIN 
	IF (@LoiNhuan > 20000000)
	BEGIN
		UPDATE dbo.NhanVien SET Luong = Luong + 1500000 WHERE MaNV = @MaNV
	END
	ELSE IF(@LoiNhuan <= 20000000 AND @LoiNhuan > 15000000) 
	BEGIN
		UPDATE dbo.NhanVien SET Luong = Luong + 1000000 WHERE MaNV = @MaNV
	END
	ELSE IF(@LoiNhuan <= 15000000 AND @LoiNhuan >= 10000000)
	BEGIN
		UPDATE dbo.NhanVien SET Luong = Luong + 500000 WHERE MaNV = @MaNV
	END
	ELSE IF(@LoiNhuan < 5000000)
	BEGIN
		UPDATE dbo.NhanVien SET Luong = Luong - 500000 WHERE MaNV = @MaNV
	END
	FETCH NEXT FROM Update_Luong INTO @MaNV, @LoiNhuan
END

CLOSE Update_Luong
DEALLOCATE Update_Luong
GO

-------------------------------------------------------------THE END-----------------------------------------------------------------


--Đào Minh Khoa - 1851061430 - 60PM1(Nhóm 6)

----------------------------------------STORE PROCEDURE(Thủ tục)---------------------------------------------------------

--Câu 7: Thủ tục tìm kiếm các mặt hàng mà được nhập trong ngày bất kì
CREATE PROCEDURE sp_TimKiem_Hang_NgayNhap
@Ngay DATE
AS
BEGIN
	SELECT * FROM vw_Hang_HangSX WHERE NgayNhapHang = @Ngay 
END
GO

--Chạy thử:
EXECUTE sp_TimKiem_Hang_NgayNhap '20200309'
GO
--Câu 8: Thủ tục tìm kiếm nhân viên theo giới tính

CREATE PROCEDURE sp_TimKiem_NhanVien_GioiTinh
@GioiTinh NVARCHAR(8)
AS
BEGIN
    SELECT * 
	FROM NhanVien
	WHERE GioiTinh=@GioiTinh
END
GO

--Chạy thử:
EXECUTE sp_TimKiem_NhanVien_GioiTinh N'Nữ'
GO

--Câu 9: Thủ tục tìm kiếm nhân viên theo quê quán

CREATE PROCEDURE sp_TimKiem_NhanVien_QueQuan
@Quequan NVARCHAR(255)
AS
BEGIN
   SELECT * FROM NhanVien
   WHERE DiaChi LIKE '%'+@Quequan+'%'
END

--Chạy thử:
EXECUTE sp_TimKiem_NhanVien_QueQuan N'Hà Nội'
GO

--Câu 10: Thủ tục tìm kiếm nhân viên theo họ tên
CREATE PROCEDURE sp_TimKiem_NhanVien_HT
@HoTen NVARCHAR(255)
AS
BEGIN
	SELECT * 
	FROM NhanVien
	WHERE HoTen LIKE +'%'+@HoTen+'%'
END
GO

--Chạy thử:
EXECUTE sp_TimKiem_NhanVien_HT N'Nguyễn Văn Toàn'
GO

---------------------------------------------FUNCTION(Hàm)----------------------------------------------------------
--Câu 5: Hàm trả về giá trị tính tổng số mặt hàng còn lại trong kho

CREATE FUNCTION Fun_Hang_TongSoMatHangConLai()
RETURNS INT
AS
 BEGIN
	DECLARE @tong INT
	SELECT @tong = (SELECT COUNT(MaMH) FROM MatHang WHERE SoLuong >=1)
	RETURN @tong
END
GO

--Chạy thử:
SELECT dbo.Fun_Hang_TongSoMatHangConLai() AS N' Tổng số lượng mặt hàng'
GO

 --Câu 6: Tạo hàm để tính lợi nhuận của cửa hàng trong một khoảng thời gian nào đó
 --với ngày đầu và ngày cuối là tham số đầu vào của hàm

 CREATE FUNCTION Fun_LoiNhuan_TheoNgay(@NgayDau DATE, @NgayCuoi DATE)
 RETURNS FLOAT
 AS
 BEGIN
	DECLARE @LoiNhuan FLOAT,@DoanhThu FLOAT
	SELECT @DoanhThu = dbo.Fun_DoanhThu_TheoNgay(@NgayDau,@NgayCuoi)
	SELECT @LoiNhuan = @DoanhThu - SUM(MH.DonGiaNhap*CTHD.SoLuong)
	FROM dbo.MatHang AS MH, dbo.ChiTietHoaDon AS CTHD, dbo.HoaDon AS HD
	WHERE MH.MaMH = CTHD.MaMH AND CTHD.MaHD = HD.MaHD AND HD.NgayBan BETWEEN @NgayDau AND @NgayCuoi
	RETURN @LoiNhuan
 END
 GO

 --Chạy thử:
 SELECT dbo.Fun_LoiNhuan_TheoNgay('20200301','20200331') AS LoiNhuan
 GO

  -----------------------------------------------VIEW(Khung nhìn)----------------------------------------------------------
--Câu 4: Tạo view dùng để liệt kê danh sách các mặt hàng có trong bảng hàng

CREATE VIEW vw_MatHang
AS
	SELECT MaMH,TenMH,SoLuong
	FROM dbo.MatHang
GO

--Chạy thử:
SELECT * FROM dbo.vw_MatHang
GO
--Câu 5: Tạo view chứa thông tin về giao dịch mua hàng của khách hàng

CREATE VIEW vw_ThongTinGiaoDichHang_KhachHang
AS
	SELECT KH.MaKH, KH.TenKH, NV.MaNV, NV.HoTen, HD.NgayBan, HD.TongTien
	FROM dbo.KhachHang AS KH, dbo.HoaDon AS HD, dbo.NhanVien AS NV
	WHERE KH.MaKH = HD.MaKH AND HD.MaNV = NV.MaNV  
GO


SELECT * FROM vw_ThongTinGiaoDichHang_KhachHang
GO

-----------------------------------------------------Trigger------------------------------------------------------------

--Câu 5: Cập nhật tự động tổng tiền trong bảng hóa đơn khi xóa một chi tiết hóa đơn
CREATE TRIGGER Tr_TongTienHoaDon_XoaChiTietHoaDon
ON ChiTietHoaDon
FOR DELETE
AS
IF((SELECT MaHD FROM deleted) IS NOT NULL)
BEGIN
	UPDATE HoaDon 
	SET TongTien=(SELECT SUM(ThanhTien) FROM ChiTietHoaDon
	WHERE ChiTietHoaDon.MaHD=HoaDon.MaHD)
	FROM (SELECT MaHD from deleted) as I
	where HoaDon.MaHD=I.MaHD
END
GO

--Câu 6: Cập nhật tự động số lượng tồn của một mặt hàng khi xuất mặt hàng đó

CREATE TRIGGER Tr_SoLuongTon_Hang
ON ChiTietHoaDon
FOR INSERT
AS
BEGIN
	UPDATE MatHang
	SET SoLuong = MatHang.SoLuong - (
		SELECT SoLuong
		FROM inserted
		WHERE inserted.MaMH = MatHang.MaMH
	)
	FROM ChiTietHoaDon, inserted 
	WHERE MatHang.MaMH = inserted.MaMH
END
GO

---------------------------------------------------------THE END--------------------------------------------------------


--Tô Văn Tuấn - 1851171365 - 60PM1(Nhóm 6)

----------------------------------------STORE PROCEDURE(Thủ tục)---------------------------------------------------------
--Câu 11: Thủ tục Tìm kiếm hóa đơn trong một khoảng thời gian nào đó
 --với ngày đầu và ngày cuối là tham số đầu vào

 CREATE PROCEDURE sp_TimKiem_HoaDon_TheoNgay
 @NgayDau DATE, @NgayCuoi DATE
 AS
 BEGIN
	SELECT * FROM dbo.vw_HoaDon_NhanVien
	WHERE NgayBan BETWEEN @NgayDau AND @NgayCuoi
 END
 GO

 --Chạy thử:
 EXECUTE sp_TimKiem_HoaDon_TheoNgay '20200327','20200329'
 GO

 --Câu 12: Thủ tục tìm kiếm hóa đơn theo tên nhân viên
CREATE PROCEDURE sp_TimKiem_HoaDon_TenNV
@TenNV NVARCHAR(255)
AS
BEGIN
    SELECT * FROM vw_HoaDon_NhanVien
	WHERE @TenNV = HoTen
END
GO

--chạy thử:
EXECUTE sp_TimKiem_HoaDon_TenNV N'Đỗ Duy Mạnh'
GO


--Câu 13: Thủ tục in ra khách hàng theo số điện thoại
CREATE PROCEDURE sp_TimKiem_KhachHang_SDT
@SDT VARCHAR(32)
AS
BEGIN
	SELECT *
	FROM KhachHang
	WHERE SDT=@SDT
END
--Chạy thử:
EXECUTE sp_TimKiem_KhachHang_SDT '0966265732'
GO

SELECT * FROM dbo.KhachHang
GO
--Câu 14: Thủ tục in ra khách hàng theo số điện thoại
CREATE PROCEDURE sp_TimKiem_KhachHang_TenKH
@TenKH NVARCHAR (255)
AS
BEGIN
    SELECT * 
	FROM KhachHang
	WHERE TenKH LIKE '%'+@TenKH+'%'
END
--Chạy thử:
EXECUTE sp_TimKiem_KhachHang_TenKH N'Tuấn'
GO

 -----------------------------------------------FUNCTION(Hàm)----------------------------------------------------------
 
 --Câu 7: Tạo hàm để tính doanh thu của cửa hàng trong một khoảng thời gian nào đó
 --với ngày đầu và ngày cuối là tham số đầu vào của hàm
 
 CREATE FUNCTION Fun_DoanhThu_TheoNgay(@NgayDau DATE, @NgayCuoi DATE)
 RETURNS FLOAT
 AS
 BEGIN
	DECLARE @DoanhThu FLOAT
	SELECT @DoanhThu=(SELECT SUM(TongTien) FROM dbo.HoaDon WHERE NgayBan BETWEEN @NgayDau AND @NgayCuoi)
	RETURN @DoanhThu
 END
 GO

 --Chạy thử:
 SELECT dbo.Fun_DoanhThu_TheoNgay('20200301','20200331') AS DoanhThu
 GO

--Câu 8: Hàm trả về giá trị tính tổng số lượng tồn của các mặt hàng trong kho
CREATE FUNCTION Fun_Hang_TongSoLuongTon()
RETURNS INT
AS
BEGIN
	DECLARE @tong INT
	SELECT @tong = (SELECT SUM(SoLuong) FROM MatHang)
	RETURN @tong
END
GO

--Chạy thử:
SELECT dbo.Fun_Hang_TongSoLuongTon() AS N' Tổng số lượng tồn'
GO

-----------------------------------------------VIEW(Khung nhìn)----------------------------------------------------------

--Câu 6: Tạo view thống kê số lượng sản phẩm từng nhân viên bán được
CREATE VIEW vw_SLBanTheoNV
AS 
	SELECT NV.MaNV, NV.HoTen, SUM(CTHD.SoLuong) AS N'Số sản phẩm bán được'
	FROM dbo.NhanVien AS NV, dbo.ChiTietHoaDon AS CTHD , dbo.HoaDon AS HD
	WHERE NV.MaNV = HD.MaNV AND HD.MaHD = CTHD.MaHD 
	GROUP BY NV.MaNV, NV.HoTen

--Chạy thử
SELECT * FROM dbo.vw_SLBanTheoNV
GO

--Câu 7: Tạo view chứa thông tin nhân viên đã xuất ra hóa đơn cho khách hàng 

CREATE VIEW vw_HoaDon_NhanVien
AS
	SELECT HD.MaHD, NV.MaNV, NV.HoTen, HD.MaKH, HD.NgayBan, HD.TongTien
	FROM HoaDon AS HD, NhanVien AS NV
	WHERE HD.MaNV = NV.MaNV

--Chạy thử
SELECT * FROM dbo.vw_HoaDon_NhanVien
GO

-----------------------------------------------------Trigger-----------------------------------------------------------

--Câu 7: Cập nhật tự động số lượng tồn khi sửa số lượng của 1 mặt hàng trong bảng chi tiết hóa đơn

CREATE TRIGGER Tr_CapNhatDatHang_ChitietHoaDon
ON ChiTietHoaDon
FOR UPDATE
AS
BEGIN
	UPDATE MatHang
	SET SoLuong=SoLuong - (SELECT SoLuong FROM inserted where MatHang.MaMH=inserted.MaMH)
	+ (SELECT SoLuong FROM deleted WHERE MatHang.MaMH=deleted.MaMH)
	FROM (SELECT MaMH FROM deleted) AS D
	WHERE MatHang.MaMH=D.MaMH
END
GO

--Câu 8: Cập nhật tự động số lượng tồn của một mặt hàng khi xóa mặt hàng đó

CREATE TRIGGER Tr_SoLuongTon_XoaChiTietHoaDon
ON ChiTietHoaDon
FOR DELETE
AS
BEGIN
	UPDATE MatHang
	SET SoLuong = MatHang.SoLuong + (SELECT SoLuong FROM deleted WHERE deleted.MaMH = MatHang.MaMH)
	FROM deleted
	WHERE MatHang.MaMH = deleted.MaMH
END


