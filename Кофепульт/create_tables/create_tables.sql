CREATE TABLE Coffee_shop
(
    CSId           serial PRIMARY KEY,
    Name           varchar(255),
    Address        varchar(255),
    Phonenumber    varchar(255),
    ShiftManagerId int
);

CREATE TABLE Barista
(
    Login       varchar(255),
    Password    varchar(255),
    Name        varchar,
    TimeShift   time,
    CSId        int,
    Phonenumber varchar(255),
    MailAdress  varchar(255),
    BarId       serial PRIMARY KEY,
    CONSTRAINT fk_Coffee_shop
        FOREIGN KEY (CSId)
            REFERENCES Coffee_shop (CSId)
);

CREATE TABLE Dishes
(
    DrinkType varchar(255),
    DishType  varchar(255),
    Adds      varchar(255),
    Name      varchar(255),
    PriceIn   float,
    PriceOut  float,
    DishId    serial PRIMARY KEY
);

CREATE TABLE Client
(
    Address     varchar(255),
    Name        varchar(255),
    Birthday    date,
    PhoneNumber varchar(255),
    ClId        serial PRIMARY KEY,
    Vip         bool default false
);

CREATE TABLE Order1
(
    CSId  int,
    BarId int,
    OrdId serial PRIMARY KEY,
    ClId  int,
    Paid  bool default false,
    CONSTRAINT fk_Coffee_shop
        FOREIGN KEY (CSId)
            REFERENCES Coffee_shop (CSId),
    CONSTRAINT fk_Barista
        FOREIGN KEY (BarId)
            REFERENCES Barista (BarId),
    CONSTRAINT fk_Client
        FOREIGN KEY (ClId)
            REFERENCES Client (ClId)
);

CREATE TABLE DishOrd
(
    DishOrdId serial PRIMARY KEY,
    Timestamp timestamp,
    DishId    int,
    OrdId     int,
    CSId      int,
    Amount    int default 1,
    CONSTRAINT fk_Dishes
        FOREIGN KEY (DishId)
            REFERENCES Dishes (DishId),
    CONSTRAINT fk_Order1
        FOREIGN KEY (OrdId)
            REFERENCES Order1 (OrdId),
    CONSTRAINT fk_Coffee_shop
        FOREIGN KEY (CSId)
            REFERENCES Coffee_shop (CSId)
);

CREATE TABLE Admin
(
    AdminId  serial PRIMARY KEY,
    Login    varchar(255),
    Password varchar(255),
    CSId     int,
    DishId   int,
    BarId    int,
    CONSTRAINT fk_Coffee_shop
        FOREIGN KEY (CSId)
            REFERENCES Coffee_shop (CSId),
    CONSTRAINT fk_Dishes
        FOREIGN KEY (DishId)
            REFERENCES Dishes (DishId),
    CONSTRAINT fk_Barista
        FOREIGN KEY (BarId)
            REFERENCES Barista (BarId)
);

CREATE TABLE Menu
(
    CSId   int,
    DishId int,
    PRIMARY KEY(CSId, DishId),
    CONSTRAINT fk_Coffee_shop
        FOREIGN KEY (CSId)
            REFERENCES Coffee_shop (CSId),
    CONSTRAINT fk_Dishes
        FOREIGN KEY (DishId)
            REFERENCES Dishes (DishId)
);
