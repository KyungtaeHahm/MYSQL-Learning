USE Northwind;

/*
	- Hash Join
	-- �ε����� ���� �� ����!

*/

SELECT * INTO TestOrders FROM Orders;
SELECT * INTO TestCustomers FROM Customers;

SELECT * FROM TestOrders;		-- 830��
SELECT * FROM TestCustomers;	-- 91��

-- HASH�� �̿��� ���
SELECT *
FROM TestOrders AS o
	INNER JOIN TestCustomers AS c
	ON o.CustomerID = c.CustomerID;

-- NL ( inner ���̺� �ε����� ��� ������ �߻�)
SELECT *
FROM TestOrders AS o		-- Outer Table
	INNER JOIN TestCustomers AS c	-- Inner Table // ���� TestCustomers �� �ε����� �� �ɷ��ִ� ����
	ON o.CustomerID = c.CustomerID
	OPTION (FORCE ORDER, LOOP JOIN);

-- Merge (OUTER, INNER ��� SORT �ؾ���. ���ϼ��� ������� ������ MANY TO MANY �� �۾�) - ��ȿ��
SELECT *
FROM TestOrders AS o	
	INNER JOIN TestCustomers AS c	
	ON o.CustomerID = c.CustomerID
	OPTION (FORCE ORDER, MERGE JOIN);

-- HASH
	-- ���� ���� HashTable��!
SELECT *
FROM TestOrders AS o
	INNER JOIN TestCustomers AS c
	ON o.CustomerID = c.CustomerID;

	-- ������ ��� --

-- Hash ������ Ư¡

-- 1) ������ �ʿ����� �ʴ� -> �����Ͱ� �ʹ� ���Ƽ� Merge�� �δ㽺���� ��, Hash�� ����� �� �� ����
-- 2) �ε��� ������ ������ ���� �ʴ´� �ڡڡڡڡ�
-- �� NL / Merge�� ���� Ȯ���� ����!
-- �� HashTable ����� ����� �����ϸ� �� ��! (���� �󵵰� ������ -> �ᱹ Index �߰����༭ �����ؾ� �� ���� �ִ�.)
-- 3) ���� ������ ���ַ� ������� �ʴ´�.
-- 4) �����Ͱ� ���� ���� HashTable�� ����� ���� �����ϴ�