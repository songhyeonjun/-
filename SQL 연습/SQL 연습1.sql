select * from cslee.tb_accnt;
select * from cslee.tb_cust;
select * from cslee.tb_emp;
select * from cslee.tb_prod;
select * from cslee.tb_tran;
select * from cslee.tb_trcd;

SELECT EMP_NAME ����̸�, ORG_CD �Ҽ�, position ����, SALARY ����
FROM cslee.TB_EMP
WHERE POSITION ='�븮';

select count(*) from cslee.tb_emp;

SELECT EMP_NAME ����̸�, ORG_CD �Ҽ�, POSITION ����, SALARY ����
FROM cslee.TB_EMP;

SELECT EMP_NAME ����̸�, ORG_CD �Ҽ�, POSITION ����, SALARY ����
FROM cslee.TB_EMP
WHERE SALARY >= 50000000 ;

SELECT EMP_NAME ����̸�, ORG_CD �Ҽ�, POSITION ��å, SALARY ����
FROM cslee.TB_EMP
WHERE (ORG_CD = '08' OR ORG_CD = '09' OR ORG_CD = '10')
AND POSITION='���'
AND SALARY >= 40000000
AND SALARY <= 50000000;

SELECT EMP_NAME ����̸�, ORG_CD �Ҽ�, POSITION ��å, SALARY ����
FROM cslee.TB_EMP
WHERE ORG_CD IN ( '08', '09', '10')
AND POSITION='���'
AND SALARY BETWEEN 40000000 AND 50000000;

SELECT EMP_NAME ����̸�, SALARY ����
FROM cslee.TB_EMP
WHERE SALARY BETWEEN 40000000 AND 50000000;

SELECT EMP_NAME, ORG_CD, POSITION
FROM cslee.TB_EMP
WHERE ORG_CD IN ('06','07')
AND POSITION IN ('����','����');

SELECT EMP_NAME, ORG_CD, POSITION
FROM cslee.TB_EMP
WHERE (ORG_CD, POSITION) 
IN (('06','����'), ('07','����'));

SELECT EMP_NAME ����̸�, ORG_CD ���ڵ�, POSITION ��å, ENT_DATE 
�Ի�����
FROM cslee.TB_EMP
WHERE EMP_NAME LIKE '��%';

SELECT EMP_NAME ����̸�, ORG_CD ���ڵ�, POSITION ��å, ENT_DATE 
�Ի�����
FROM cslee.TB_EMP
WHERE EMP_NAME LIKE '_��%';

SELECT EMP_NAME ����̸�, ORG_CD �Ҽ�, POSITION ��å, GENDER ����
FROM cslee.TB_EMP
WHERE GENDER = NULL;

SELECT EMP_NAME ����̸�, ORG_CD �Ҽ�, POSITION ��å, GENDER ����
FROM cslee.TB_EMP
WHERE GENDER IS NULL;

SELECT EMP_NAME ����̸�, ORG_CD �Ҽ�, POSITION ��å
FROM cslee.TB_EMP
WHERE ORG_CD = '10'
AND NOT POSITION = '����';

SELECT EMP_NAME ����̸�, ORG_CD �Ҽ�, POSITION ��å
FROM cslee.TB_EMP
WHERE ORG_CD IS NOT NULL;

SELECT ORG_CD �μ�, EMP_NAME ����̸�, ENT_DATE �Ի���
FROM cslee.TB_EMP
ORDER BY ORG_CD, ENT_DATE DESC;

SELECT EMP_NAME, EMP_NO, ORG_CD
FROM cslee.TB_EMP
ORDER BY EMP_NAME ASC, EMP_NO ASC, EMP_NO DESC;

SELECT EMP_NAME ����̸�, EMP_NO �����ȣ, ORG_CD �μ��ڵ�
FROM cslee.TB_EMP
ORDER BY ����̸�, �����ȣ, �μ��ڵ� DESC;

SELECT EMP_NAME, EMP_NO, ORG_CD
FROM cslee.TB_EMP
ORDER BY 1 ASC, 2 ASC, 3 DESC;

SELECT EMP_NAME ����̸�, EMP_NO �����ȣ, ORG_CD �μ��ڵ�
FROM cslee.TB_EMP
ORDER BY EMP_NAME, 2, �μ��ڵ� DESC;
q			