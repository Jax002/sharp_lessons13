CREATE TABLE Categories (
    Id NUMBER(10) PRIMARY KEY,
    CategoryName VARCHAR2(100)
);
CREATE TABLE Books (
    Id NUMBER(10) PRIMARY KEY,
    Title VARCHAR2(200) NOT NULL,
    Price NUMBER(10),
    CategoryId NUMBER(10),
    IsDeleted NUMBER(1) DEFAULT 0,
    CONSTRAINT fk_books_category 
        FOREIGN KEY (CategoryId) 
        REFERENCES Categories(Id)
);
--Завдання 1
SELECT Title, Price
FROM Books
WHERE Price > 300
ORDER BY Price DESC;

--Завдання 2
INSERT INTO Categories (Id, CategoryName)
VALUES (1, 'Програмування');

INSERT INTO Books (Id, Title, Price, CategoryId, IsDeleted)
VALUES (1, 'Clean Code', 600, 1, 0);

--Завдання 3
UPDATE Books
SET Price = 750
WHERE Title = 'Clean Code';
commit;

--Завдання 4
SELECT b.Title, c.CategoryName
FROM Books b
INNER JOIN Categories c ON b.CategoryId = c.Id;

--Завдання 5
SELECT CategoryId, COUNT(*) AS TotalBooks
FROM Books
GROUP BY CategoryId;

--Завдання 6
UPDATE Books
SET IsDeleted = 1
WHERE Id = 5;
commit;
--hard delete 
DELETE Books 
WHERE ID = 5;
commit;
