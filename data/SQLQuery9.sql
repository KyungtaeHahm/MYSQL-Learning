 -- SQL (RDBMS�� �����ϱ� ���� ��ɾ�)
 --  +@ T-SQL
 --			�߰� �а� ������Ʈ  ����
 -- CRUD (Create-Read-Update-Delete)

 -- Read : ������ �������� �� �����͸� �а� �������� ���α׷��� �����ؾ���
 -- ��    �ٸ� ������ �� �� �����ؼ� �����Ҷ��� �ʿ�
 -- ��   DB ���� ��ȹ�� ���� �߿���

 -- AS ��Ī

 SELECT *
 FROM players

 SELECT nameFirst, nameLast, birthYear, birthCountry
 FROM players
 WHERE birthYear = 1974 AND birthCountry != 'USA';

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