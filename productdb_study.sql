-- 1. 데이터베이스 생성 (DDL: Data Definition Language)
CREATE DATABASE shop;

------------------------------------------------------------

-- 2. 상품 테이블
CREATE TABLE products
(
    product_id      SERIAL          PRIMARY KEY,
    product_name    VARCHAR(20)     NOT NULL,
    category        VARCHAR(30)
);

------------------------------------------------------------

-- 3. 카달로그 테이블 (가격과 재고)
CREATE TABLE catalog
(
    catalog_id          SERIAL          PRIMARY KEY,
    product_id         INT             REFERENCES products (product_id),
    price               NUMERIC(10, 2)  NOT NULL,
    stock               INT             NOT NULL,
    category            VARCHAR(50)
);

-----------------------------------------------------------

-- 4. 장바구니 테이블 (상품 번호와 수량만 간결히 작성)
CREATE TABLE cart
(
    cart_id         SERIAL          PRIMARY KEY,
    product_id      INT             REFERENCES products (product_id),
    quantity        INT             NOT NULL    
);

-----------------------------------------------------------

-- 5. 데이터 입력 예시
INSERT INTO products (product_name, category) VALUES ('무선 이어폰', '전자기기');
INSERT INTO products (product_name, category) VALUES ('유선 헤드폰', '전자기기');

INSERT INTO catalog (product_id, price, stock)  VALUES (1, 59000, 100);
INSERT INTO catalog (product_id, price, stock)  VALUES (2, 29000, 50);

-- 장바구니에 1번 상품을 2개 담았을 때
INSERT INTO cart (product_id, quantity) VALUES (1, 2);

-----------------------------------------------------------
