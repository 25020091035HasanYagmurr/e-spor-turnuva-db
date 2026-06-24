-- 1. Veri Tabanını Oluşturma
CREATE DATABASE EsporTurnuvaDB;
GO

USE EsporTurnuvaDB;
GO

-- 2. Takimlar Tablosu
CREATE TABLE Takimlar (
    TakimID INT IDENTITY(1,1) PRIMARY KEY,
    TakimAdi NVARCHAR(50) NOT NULL,
    KurulusYili INT
);

-- 3. Oyuncular Tablosu
CREATE TABLE Oyuncular (
    OyuncuID INT IDENTITY(1,1) PRIMARY KEY,
    KullaniciAdi NVARCHAR(50) NOT NULL,
    GercekIsim NVARCHAR(50),
    Yas INT,
    TakimID INT FOREIGN KEY REFERENCES Takimlar(TakimID)
);

-- 4. Sampiyonlar Tablosu
CREATE TABLE Sampiyonlar (
    SampiyonID INT IDENTITY(1,1) PRIMARY KEY,
    SampiyonAdi NVARCHAR(50) NOT NULL,
    Rol NVARCHAR(20) NOT NULL
);

-- 5. Maçlar Tablosu
CREATE TABLE Maclar (
    MacID INT IDENTITY(1,1) PRIMARY KEY,
    EvSahibiTakimID INT FOREIGN KEY REFERENCES Takimlar(TakimID),
    DegisenTakimID INT FOREIGN KEY REFERENCES Takimlar(TakimID),
    EvSahibiSkor INT,
    DegisenSkor INT,
    Tarih DATE
);
GO

-- 6. Örnek Verileri Ekleme
-- Takım Ekleme
INSERT INTO Takimlar (TakimAdi, KurulusYili) VALUES 
('Dark Phantoms', 2022),
('Shadow Wolves', 2023),
('Elite Academy', 2024);

-- Oyuncu Ekleme
INSERT INTO Oyuncular (KullaniciAdi, GercekIsim, Yas, TakimID) VALUES 
('hanımcıi', 'Hasan Yagmur', 21, 1),
('Faker', 'Lee Sang-hyeok', 29, 2),
('ShadowBlade', 'Ahmet Yilmaz', 22, 1),
('Nightmare', 'Can Demir', 20, 3);

-- Şampiyon Ekleme
INSERT INTO Sampiyonlar (SampiyonAdi, Rol) VALUES 
('Yone', 'Orta Koridor'),
('Zed', 'Orta Koridor'),
('Lee Sin', 'Orman'),
('Lux', 'Destek');

-- Maç Ekleme
INSERT INTO Maclar (EvSahibiTakimID, DegisenTakimID, EvSahibiSkor, DegisenSkor, Tarih) VALUES 
(1, 2, 2, 1, '2026-06-20'),
(3, 1, 0, 2, '2026-06-22');
GO

-- 7. Test ve Listeleme Sorgusu (JOIN Örneği)
USE EsporTurnuvaDB;
GO

SELECT 
    o.KullaniciAdi, 
    o.GercekIsim, 
    t.TakimAdi,
    o.Yas
FROM Oyuncular o
JOIN Takimlar t ON o.TakimID = t.TakimID;
