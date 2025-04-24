USE BaseballData;

/*
- DB ����

-- �켱 �����ͺ��̽��� ������ �Ѵ�.
-- ���� ) �����ͺ��̽��� Schema(��Ű��) ��� ��


CREATE DATABASE GameDB;

USE GameDB;


-- ���̺� ����(CREATE) / ���� (DROP) / ���� (ALTER)

-- CREATE TABLE ���̺��(���̸� �ڷ��� [DEFAULT �⺻��] [NULL | NOT NULL], ...)

-- �����ο� ���� ���� ����� �� �ڵ�ε� �ۼ��� �����ϴ�!
CREATE TABLE accounts(
	accountId INTEGER NOT NULL,
	accountName VARCHAR(10) NOT NULL,
	coins INTEGER DEFAULT 0,
	createdTime DATETIME
);

SELECT *
FROM accounts;


-- ���̺� ����
	-- �����ؾ���. �������� �����̱⿡ �� �� �����Ǹ� ������ �Ұ�����
DROP TABLE accounts;

-- ���̺� ����(ALTER)

-- ��� �� ���Ǵ°�?
	-- �� �߰�(ADD) / ����(DROP) / ����(ALTER)

-- �߰�
ALTER TABLE accounts
ADD lastEnterTime DATETIME;

-- ����
ALTER TABLE accounts
DROP COLUMN lastEnterTime;

-- ����
ALTER TABLE accounts
ALTER COLUMN accountName VARCHAR(20) NOT NULL;


-- C# class Player() { }
-- List<Player>
-- ����Ʈ�� �����ϸ� �����Ͱ� ���� �� �����ϱ� ����, �������� 100���� ����ִ� �ϸ� �ӵ����鿡�� ������ ��...
-- Dictionary<int, Player>
-- �׷��� � ������ �������� �� �����ϰ� ���ؾ� ��


-- ����(CONSTRAINT) �߰�/����
-- NOT NULL
-- UNIQUE			���� ���� ��ġ�� �ȵȴ� (����ũ �ؾ��Ѵ�)
-- PRIMARY KEY		�����ο��� ���̴� ���� ǥ����. UI�󿡼� ȭ��ǥ Ŭ�� �� SET PRIMARY KEY ������ Ű ����� �޸�.
-- FOREIGN KEY
-- ��������� �ɾ�θ� accountID �� ã�� �� �ٷ� ã�� �� �־ ����, Ű������ ã���� O(1) �ΰ�?
-- ó���� ���踦 ���ϸ� accountId INTEGER NOT NULL PRIMARY KEY, �� ���谡 ����

�Ǵ�

CREATE TABLE accounts(
	accountId INTEGER NOT NULL,
	accountName VARCHAR(10) NOT NULL,
	coins INTEGER DEFAULT 0,
	createdTime DATETIME
	PRIMARY KEY(accountId)
);


-- �����̸Ӹ� Ű ����.. ������ ������ ����Ʈ����Ʈ �̸��� �ʿ���
ALTER TABLE accounts
ADD PRIMARY KEY (accountId);

-- �׷��� �̸��� �ʿ���. �ٷθ����ȵǰ�
ALTER TABLE accounts
ADD CONSTRAINT PK_Account PRIMARY KEY (accountId);

-- �����̸Ӹ� Ű ����, ������ ����Ʈ����Ʈ �̸��� �ʿ���....
ALTER TABLE accounts
DROP CONSTRAINT PK_Account




*/

CREATE DATABASE GameDB;

USE GameDB;


-- ���̺� ����(CREATE) / ���� (DROP) / ���� (ALTER)

-- CREATE TABLE ���̺��(���̸� �ڷ��� [DEFAULT �⺻��] [NULL | NOT NULL], ...)

-- �����ο� ���� ���� ����� �� �ڵ�ε� �ۼ��� �����ϴ�!
CREATE TABLE accounts(
	accountId INTEGER NOT NULL,
	accountName VARCHAR(10) NOT NULL,
	coins INTEGER DEFAULT 0,
	createdTime DATETIME
);

SELECT *
FROM accounts;


-- ���̺� ����
	-- �����ؾ���. �������� �����̱⿡ �� �� �����Ǹ� ������ �Ұ�����
DROP TABLE accounts;

-- ���̺� ����(ALTER)

-- ��� �� ���Ǵ°�?
	-- �� �߰�(ADD) / ����(DROP) / ����(ALTER)

-- �߰�
ALTER TABLE accounts
ADD lastEnterTime DATETIME;

-- ����
ALTER TABLE accounts
DROP COLUMN lastEnterTime;

-- ����
ALTER TABLE accounts
ALTER COLUMN accountName VARCHAR(20) NOT NULL;


-- C# class Player() { }
-- List<Player>
-- ����Ʈ�� �����ϸ� �����Ͱ� ���� �� �����ϱ� ����, �������� 100���� ����ִ� �ϸ� �ӵ����鿡�� ������ ��...
-- Dictionary<int, Player>
-- �׷��� � ������ �������� �� �����ϰ� ���ؾ� ��


-- ����(CONSTRAINT) �߰�/����
-- NOT NULL
-- UNIQUE			���� ���� ��ġ�� �ȵȴ� (����ũ �ؾ��Ѵ�)
-- PRIMARY KEY		�����ο��� ���̴� ���� ǥ����. UI�󿡼� ȭ��ǥ Ŭ�� �� SET PRIMARY KEY ������ Ű ����� �޸�.
-- FOREIGN KEY
-- ��������� �ɾ�θ� accountID �� ã�� �� �ٷ� ã�� �� �־ ����, Ű������ ã���� O(1) �ΰ�?
-- ó���� ���踦 ���ϸ� accountId INTEGER NOT NULL PRIMARY KEY, �� ���谡 ����

-- �����̸Ӹ� Ű ����.. ������ ������ ����Ʈ����Ʈ �̸��� �ʿ���
ALTER TABLE accounts
ADD PRIMARY KEY (accountId);

-- �׷��� �̸��� �ʿ���. �ٷθ����ȵǰ�
ALTER TABLE accounts
ADD CONSTRAINT PK_Account PRIMARY KEY (accountId);

-- �����̸Ӹ� Ű ����, ������ ����Ʈ����Ʈ �̸��� �ʿ���....
ALTER TABLE accounts
DROP CONSTRAINT PK_Account

-- �ش� ������ ���� �� ctrl + L Ű�� ������ Execution plan�� �� �� ����.
-- �����̸Ӹ� Ű�� ���� ��� Ŭ�������� �ε��� �˻��� ����.

-- �����̸Ӹ� Ű�� ���� ��� ���̺� ��ĵ�� ���� ( �Ѽ� �������. ��û ���� ���� )
SELECT *
FROM accounts
WHERE accountId = 1111;

-- �����̸Ӹ�Ű�� ����ϳ� �ƴϳĴ�.
-- List<Account> 
-- Dictionary<int, Account> �� �� ���̳� ���̷� ���� ����