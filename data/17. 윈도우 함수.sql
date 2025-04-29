USE BaseballData;

-- �ü���� �����찡 �ƴ�.
-- ����� ���� ������ �������, �� �ະ�� ����� �ؼ� ��Į��(���� ����)���� ����ϴ� �Լ�

-- ������ GROUPING �̶� ���
-- SUM, COUNT, AVG ���� �Լ�

SELECT *
FROM salaries
ORDER BY salary DESC;


-- GROUPING
SELECT playerID, MAX(salary)	-- �׷����� �׷��� �ϴ� �Լ����� �����Լ� ���ܴ� ���� ����.
FROM salaries
GROUP BY playerID
ORDER BY MAX(salary) DESC

-- �̷��� ������ Ŀ���Ѱ� �������Լ�

-- ~OVER([PARTITION] [ORDER BY] [ROWS])	

-- ��ü �����͸� ���� ������ �����ϰ�, ���� ǥ��

SELECT *,		-- OVER�� ��������, ���ļ����� �������
	ROW_NUMBER() OVER (ORDER BY salary DESC),	-- ����1���� ���� ��� �������� ���ڸ� �ű� ��#��ȣ
	RANK() OVER (ORDER BY salary DESC),			-- ��ŷ. ���� 1���� ���� 1���̶����.. �� ���� ����� ������ �ο������� 3�����...
	DENSE_RANK() OVER (ORDER BY salary DESC),	-- ��ŷ. ���� 1�� �ڿ� ���� ����� 2��.. ���� �����ϰ�� ����2��.
	NTILE(100) OVER (ORDER BY salary DESC)		--  ���� �� %����
FROM salaries;

-- playerID �� ������ ���� �ϰ� �ʹٸ�...
SELECT *,
	RANK() OVER (PARTITION BY playerID ORDER BY salary DESC)
FROM salaries
ORDER BY PlayerID;


-- LAG (�ٷ� ����), LEAD (�ٷ� ����)	, �������� �������� �˾ƾ� �� ��? ������
SELECT *,
	RANK() OVER (PARTITION BY playerID ORDER BY salary DESC),
	LAG(salary) OVER (PARTITION BY playerID ORDER BY salary DESC) AS prevSalary,
	LEAD(salary) OVER (PARTITION BY playerID ORDER BY salary DESC) AS nextSalary
FROM salaries
ORDER BY PlayerID;

-- FIRST_VALUE, LAST_VALUE
-- ���⼭ rows�� Ȱ�� ����. �׳� �ۼ��ϸ� ���� �Ѱ�. �ΰ�, ������ �������� �����ؼ� �ּ� �ִ� ������ �̻��ϰ� ����.  
-- FRAME : FIRST~CURRENT

SELECT *, 
	RANK() OVER (PARTITION BY playerID ORDER BY salary DESC),
	FIRST_VALUE(salary) OVER (PARTITION BY playerID 
								ORDER BY salary DESC
								ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW	-- ��ó������ ��������� ����
								) AS best,
	LAST_VALUE(salary) OVER (PARTITION BY playerID 
								ORDER BY salary DESC
								ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
								
								) AS worst
FROM salaries
ORDER BY PlayerID;
