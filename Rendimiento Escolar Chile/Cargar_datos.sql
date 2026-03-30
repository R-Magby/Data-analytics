BULK INSERT Registro
FROM 'C:\datos\Numeric.csv'
WITH (
    FIELDTERMINATOR = '|',
    ROWTERMINATOR = '0x0A',
    FIRSTROW = 2,
    CODEPAGE = '65001',
    TABLOCK
);

BULK INSERT Keys
FROM 'C:\datos\Llave.csv'
WITH (
    FIELDTERMINATOR = '|',
    ROWTERMINATOR = '0x0A',
    FIRSTROW = 2,
    CODEPAGE = '65001',
    TABLOCK
);

BULK INSERT REGION
FROM 'C:\datos\Cod_reg.csv'
WITH (
    FIELDTERMINATOR = '|',
    ROWTERMINATOR = '0x0A',
    FIRSTROW = 2,
    CODEPAGE = '65001',
    TABLOCK
);

