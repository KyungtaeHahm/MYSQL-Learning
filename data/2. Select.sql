 -- SQL (RDBMS�� �����ϱ� ���� ��ɾ�)
 --  +@ T-SQL
 --			�߰� �а� ������Ʈ  ����
 -- CRUD (Create-Read-Update-Delete)

 -- Read : ������ �������� �� �����͸� �а� �������� ���α׷��� �����ؾ���
 -- ��    �ٸ� ������ �� �� �����ؼ� �����Ҷ��� �ʿ�
 -- ��   DB ���� ��ȹ�� ���� �߿���

 -- AS ��Ī

  -- ����� SELECT�� �����ΰ� ����.
 -- FROM å�󿡼� 
 -- SELECT ~�� ������ּ���

 -- ;�� ������ �ǹ��ϴ°ǰ�?
 -- select - from - where ������� �������. ���� �ٸ��� �ϸ� �ȵ�.
 -- �ڵ� ���� ������
 -- FROM å�󿡼�
 -- WHERE ������ ��ü��
 -- SELECT ������ּ���

 -- �Ϻκи� ���۽�Ű�� �ʹٸ� �ش� ������ �巡���ϰ� F5�� ������ȴ�.

 -- SQL ��ɾ�� �빮��,�ҹ���, ��� �ᵵ ���ۿ� ������ ����. ������ ���� ���� �빮�ڷ� �ۼ� SELECT, select, SelecT 

 -- WHERE birthYear = 1974 AND birthCountry != 'USA'; AND OR �� �����
  -- AND���� OR������ �켱������ ����
 -- ������ ����.							 WHERE birthYear = 1974 OR (birthCountry != 'USA' AND weight > 185);
 -- �׷��⿡ ���н� ��������� ��ȣ�� �ۼ�

 -- NULL ��
 -- ���� ����ִ� ����� �� ���̶�� DeathYear�� Null �� ����� ���� ��.
 --  WHERE deathYear != NULL �̶�� �ϸ� �ȵ�. NULL�� ���� ���̶�...
 --  WHERE deathYear IS NULL / IS NOT NULL �̶�� �ؾ� �����۵�!

  -- WHERE birthCity Like 'New Yor_'; 
  -- ���� ��Ī % : ������ ���ڿ�,  _ : ������ ���� 1��

  -- DB���� �ٷ� Delete�� �ϴ� �Ծƴ϶� �տ� Deleted_�� ���̴� �ɷ� �����ؼ� DB �˻� �ȵǰ���. �� ������ ���߿� �Ǽ���� ������ ���Ѵٸ�? ���� ���ֱ� ���� DELETE_ ã�� ������Ŵ

 SELECT *
 FROM players
 WHERE birthCity Like 'New Yor_';

 

 SELECT nameFirst, nameLast, birthYear, birthCountry
 FROM players
 WHERE birthYear = 1974 OR birthCountry != 'USA' AND weight > 185;


