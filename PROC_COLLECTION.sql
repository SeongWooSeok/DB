/*
    COLLECTION �÷���
    ������ Ÿ��(�迭)
    ���� ������ Ÿ���� ���� ��ҷ� ����
    ���� ROW�� ���� �� ����(TABLE)
    1.���� ���� �迭(Variable size array(VARRAY))
        TYPE [Ÿ�Ը�] IS {VARRAY|VARYING ARRAY}(ũ��) OF ��� ������ Ÿ�� [NOTNULL];
        ����ÿ� �迭�� ��ü ũ�⸦ ���.
        ������� ������.
    2. ��ø ���̺�(NESTED TABLE)
        TYPE [Ÿ�Ը�] IS TABLE OF ��ҵ����� Ÿ�� [NOT NULL];
        ũ�� ���� ���ʿ�� ũ�� ������ ����.
        ������� ������ �ʿ����
    3.���� �迭(ASSOCIATIVE ARRAY(INDEX-BY TABLE))
        TYPE [Ÿ�Ը�] IS TABLE OF ��ҵ����� Ÿ�� [NOT NULL]
            INDEX BY[PLS_INTEGER|BINARY_INTEGER|VARCHAR2(ũ��)];
        Ű�� ���� ������ Ÿ��(HASH MAP�� ������ ����)
        Ű -> INDEX, 
*/