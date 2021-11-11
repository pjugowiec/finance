CREATE OR REPLACE FUNCTION add_currency(id bigint, currencyName varchar(80), currencyShortName varchar(40)) RETURNS VOID as
'
BEGIN
    INSERT INTO currencies (id, short_name, "name")
        select id, currencyShortName, currencyName
        WHERE NOT EXISTS (
                SELECT * FROM currencies WHERE short_name = currencyShortName);
end
' LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION add_category(categoryName varchar(255)) RETURNS VOID as '
BEGIN
    INSERT INTO categories (id, value, "from", "to")
        select nextval(''categories_seq''), categoryName, now(), null
        WHERE NOT EXISTS (
                SELECT * FROM categories WHERE value = categoryName);
end
' LANGUAGE plpgsql;