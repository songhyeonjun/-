select * from cslee.tab1 t;

SELECT EMP_NAME ����̸�, ORG_CD �Ҽ�, POSITION ����, SALARY ����
FROM cslee.TB_EMP
WHERE POSITION ='�븮';

-- ���� �ð� ��ȸ�ϴ� ���
select now();

-- ����ð����� �Ϸ� �� ��¥ ���ϴ� ���
select now(), now()::date - '1 day' ::interval;

-- ���� Ÿ���� ��ȸ�ϴ� ���
show timezone;

--�ý��� ���ڸ� ��ȸ�ϴ� ���
select current_date, current_time, timeofday();
select now(), current_timestamp, timestamp 'now';

-- ��¥���� ������ �����ϴ� ��� (date_part, extract, date_trunc ���� ����� ��� �ٸ��� ���غ�����.)
select date_part('year', timestamp '2020-07-30 20:38:40');
select date_part('year', current_timestamp);
select extract('isoyear' from date '2006-01-01');
select extract('isoyear' from current_timestamp);
select date_trunc('year', timestamp '2020-07-30 20:38:40');
select date_trunc('year', current_timestamp);

-- ��¥���� ���� �����ϴ� ��� (date_part, extract, date_trunc ���� ����� ��� �ٸ��� ���غ�����.)
select date_part('month', timestamp '2020-07-30 20:38:40');

select date_part('month', current_timestamp);
select extract('month' from timestamp '2020-07-30 20:38:40');
select extract('month' from interval '2 years 3 months');
select extract('month' from interval '2 years 13 months');
select date_trunc('month', timestamp '2020-07-30 20:38:40'); -- �������� ������ �������� �ʱ�ȭ�� ���ߴ� �����

-- ��¥���� ���� �����ϴ� ���
select date_part('day', timestamp '2020-07-30 20:38:40');
select date_trunc('day', timestamp '2020-07-30 20:38:40'); -- ���ڱ����� ������ �������� �ʱ�ȭ�� �´��� �����

-- �ð����� �ø� �����ϴ� ���
select date_part('hour', timestamp '2013-07-30 20:38:40');
select date_part('hour', interval '4 hours 3 minutes');
select date_trunc('hour', timestamp '2020-07-30 20:38:40');

-- �ð����� ���� �����ϴ� ���
select date_part('minute', timestamp '2020-07-30 20:38:40');
select date_trunc('minute', timestamp '2020-07-30 20:38:40');

-- �ð����� �ʸ� �����ϴ� ���
select date_part('second', timestamp '2013-07-30 20:38:40');
select extract('second' from time '17:12:28.5');
select date_trunc('second', timestamp '2013-07-30 20:38:40');

-- ���� p.154
-- �ּ� ���ϱ�
SELECT EMP_NAME, to_char((current_timestamp - ENT_DATE),'W') WEEKS
FROM cslee.TB_EMP
WHERE ORG_CD = '10';

-- to_Char ����
select emp_name, ent_date,
to_char(ent_date,'yyyy') �Ի��,
to_char(ent_date,'MM') �Ի��,
to_char(ent_date,'DD') �Ի���
from cslee.tb_emp;

-- Extract ����
select emp_name, ent_date,
extract('year' from ent_date) �Ի��,
extract('month' from ent_date) �Ի��,
extract('day' from ent_date) �Ի���
from cslee.tb_emp;


select extract ('year' from timestamp '0001-01-01 BC');

-- ��ȯ�Լ�(����� ������ ���� ��ȯ) to_date, to_number, to_timestamp, cast
select to_date('05 Dec 2000', 'DD Mon YYYY');
select to_number('12,454.8-', '99G999D9S');
select to_timestamp('05 Dec 2000', 'DD Mon YYYY');

-- ��ȯ�Լ� ��ü (��) ���� p.158
SELECT CAST(123.4 AS VARCHAR(10)), 
CAST('123.5' AS NUMERIC), 
CAST(1234.5678 AS DEC(6,2)), 
CAST(CURRENT_TIMESTAMP AS DATE), 
TO_CHAR(CURRENT_TIMESTAMP, 'YYYY-MM-DD HH24:MI:SS'), 
TO_CHAR(1234.56, 'L9,999.99'), 
TO_NUMBER('$12,345', '$99,999'), 
TO_DATE('2014/03/01 21:30:18','YYYY/MM/DD HH24:MI:SS'), 
TO_TIMESTAMP('2014/03/01 21:30:18','YYYY/MM/DD HH24:MI:SS');

-- Case ǥ�� ����, ���� p.158
SELECT emp_name,
case when salary > 50000000
then salary
else 50000000
end as revised_salary
FROM cslee.tb_emp;

-- ���� p.159 �ǽ�
select org_name,
case org_name
when '����1��' then '����'
when '����2��' then '����'
when '����3��' then '����'
when '�濵������' then '����'
else '����'
end as AREA
from cslee.tb_org;

-- ���� p.160
-- case ��
SELECT EMP_NAME,
CASE WHEN SALARY >= 90000000 THEN 'HIGH'
WHEN SALARY >= 60000000 THEN 'MID'
ELSE 'LOW'
END AS SALARY_GRADE
FROM cslee.TB_EMP;

-- ��ø Case��
SELECT EMP_NAME, SALARY,
CASE WHEN SALARY >= 50000000
THEN 20000000
ELSE (CASE WHEN SALARY >= 20000000
THEN 10000000
ELSE SALARY * 0.5
END)
END as BONUS
FROM cslee.TB_EMP;

-- NULL���� �Լ� p.162
-- coalesce �Լ�
SELECT EMP_NAME, position,
-- NVL(POSITION,'����'), -- oracle null üũ�Լ�
coalesce(POSITION,'����') -- null üũ�Լ�
from cslee.TB_EMP;

-- case�Լ�
SELECT EMP_NAME, POSITION,
CASE WHEN POSITION IS NULL
THEN '����'
ELSE POSITION
END AS ��å
FROM cslee.TB_EMP;

--NULL�� ������ p.163
select coalesce(salary, 0) SAL
from cslee.tb_emp
where emp_name='������';

SELECT MAX(salary) SAL
FROM cslee.tb_emp
WHERE emp_name='������';

SELECT coalesce(MAX(salary), 9999) SAL
FROM cslee.tb_emp
WHERE emp_name='������';

--p. 167
SELECT COUNT(*) "��ü�Ǽ�"
, COUNT(POSITION) "��å�Ǽ�"
, COUNT(DISTINCT POSITION) "��å����"
, MAX(SALARY) "�ִ�"
, MIN(SALARY) "�ּ�"
, AVG(SALARY) "���"
FROM cslee.TB_EMP;

-- Group by ��
-- p. 169
SELECT POSITION "��å",
COUNT(*) "�ο���",
MIN(SALARY) "�ּ�",
MAX(SALARY) "�ִ�",
AVG(SALARY) "���"
FROM cslee.TB_EMP
GROUP BY POSITION;

-- Having ��
SELECT ORG_CD "�μ�",
COUNT(*) "�ο���",
AVG( SALARY) "���"
FROM cslee.TB_EMP
GROUP BY ORG_CD
HAVING COUNT(*) >= 4;

SELECT ORG_CD "�μ�",
MAX(SALARY) "�ִ�"
FROM cslee.TB_EMP
GROUP BY ORG_CD
HAVING MIN(SALARY) <= 40000000;

SELECT ORG_CD, POSITION, AVG( SALARY)
FROM cslee.TB_EMP
WHERE POSITION IN ('����','�븮','���')
GROUP BY ORG_CD, POSITION;

SELECT ORG_CD
, AVG(CASE POSITION WHEN '����' THEN SALARY END) "����"
, AVG(CASE POSITION WHEN '�븮' THEN SALARY END) "�븮"
, AVG(CASE POSITION WHEN '���' THEN SALARY END) "���"
FROM cslee.TB_EMP
WHERE POSITION IN ('����','�븮','���')
GROUP BY ORG_CD;

SELECT ORG_CD,
sum(COALESCE((case position WHEN '����' THEN 1 ELSE 0 END),0)) "����",
SUM(COALESCE((case position WHEN '����' THEN 1 ELSE 0 END),0)) "����",
SUM(COALESCE((case position WHEN '�븮' THEN 1 ELSE 0 END),0)) "�븮",
SUM(COALESCE((case position WHEN '���' THEN 1 ELSE 0 END),0)) "���"
from cslee.tb_emp
group BY ORG_CD;

SELECT ORG_CD,
COALESCE (SUM(case position WHEN '����' THEN 1 END),0) �����塱,
COALESCE (SUM(case position WHEN '����' THEN 1 END),0) �����塱,
COALESCE (SUM(case position WHEN '�븮' THEN 1 END),0) ���븮��,
COALESCE (SUM(case position WHEN '���' THEN 1 END),0) �������
from cslee.TB_EMP
GROUP BY ORG_CD;

-- Equi Join �ǽ�
-- [����] ��� ���̺�� ���� ���̺��� ���� SQL
SELECT TB_EMP.EMP_NAME, TB_EMP.ORG_CD
, TB_ORG.ORG_CD, TB_ORG.ORG_NAME
FROM cslee.TB_EMP, cslee.TB_ORG
WHERE cslee.TB_EMP.ORG_CD = cslee.TB_ORG.ORG_CD;

-- [����] ����̸�, �ҼӺμ��ڵ�, �μ���(������), ��å�� ����Ͻÿ�
SELECT TB_EMP.EMP_NO,
TB_EMP.EMP_NAME,
TB_EMP.ORG_CD,
TB_ORG.ORG_NAME,
TB_EMP.POSITION
FROM cslee.TB_EMP,
cslee.TB_ORG
WHERE cslee.TB_EMP.ORG_CD = cslee.TB_ORG.ORG_CD; -- �����÷�

-- Alias ���
SELECT E.EMP_NO,
E.EMP_NAME,
E.ORG_CD,
O.ORG_NAME,
E.POSITION
FROM cslee.TB_EMP AS E,
cslee.TB_ORG AS O
WHERE E.ORG_CD = O.ORG_CD -- �����÷� ����
AND E.POSITION = '����' -- ��������
ORDER BY O.ORG_NAME; -- ����

-- [����] ���¹�ȣ, ����, ��ǰ��, ���ݾ�, �����ڸ��� ����Ѵ�.
SELECT A.ACCNO,
C.CUST_NAME,
P.PROD_NAME,
A.CONT_AMT,
E.EMP_NAME
FROM cslee.TB_ACCNT A, cslee.TB_CUST C, cslee.TB_PROD P, cslee.TB_EMP E
WHERE A.CUST_NO = C.CUST_NO
AND A.PROD_CD = P.PROD_CD
AND A.MANAGER = E.EMP_NO;

-- [����]����� �޿��� ��� ��޿� ���ϴ��� �˰� �ʹٴ� �䱸���׿� ���� Non EQUI JOIN
SELECT E.EMP_NAME �����,
E.SALARY ����,
S.GRADE �޿����
FROM cslee.TB_EMP E, cslee.TB_GRADE S
where E.SALARY
BETWEEN S.LOW_SAL AND S.HIGH_SAL;

-- ǥ�� ����(ANSI ǥ����, ANSI ǥ�������� ������ ���� ����)
-- Inner Join
--[����] ��� ��ȣ�� ��� �̸�, �ҼӺμ� �ڵ�� �ҼӺμ� �̸��� ã�ƺ���.
--(1) WHERE �� JOIN ����
SELECT EMP.EMP_NO, EMP.EMP_NAME, ORG.ORG_NAME
FROM cslee.TB_EMP EMP, cslee.TB_ORG ORG
WHERE EMP.ORG_CD = ORG.ORG_CD;

--(2) FROM �� JOIN ����
SELECT EMP.EMP_NO, EMP.EMP_NAME, ORG.ORG_NAME
FROM cslee.TB_EMP EMP
INNER JOIN cslee.TB_ORG ORG
ON EMP.ORG_CD = ORG.ORG_CD;

--(3) INNER Ű���� ����
SELECT EMP.EMP_NO, EMP.EMP_NAME, ORG.ORG_NAME
FROM cslee.TB_EMP EMP
JOIN cslee.TB_ORG ORG
ON EMP.ORG_CD = ORG.ORG_CD;

-- FROM �� JOIN ����
--[����] ���� ���̺��� ���¹�ȣ��, ����ȣ, ���� ���� �����̺�� �����Ͽ� ã�ƺ���.
SELECT ACC.ACCNO, ACC.CUST_NO, CUST.CUST_NAME
FROM cslee.TB_ACCNT ACC
INNER JOIN cslee.TB_CUST CUST
ON (CUST.CUST_NO = ACC.CUST_NO);

--FROM �� JOIN ����
--[����] �����ڵ� 10�� �μ��� �Ҽ� ��� �̸� �� �Ҽ� �μ� �ڵ�, �μ� �ڵ�, �μ� �̸��� ã�ƺ���.
SELECT E.EMP_NAME, E.ORG_CD, O.ORG_CD, O.ORG_NAME
FROM cslee.TB_EMP E
JOIN cslee.TB_ORG O
ON (E.ORG_CD = O.ORG_CD)
WHERE E.ORG_CD = '10';

-- ON������- ��������
-- (1) WHERE �� JOIN ����
SELECT A.ACCNO ���¹�ȣ, C.CUST_NAME ����, P.PROD_NAME ��ǰ��
, A.CONT_AMT ���ݾ�, E.EMP_NAME ����ڸ�
FROM cslee.TB_ACCNT A, cslee.TB_CUST C, cslee.TB_PROD P, cslee.TB_EMP E
WHERE A.CUST_NO = C.CUST_NO
AND A.PROD_CD = P.PROD_CD
AND A.MANAGER = E.EMP_NO;

-- (2) ON �� JOIN ����
SELECT A.ACCNO ���¹�ȣ, C.CUST_NAME ����, P.PROD_NAME ��ǰ��
, A.CONT_AMT ����ȣ, E.EMP_NAME ����ڸ�
FROM cslee.TB_ACCNT A
INNER JOIN cslee.TB_CUST C ON A.CUST_NO = C.CUST_NO
INNER JOIN cslee.TB_PROD P ON A.PROD_CD = P.PROD_CD
INNER JOIN cslee.TB_EMP E ON A.MANAGER = E.EMP_NO;

-- CROSS ����(��� �����Ͱ� ������ �̸� �����غ�����)
select count(emp_name) from cslee.tb_emp;

select count(org_name) from cslee.tb_org;

SELECT E.EMP_NAME, O.ORG_NAME
FROM cslee.TB_EMP E CROSS JOIN cslee.TB_ORG O
ORDER BY EMP_NAME;

select count(e.emp_name)
FROM cslee.TB_EMP E CROSS JOIN cslee.TB_ORG O;

-- [����] �����߿� ���� �μ������� �ȵ� ����� �ִ�. ���(TB_EMP)�� ����(TB_ORG)�� JOIN�ϵ� �μ�������
-- �ȵ� ����� ������ ���� ����ϵ��� �Ѵ�.
SELECT E.EMP_NO ���, E.EMP_NAME �����,
E.POSITION ��å, O.ORG_NAME �μ���
FROM cslee.TB_EMP E LEFT OUTER JOIN cslee.TB_ORG O
ON E.ORG_CD = O.ORG_CD
WHERE E.POSITION = '���';

-- Right Outer Join
--[����] ���� �������� LEFT JOIN�� OUTER JOIN���� ǥ���Ѵ�.
SELECT E.EMP_NO ���, E.EMP_NAME �����, E.POSITION ��å, O.ORG_NAME �μ���
FROM cslee.TB_ORG O RIGHT OUTER JOIN cslee.TB_EMP E
ON E.ORG_CD = O.ORG_CD
WHERE E.POSITION = '���';

-- Full Outer Join
SELECT A.ORG_CD, A.ORG_NAME, B.ORG_CD, B.ORG_NAME
FROM cslee.TB_ORG A FULL OUTER JOIN cslee.TB_ORG B
ON A.ORG_CD=B.ORG_CD;

SELECT A.ORG_CD, A.ORG_NAME, B.ORG_CD, B.ORG_NAME
FROM cslee.TB_ORG A LEFT OUTER JOIN cslee.TB_ORG B
ON A.ORG_CD = B.ORG_CD
UNION
SELECT A.ORG_CD, A.ORG_NAME, B.ORG_CD, B.ORG_NAME
from cslee.TB_ORG A RIGHT OUTER JOIN cslee.TB_ORG B
ON A.ORG_CD = B.ORG_CD;