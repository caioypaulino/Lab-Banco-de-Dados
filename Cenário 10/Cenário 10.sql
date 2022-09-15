-- Tabela Fornecedores --
CREATE TABLE fornecedores ( 
    for_id                  NUMBER(6) NOT NULL, 
    for_nome                VARCHAR2(255) NOT NULL, 
    for_logradouro          VARCHAR2(60) NOT NULL, 
    for_numero              NUMBER(4) NOT NULL, 
    for_complemento         VARCHAR2(20) NOT NULL, 
    for_bairro              VARCHAR2(60) NOT NULL, 
    for_cidade              VARCHAR2(30) NOT NULL, 
    for_estado              VARCHAR2(20) NOT NULL, 
    for_cep                 NUMBER(8) NOT NULL, 
    for_telefone_fixo       NUMBER(10), 
    for_telefone_movel      NUMBER(11), 
    for_email               VARCHAR2(255)
);

-- Tabela Historiamento Fornecedores --
CREATE TABLE h_fornecedores ( 
    hfor_id                 NUMBER(6) NOT NULL, 
    hfor_nome               VARCHAR2(255) NOT NULL, 
    hfor_logradouro         VARCHAR2(60) NOT NULL, 
    hfor_numero             NUMBER(4) NOT NULL, 
    hfor_complemento        VARCHAR2(20) NOT NULL, 
    hfor_bairro             VARCHAR2(60) NOT NULL, 
    hfor_cidade             VARCHAR2(30) NOT NULL, 
    hfor_estado             VARCHAR2(20) NOT NULL, 
    hfor_cep                NUMBER(8) NOT NULL, 
    hfor_telefone_fixo      NUMBER(10), 
    hfor_telefone_movel     NUMBER(11), 
    hfor_email              VARCHAR2(255),
    hfor_dt_entrada         DATE
);

-- Tabela Tipos --
CREATE TABLE tipos (  
    tip_id                  NUMBER(6) NOT NULL, 
    tip_nome                VARCHAR2(255) NOT NULL
);

-- Tabela Historiamento Tipos -- 
CREATE TABLE h_tipos (  
    htip_id                 NUMBER(6) NOT NULL, 
    htip_nome               VARCHAR2(255) NOT NULL,
    htip_dt_entrada         DATE
);

-- Tabela Materiais --
CREATE TABLE materiais ( 
    mat_id                  NUMBER(6) NOT NULL, 
    mat_nome                VARCHAR2(255) NOT NULL, 
    mat_preco               NUMBER(8, 2) NOT NULL, 
    mat_quantidade          NUMBER NOT NULL,
    tipos_tip_id            NUMBER(6) NOT NULL
);

-- Tabela Historiamento Materiais --
CREATE TABLE h_materiais ( 
    hmat_id                 NUMBER(6) NOT NULL, 
    hmat_nome               VARCHAR2(255) NOT NULL, 
    hmat_preco              NUMBER(8, 2) NOT NULL, 
    hmat_quantidade         NUMBER NOT NULL,
    htipos_tip_id           NUMBER(6) NOT NULL,
    hmat_dt_entrada         DATE
);

-- Tabela Registros --
CREATE TABLE registros ( 
    reg_id                  NUMBER(6) NOT NULL, 
    reg_data_aquisicao      DATE NOT NULL,  
    reg_quantidade          NUMBER NOT NULL,
    materiais_mat_id        NUMBER(6) NOT NULL,
    fornecedores_for_id     NUMBER(6) NOT NULL
);

-- Tabela Historiamento Registros --
CREATE TABLE h_registros ( 
    hreg_id                 NUMBER(6) NOT NULL, 
    hreg_data_aquisicao     DATE NOT NULL,  
    hreg_quantidade         NUMBER NOT NULL,
    hmateriais_mat_id       NUMBER(6) NOT NULL,
    hfornecedores_for_id    NUMBER(6) NOT NULL,
    hreg_dt_entrada         DATE
);

-- Tabela Funcionarios --
CREATE TABLE funcionarios ( 
    fun_id                  NUMBER(6) NOT NULL, 
    fun_matricula           NUMBER(6) NOT NULL, 
    fun_primeiro_nome       VARCHAR2(15) NOT NULL, 
    fun_nome_meio           VARCHAR2(30), 
    fun_sobrenome           VARCHAR2(15) NOT NULL, 
    fun_data_contratacao    DATE NOT NULL
);

-- Tabela Historiamento Funcionarios --
CREATE TABLE h_funcionarios ( 
    hfun_id                 NUMBER(6) NOT NULL, 
    hfun_matricula          NUMBER(6) NOT NULL, 
    hfun_primeiro_nome      VARCHAR2(15) NOT NULL, 
    hfun_nome_meio          VARCHAR2(30), 
    hfun_sobrenome          VARCHAR2(15) NOT NULL, 
    hfun_data_contratacao   DATE NOT NULL,
    hfun_dt_entrada         DATE
);

-- Tabela Vendas --
CREATE TABLE vendas ( 
    vnd_id                  NUMBER(6) NOT NULL, 
    vnd_data_hora           DATE NOT NULL, 
    vnd_valor               NUMBER(8, 2) NOT NULL, 
    vnd_cpf_cnpj            NUMBER(14) NOT NULL,
    funcionarios_fun_id     NUMBER(6) NOT NULL
);

-- Tabela Historiamento Vendas --
CREATE TABLE h_vendas ( 
    hvnd_id                 NUMBER(6) NOT NULL, 
    hvnd_data_hora          DATE NOT NULL, 
    hvnd_valor              NUMBER(8, 2) NOT NULL, 
    hvnd_cpf_cnpj           NUMBER(14) NOT NULL,
    hfuncionarios_fun_id    NUMBER(6) NOT NULL,
    hvnd_dt_entrada         DATE
);

-- Tabela Pertencem --
CREATE TABLE pertencem (
    per_id                  NUMBER(6) NOT NULL,
    per_quantidade_vendida  NUMBER NOT NULL,
    materiais_mat_id        NUMBER(6) NOT NULL,
    vendas_vnd_id           NUMBER(6) NOT NULL
);

-- Tabela Historiamento Pertencem --
CREATE TABLE h_pertencem (
    hper_id                 NUMBER(6) NOT NULL,
    hper_quantidade_vendida NUMBER NOT NULL,
    hmateriais_mat_id       NUMBER(6) NOT NULL,
    hvendas_vnd_id          NUMBER(6) NOT NULL,
    hper_dt_entrada         DATE
);

-- Tabela Auditoria --
CREATE TABLE audit_table(
    aud_id                  NUMBER(6),
    aud_dt_hora             TIMESTAMP,
    aud_evento              CHAR(1),
    aud_tabela              VARCHAR(30),
    aud_owner               VARCHAR(30),
    aud_campo               VARCHAR(30),
    aud_old                 VARCHAR(255),
    aud_new                 VARCHAR(255),
    aud_identificador       VARCHAR(50),
    aud_user_bd             VARCHAR(30)
);

-- Tabela Stage -- 
CREATE TABLE stage(
    stg_mat_nome            VARCHAR2(255),
    stg_mat_preco           NUMBER(8, 2),
    stg_tip_nome            VARCHAR2(255),
    stg_reg_data_aquisicao  DATE,
    stg_per_quantidade_venda NUMBER,
    stg_for_nome            VARCHAR2(255),
    stg_for_estado          VARCHAR2(20),
    stg_fun_nome            VARCHAR2(60),
    stg_vnd_valor           NUMBER(8, 2),
    stg_vnd_tipo            VARCHAR2(4),
    stg_vnd_semana          VARCHAR2(30),
    stg_vnd_trimestre       NUMBER(1),
    stg_vnd_periodo         VARCHAR2(6),
    stg_vnd_id              NUMBER(6)
);

-- Constraints PK Tabelas Comuns --
ALTER TABLE fornecedores ADD CONSTRAINT pk_for PRIMARY KEY ( for_id );
ALTER TABLE tipos ADD CONSTRAINT pk_tip PRIMARY KEY ( tip_id );
ALTER TABLE materiais ADD CONSTRAINT pk_mat PRIMARY KEY ( mat_id );
ALTER TABLE registros ADD CONSTRAINT pk_reg PRIMARY KEY ( reg_id );
ALTER TABLE funcionarios ADD CONSTRAINT pk_fun PRIMARY KEY ( fun_id );
ALTER TABLE vendas ADD CONSTRAINT pk_vnd PRIMARY KEY ( vnd_id );
ALTER TABLE pertencem ADD CONSTRAINT pk_per PRIMARY KEY ( per_id );

-- Constraints PK Tabelas Temporais --
ALTER TABLE h_fornecedores ADD CONSTRAINT pk_hfor PRIMARY KEY ( hfor_id );
ALTER TABLE h_tipos ADD CONSTRAINT pk_htip PRIMARY KEY ( htip_id );
ALTER TABLE h_materiais ADD CONSTRAINT pk_hmat PRIMARY KEY ( hmat_id );
ALTER TABLE h_registros ADD CONSTRAINT pk_hreg PRIMARY KEY ( hreg_id );
ALTER TABLE h_funcionarios ADD CONSTRAINT pk_hfun PRIMARY KEY ( hfun_id );
ALTER TABLE h_vendas ADD CONSTRAINT pk_hvnd PRIMARY KEY ( hvnd_id );
ALTER TABLE h_pertencem ADD CONSTRAINT pk_hper PRIMARY KEY ( hper_id );

-- Constraints FK de Todas as Tabelas --
ALTER TABLE materiais
    ADD CONSTRAINT fk_mat_tip FOREIGN KEY ( tipos_tip_id )
        REFERENCES tipos ( tip_id );

ALTER TABLE pertencem
    ADD CONSTRAINT fk_per_mat FOREIGN KEY ( materiais_mat_id )
        REFERENCES materiais ( mat_id );

ALTER TABLE pertencem
    ADD CONSTRAINT fk_per_vnd FOREIGN KEY ( vendas_vnd_id )
        REFERENCES vendas ( vnd_id );

ALTER TABLE registros
    ADD CONSTRAINT fk_reg_for FOREIGN KEY ( fornecedores_for_id )
        REFERENCES fornecedores ( for_id );

ALTER TABLE registros
    ADD CONSTRAINT fk_reg_mat FOREIGN KEY ( materiais_mat_id )
        REFERENCES materiais ( mat_id );

ALTER TABLE vendas
    ADD CONSTRAINT fk_vnd_fun FOREIGN KEY ( funcionarios_fun_id )
        REFERENCES funcionarios ( fun_id );

-- Constraints Tabela Auditoria --
ALTER TABLE audit_table ADD CONSTRAINT pk_aud PRIMARY KEY ( aud_id );
ALTER TABLE audit_table ADD CONSTRAINT ck_aud_01 check (aud_evento in ('I','U','D'));
ALTER TABLE audit_table ADD CONSTRAINT nn_aud_01 check (aud_dt_hora is NOT NULL);

-- Alterando Formato DATE para Todas as Tabelas -- 
ALTER SESSION SET NLS_DATE_FORMAT = 'dd/mm/rrrr HH24:MI:SS';

-- COMENTARIO DAS TABELAS
COMMENT ON TABLE FORNECEDORES IS 'Tabela com finalidade o armazenamento de dados dos fornecedores';
COMMENT ON TABLE TIPOS IS 'Tabela com finalidade o armazenamento de dados dos tipos de materiais';
COMMENT ON TABLE MATERIAIS IS 'Tabela com finalidade o armazenamento de dados dos materiais';
COMMENT ON TABLE REGISTROS IS 'Tabela com finalidade o armazenamento de dados dos registros de compra de materiais';
COMMENT ON TABLE FUNCIONARIOS IS 'Tabela com finalidade o armazenamento de dados dos funcionários';
COMMENT ON TABLE VENDAS IS 'Tabela com finalidade o armazenamento de dados das vendas';
COMMENT ON TABLE PERTENCEM IS 'Tabela com finalidade o relacionamento de dados entre materiais e vendas';

-- COMENTARIO DAS TABELAS HISTORIAMENTO
COMMENT ON TABLE H_FORNECEDORES IS 'Tabela com finalidade de historiar a tabela dos fornecedores';
COMMENT ON TABLE H_TIPOS IS 'Tabela com finalidade de historiar a tabela dos tipos de materiais';
COMMENT ON TABLE H_MATERIAIS IS 'Tabela com finalidade de historiar a tabela dos materiais';
COMMENT ON TABLE H_REGISTROS IS 'Tabela com finalidade de historiar a tabela dos registros de compra de materiais';
COMMENT ON TABLE H_FUNCIONARIOS IS 'Tabela com finalidade de historiar a tabela dos funcionários';
COMMENT ON TABLE H_VENDAS IS 'Tabela com finalidade de historiar a tabela de dados das vendas';
COMMENT ON TABLE H_PERTENCEM IS 'Tabela com finalidade de historiar a tabela de relacionamento de dados entre materiais e vendas';

-- COMENTARIOS DAS COLUNAS DA TABELA FORNECEDORES
COMMENT ON COLUMN FORNECEDORES.for_id IS 'Número identificador de fornecedor';
COMMENT ON COLUMN FORNECEDORES.for_nome IS 'Nome do fornecedor';
COMMENT ON COLUMN FORNECEDORES.for_logradouro IS 'Nome da rua do fornecedor';
COMMENT ON COLUMN FORNECEDORES.for_numero IS 'Número do complemento do fornecedor';
COMMENT ON COLUMN FORNECEDORES.for_complemtento IS 'Tipo de complemento do fornecedor';
COMMENT ON COLUMN FORNECEDORES.for_bairro IS 'Nome do bairro do fornecedor';
COMMENT ON COLUMN FORNECEDORES.for_cidade IS 'Nome da cidade do fornecedor';
COMMENT ON COLUMN FORNECEDORES.for_estado IS 'Nome do estado do fornecedor';
COMMENT ON COLUMN FORNECEDORES.for_cep IS 'Número de cep do fornecedor';
COMMENT ON COLUMN FORNECEDORES.for_telefone_fixo IS 'Número de telefone fixo do fornecedor';
COMMENT ON COLUMN FORNECEDORES.for_telefone_movel IS 'Número de telefone móvel do fornecedor';
COMMENT ON COLUMN FORNECEDORES.for_email IS 'Endereço de email do fornecedor';

-- COMENTARIOS DAS COLUNAS DA TABELA H_FORNECEDORES
COMMENT ON COLUMN H_FORNECEDORES.hfor_id IS 'Número identificador de fornecedor';
COMMENT ON COLUMN H_FORNECEDORES.hfor_nome IS 'Nome do fornecedor';
COMMENT ON COLUMN H_FORNECEDORES.hfor_logradouro IS 'Nome da rua do fornecedor';
COMMENT ON COLUMN H_FORNECEDORES.hfor_numero IS 'Número do complemento do fornecedor';
COMMENT ON COLUMN H_FORNECEDORES.hfor_complemtento IS 'Tipo de complemento do fornecedor';
COMMENT ON COLUMN H_FORNECEDORES.hfor_bairro IS 'Nome do bairro do fornecedor';
COMMENT ON COLUMN H_FORNECEDORES.hfor_cidade IS 'Nome da cidade do fornecedor';
COMMENT ON COLUMN H_FORNECEDORES.hfor_estado IS 'Nome do estado do fornecedor';
COMMENT ON COLUMN H_FORNECEDORES.hfor_cep IS 'Número de cep do fornecedor';
COMMENT ON COLUMN H_FORNECEDORES.hfor_telefone_fixo IS 'Número de telefone fixo do fornecedor';
COMMENT ON COLUMN H_FORNECEDORES.hfor_telefone_movel IS 'Número de telefone móvel do fornecedor';
COMMENT ON COLUMN H_FORNECEDORES.hfor_email IS 'Endereço de email do fornecedor';
COMMENT ON COLUMN H_FORNECEDORES.hfor_dt_entrada IS 'Data de historiamento';

-- COMENTARIOS DAS COLUNAS DA TABELA TIPOS
COMMENT ON COLUMN TIPOS.tip_id IS 'Número identificador de tipo';
COMMENT ON COLUMN TIPOS.tip_nome IS 'Nome do tipo de material';

-- COMENTARIOS DAS COLUNAS DA TABELA H_TIPOS
COMMENT ON COLUMN H_TIPOS.htip_id IS 'Número identificador de tipo';
COMMENT ON COLUMN H_TIPOS.htip_nome IS 'Nome do tipo de material';
COMMENT ON COLUMN H_TIPOS.htip_dt_entrada IS 'Data de historiamento';

-- COMENTARIOS DAS COLUNAS DA TABELA MATERIAIS
COMMENT ON COLUMN MATERIAIS.mat_id IS 'Número identificador de material';
COMMENT ON COLUMN MATERIAIS.mat_nome IS 'Nome do material';
COMMENT ON COLUMN MATERIAIS.mat_preco IS 'Valor unitário de material';
COMMENT ON COLUMN MATERIAIS.mat_quantidade IS 'Quantidade total do material';
COMMENT ON COLUMN MATERIAIS.tipos_tip_id IS 'FK tip_id da tabela Tipos'; 

-- COMENTARIOS DAS COLUNAS DA TABELA H_MATERIAIS
COMMENT ON COLUMN H_MATERIAIS.hmat_id IS 'Número identificador de material';
COMMENT ON COLUMN H_MATERIAIS.hmat_nome IS 'Nome do material';
COMMENT ON COLUMN H_MATERIAIS.hmat_preco IS 'Valor unitário de material';
COMMENT ON COLUMN H_MATERIAIS.hmat_quantidade IS 'Quantidade total do material';
COMMENT ON COLUMN H_MATERIAIS.htipos_tip_id IS 'FK tip_id da tabela Tipos'; 
COMMENT ON COLUMN H_MATERIAIS.hmat_dt_entrada IS 'Data de historiamento';

-- COMENTARIOS DAS COLUNAS DA TABELA REGISTROS
COMMENT ON COLUMN REGISTROS.reg_id IS 'Número identificador de registro';
COMMENT ON COLUMN REGISTROS.reg_data_aquisicao IS 'Data de aquisição do material';
COMMENT ON COLUMN REGISTROS.reg_quantidade IS 'Número equivalente a quantidade de material fornecido';
COMMENT ON COLUMN REGISTROS.materiais_mat_id IS 'FK mat_id da tabela Materiais';
COMMENT ON COLUMN REGISTROS.fornecedores_for_id IS 'FK for_id da tabela Fornecedores';

-- COMENTARIOS DAS COLUNAS DA TABELA H_REGISTROS
COMMENT ON COLUMN H_REGISTROS.hreg_id IS 'Número identificador de registro';
COMMENT ON COLUMN H_REGISTROS.hreg_data_aquisicao IS 'Data de aquisição do material';
COMMENT ON COLUMN H_REGISTROS.hreg_quantidade IS 'Número equivalente a quantidade de material fornecido';
COMMENT ON COLUMN H_REGISTROS.hmateriais_mat_id IS 'FK mat_id da tabela Materiais';
COMMENT ON COLUMN H_REGISTROS.hfornecedores_for_id IS 'FK for_id da tabela Fornecedores';
COMMENT ON COLUMN H_REGISTROS.hreg_dt_entrada IS 'Data de historiamento';

-- COMENTARIOS DAS COLUNAS DA TABELA FUNCIONARIOS
COMMENT ON COLUMN FUNCIONARIOS.fun_id IS 'Número identificador de funcionário';
COMMENT ON COLUMN FUNCIONARIOS.fun_matricula IS 'Nome do fornecedor';
COMMENT ON COLUMN FUNCIONARIOS.fun_primeiro_nome IS 'Número de matrícula do funcionário';
COMMENT ON COLUMN FUNCIONARIOS.fun_nome_meio IS 'Nome do meio do funcionário';
COMMENT ON COLUMN FUNCIONARIOS.fun_sobrenome IS 'Sobrenome do funcionário';
COMMENT ON COLUMN FUNCIONARIOS.fun_data_contratacao IS 'Data de contratação do funcionário';

-- COMENTARIOS DAS COLUNAS DA TABELA H_FUNCIONARIOS
COMMENT ON COLUMN H_FUNCIONARIOS.hfun_id IS 'Número identificador de funcionário';
COMMENT ON COLUMN H_FUNCIONARIOS.hfun_matricula IS 'Nome do fornecedor';
COMMENT ON COLUMN H_FUNCIONARIOS.hfun_primeiro_nome IS 'Número de matrícula do funcionário';
COMMENT ON COLUMN H_FUNCIONARIOS.hfun_nome_meio IS 'Nome do meio do funcionário';
COMMENT ON COLUMN H_FUNCIONARIOS.hfun_sobrenome IS 'Sobrenome do funcionário';
COMMENT ON COLUMN H_FUNCIONARIOS.hfun_data_contratacao IS 'Data de contratação do funcionário';
COMMENT ON COLUMN H_FUNCIONARIOS.hfun_dt_entrada IS 'Data de historiamento';

-- COMENTARIOS DAS COLUNAS DA TABELA VENDAS
COMMENT ON COLUMN VENDAS.vnd_id IS 'Número identificador de venda';
COMMENT ON COLUMN VENDAS.vnd_data_hora IS 'Data e Hora em que a venda foi realizada';
COMMENT ON COLUMN VENDAS.vnd_valor IS 'Valor total da venda';
COMMENT ON COLUMN VENDAS.vnd_cpf_cnpj IS 'CPF ou CNPJ do comprador';
COMMENT ON COLUMN VENDAS.funcionarios_fun_id IS 'FK fun_id da tabela Funcionarios';

-- COMENTARIOS DAS COLUNAS DA TABELA H_VENDAS
COMMENT ON COLUMN H_VENDAS.hvnd_id IS 'Número identificador de venda';
COMMENT ON COLUMN H_VENDAS.hvnd_data_hora IS 'Data e Hora em que a venda foi realizada';
COMMENT ON COLUMN H_VENDAS.hvnd_valor IS 'Valor total da venda';
COMMENT ON COLUMN H_VENDAS.hvnd_cpf_cnpj IS 'CPF ou CNPJ do comprador';
COMMENT ON COLUMN H_VENDAS.hfuncionarios_fun_id IS 'FK fun_id da tabela Funcionarios';
COMMENT ON COLUMN H_VENDAS.hvnd_dt_entrada IS 'Data de historiamento';

-- COMENTARIOS DAS COLUNAS DA TABELA PERTENCEM
COMMENT ON COLUMN PERTENCEM.per_id IS 'Número identificador de cada relacionamento entre Materiais e Vendas';
COMMENT ON COLUMN PERTENCEM.per_quantidade_vendida IS 'Quantidade vendida de cada material';
COMMENT ON COLUMN PERTENCEM.materiais_mat_id IS 'FK mat_id da tabela Materiais';
COMMENT ON COLUMN PERTENCEM.vendas_vnd_id IS 'FK vnd_id da tabela Vendas';

-- COMENTARIOS DAS COLUNAS DA TABELA H_PERTENCEM
COMMENT ON COLUMN H_PERTENCEM.hper_id IS 'Número identificador de cada relacionamento entre Materiais e Vendas';
COMMENT ON COLUMN H_PERTENCEM.hper_quantidade_vendida IS 'Quantidade vendida de cada material';
COMMENT ON COLUMN H_PERTENCEM.hmateriais_mat_id IS 'FK mat_id da tabela Materiais';
COMMENT ON COLUMN H_PERTENCEM.hvendas_vnd_id IS 'FK vnd_id da tabela Vendas';
COMMENT ON COLUMN H_PERTENCEM.hper_dt_entrada IS 'Data de historiamento';

-- Sequences -- 
CREATE SEQUENCE seq_for nocache;
CREATE SEQUENCE seq_tip nocache;
CREATE SEQUENCE seq_mat nocache;
CREATE SEQUENCE seq_reg nocache;
CREATE SEQUENCE seq_fun nocache;
CREATE SEQUENCE seq_vnd nocache;
CREATE SEQUENCE seq_per nocache;
CREATE SEQUENCE seq_aud nocache;

-- Triggers ID--
    -- Fornecedores --
CREATE TRIGGER tg_seq_for
BEFORE INSERT ON fornecedores
FOR EACH ROW
BEGIN
    :NEW.for_id := seq_for.nextval;
END;

    -- Tipos --
CREATE TRIGGER tg_seq_tip
BEFORE INSERT ON tipos
FOR EACH ROW
BEGIN
    :NEW.tip_id := seq_tip.nextval;
END;

    -- Materiais --
CREATE TRIGGER tg_seq_mat
BEFORE INSERT ON materiais
FOR EACH ROW
BEGIN
    :NEW.mat_id := seq_mat.nextval;
END;

    -- Registros --
CREATE TRIGGER tg_seq_reg
BEFORE INSERT ON registros
FOR EACH ROW
BEGIN
    :NEW.reg_id := seq_reg.nextval;
END;

    -- Funcionarios --
CREATE TRIGGER tg_seq_fun
BEFORE INSERT ON funcionarios
FOR EACH ROW
BEGIN
    :NEW.fun_id := seq_fun.nextval;
END;

    -- Vendas --
CREATE TRIGGER tg_seq_vnd
BEFORE INSERT ON vendas
FOR EACH ROW
BEGIN
    :NEW.vnd_id := seq_vnd.nextval;
END;

    -- Pertencem --
CREATE TRIGGER tg_seq_per
BEFORE INSERT ON pertencem
FOR EACH ROW
BEGIN
    :NEW.per_id := seq_per.nextval;
END;

    -- Auditoria --
CREATE TRIGGER tg_seq_aud
BEFORE INSERT ON audit_table
FOR EACH ROW
BEGIN
    :new.aud_id := seq_aud.nextval;
END;

-- Triggers Hist -- 
    -- Fornecedores --   
CREATE TRIGGER TG_HIST_FOR
BEFORE UPDATE OR DELETE ON FORNECEDORES
FOR EACH ROW
BEGIN
    INSERT INTO H_FORNECEDORES VALUES (:old.for_id, :old.for_nome, :old.for_logradouro, :old.for_numero, :old.for_complemento, 
                                       :old.for_bairro, :old.for_cidade, :old.for_estado, :old.for_cep, 
                                       :old.for_telefone_fixo, :old.for_telefone_movel, :old.for_email, SYSDATE);
END;

    -- Tipos --
CREATE TRIGGER TG_HIST_TIP
BEFORE UPDATE OR DELETE ON TIPOS
FOR EACH ROW
BEGIN
    INSERT INTO H_TIPOS VALUES (:old.tip_id, :old.tip_nome, SYSDATE);
END;

    -- Materiais --
CREATE TRIGGER TG_HIST_MAT
BEFORE UPDATE OR DELETE ON MATERIAIS
FOR EACH ROW
BEGIN
    INSERT INTO H_MATERIAIS VALUES (:old.mat_id, :old.mat_nome, :old.mat_preco, :old.mat_quantidade, :old.tipos_tip_id, SYSDATE);
END;

    -- Registros --
CREATE TRIGGER TG_HIST_REG
BEFORE UPDATE OR DELETE ON REGISTROS
FOR EACH ROW
BEGIN
    INSERT INTO H_REGISTROS VALUES (:old.reg_id, :old.reg_data_aquisicao, :old.reg_quantidade, 
                                    :old.materiais_mat_id, :old.fornecedores_for_id, SYSDATE);
END;

    -- Funcionarios --
CREATE TRIGGER TG_HIST_FUN
BEFORE UPDATE OR DELETE ON FUNCIONARIOS
FOR EACH ROW
BEGIN
    INSERT INTO H_FUNCIONARIOS VALUES (:old.fun_id, :old.fun_matricula, :old.fun_primeiro_nome, :old.fun_nome_meio,
                                       :old.fun_sobrenome, :old.fun_data_contratacao, SYSDATE);
END;

    -- Vendas --
CREATE TRIGGER TG_HIST_VND
BEFORE UPDATE OR DELETE ON VENDAS
FOR EACH ROW
BEGIN
    INSERT INTO H_VENDAS VALUES (:old.vnd_id, :old.vnd_data_hora, :old.vnd_valor, :old.vnd_cpf_cnpj, :old.funcionarios_fun_id, SYSDATE);
END;

    -- Pertencem --
CREATE TRIGGER TG_HIST_PER
BEFORE UPDATE OR DELETE ON PERTENCEM
FOR EACH ROW
BEGIN
    INSERT INTO H_PERTENCEM VALUES (:old.per_id, :old.per_quantidade_vendida, :old.materiais_mat_id, :old.vendas_vnd_id, SYSDATE);
END;

-- Procedure Tabela Auditoria --
CREATE PROCEDURE insert_audit(
    p_aud_dt_hora TIMESTAMP,
    p_aud_evento CHAR,
    p_aud_tabela VARCHAR,
    p_aud_owner VARCHAR,
    p_aud_campo VARCHAR,
    p_aud_old VARCHAR,
    p_aud_new VARCHAR,
    p_aud_identificador VARCHAR,
    p_aud_user_bd VARCHAR
)IS
BEGIN
    INSERT INTO audit_table VALUES (0,p_aud_dt_hora,p_aud_evento,p_aud_tabela,p_aud_owner,p_aud_campo,p_aud_old,p_aud_new,p_aud_identificador,p_aud_user_bd);
END insert_audit;

-- Buscar Usuario Conectado --
CREATE FUNCTION resgata_usuario RETURN VARCHAR
AS 
    v_user VARCHAR(30);
BEGIN
    SELECT USER INTO v_user FROM dual;
    RETURN v_user;
END;

-- Triggers Audit --
    -- Fornecedores --
CREATE TRIGGER tg_for_audit
AFTER INSERT OR UPDATE OR DELETE ON fornecedores
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        insert_audit(SYSTIMESTAMP,'I','FORNECEDORES','APP',null,null,null,:new.for_id,resgata_usuario());
    END IF;

    IF DELETING THEN
        insert_audit(SYSTIMESTAMP,'D','FORNECEDORES','APP',null,null,null,:old.for_id,resgata_usuario());
    END IF;

    IF UPDATING THEN
        IF(:old.for_nome <> :new.for_nome) THEN
                insert_audit(systimestamp,'U','FORNECEDORES','APP','FOR_NOME',:old.for_nome,:new.for_nome,:new.for_id,resgata_usuario());
        END IF;

        IF(:old.for_logradouro <> :new.for_logradouro ) THEN
                insert_audit(systimestamp,'U','FORNECEDORES','APP','FOR_LOGRADOURO',:old.for_logradouro ,:new.for_logradouro ,:new.for_id,resgata_usuario());
        END IF;

        IF(:old.for_numero <> :new.for_numero) THEN
                insert_audit(systimestamp,'U','FORNECEDORES','APP','FOR_NUMERO',:old.for_numero,:new.for_numero,:new.for_id,resgata_usuario());
        END IF;

        IF(:old.for_complemento <> :new.for_complemento) THEN
                insert_audit(systimestamp,'U','FORNECEDORES','APP','FOR_COMPLEMENTO',:old.for_complemento,:new.for_complemento,:new.for_id,resgata_usuario());
        END IF;

        IF(:old.for_bairro <> :new.for_bairro) THEN
                insert_audit(systimestamp,'U','FORNECEDORES','APP','FOR_BAIRRO',:old.for_bairro,:new.for_bairro,:new.for_id,resgata_usuario());
        END IF;

        IF(:old.for_cidade <> :new.for_cidade) THEN
                insert_audit(systimestamp,'U','FORNECEDORES','APP','FOR_CIDADE',:old.for_cidade,:new.for_cidade,:new.for_id,resgata_usuario());
        END IF;

        IF(:old.for_estado <> :new.for_estado) THEN
                insert_audit(systimestamp,'U','FORNECEDORES','APP','FOR_ESTADO',:old.for_estado,:new.for_estado,:new.for_id,resgata_usuario());
        END IF;

        IF(:old.for_cep <> :new.for_cep) THEN
                insert_audit(systimestamp,'U','FORNECEDORES','APP','FOR_CEP',:old.for_cep,:new.for_cep,:new.for_id,resgata_usuario());
        END IF;

        IF(:old.for_telefone_fixo <> :new.for_telefone_fixo) THEN
                insert_audit(systimestamp,'U','FORNECEDORES','APP','FOR_TELEFONE_FIXO',:old.for_telefone_fixo,:new.for_telefone_fixo,:new.for_id,resgata_usuario());
        END IF;

        IF(:old.for_telefone_movel <> :new.for_telefone_movel) THEN
                insert_audit(systimestamp,'U','FORNECEDORES','APP','FOR_TELEFONE_MOVEL',:old.for_telefone_movel,:new.for_telefone_movel,:new.for_id,resgata_usuario());
        END IF;

        IF(:old.for_email <> :new.for_email) THEN
                insert_audit(systimestamp,'U','FORNECEDORES','APP','FOR_EMAIL',:old.for_email,:new.for_email,:new.for_id,resgata_usuario());
        END IF;
    END IF;
END;

    -- Tipos --
CREATE TRIGGER tg_tip_audit
AFTER INSERT OR UPDATE OR DELETE ON tipos
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        insert_audit(SYSTIMESTAMP,'I','TIPOS','APP',null,null,null,:new.tip_id,resgata_usuario());
    END IF;

    IF DELETING THEN
        insert_audit(SYSTIMESTAMP,'D','TIPOS','APP',null,null,null,:old.tip_id,resgata_usuario());
    END IF;

    IF UPDATING THEN
        IF(:old.tip_nome <> :new.tip_nome) THEN
                insert_audit(systimestamp,'U','TIPOS','APP','TIP_NOME',:old.tip_nome,:new.tip_nome,:new.tip_id,resgata_usuario());
        END IF;      
    END IF;
END;

    -- Materiais --
CREATE TRIGGER tg_mat_audit
AFTER INSERT OR UPDATE OR DELETE ON materiais
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        insert_audit(SYSTIMESTAMP,'I','MATERIAIS','APP',null,null,null,:new.mat_id,resgata_usuario());
    END IF;

    IF DELETING THEN
        insert_audit(SYSTIMESTAMP,'D','MATERIAIS','APP',null,null,null,:old.mat_id,resgata_usuario());
    END IF;

    IF UPDATING THEN
        IF(:old.mat_nome <> :new.mat_nome) THEN
                insert_audit(systimestamp,'U','MATERIAIS','APP','MAT_NOME',:old.mat_nome,:new.mat_nome,:new.mat_id,resgata_usuario());
        END IF;

        IF(:old.mat_preco <> :new.mat_preco) THEN
                insert_audit(systimestamp,'U','MATERIAIS','APP','MAT_PRECO',:old.mat_preco,:new.mat_preco,:new.mat_id,resgata_usuario());
        END IF;

        IF(:old.mat_quantidade <> :new.mat_quantidade) THEN
                insert_audit(systimestamp,'U','MATERIAIS','APP','MAT_QUANTIDADE',:old.mat_quantidade,:new.mat_quantidade,:new.mat_id,resgata_usuario());
        END IF;

        IF(:old.tipos_tip_id <> :new.tipos_tip_id) THEN
                insert_audit(systimestamp,'U','MATERIAIS','APP','TIPOS_TIP_ID',:old.tipos_tip_id,:new.tipos_tip_id,:new.mat_id,resgata_usuario());
        END IF;   
    END IF;
END;

    -- Registros --
CREATE TRIGGER tg_reg_audit
AFTER INSERT OR UPDATE OR DELETE ON registros
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        insert_audit(SYSTIMESTAMP,'I','REGISTROS','APP',null,null,null,:new.reg_id,resgata_usuario());
    END IF;

    IF DELETING THEN
        insert_audit(SYSTIMESTAMP,'D','REGISTROS','APP',null,null,null,:old.reg_id,resgata_usuario());
    END IF;

    IF UPDATING THEN
        IF(:old.reg_data_aquisicao <> :new.reg_data_aquisicao) THEN
                insert_audit(systimestamp,'U','REGISTROS','APP','REG_DATA_AQUISICAO',:old.reg_data_aquisicao,:new.reg_data_aquisicao,:new.reg_id,resgata_usuario());
        END IF;

        IF(:old.reg_quantidade <> :new.reg_quantidade) THEN
                insert_audit(systimestamp,'U','REGISTROS','APP','REG_QUANTIDADE',:old.reg_quantidade,:new.reg_quantidade,:new.reg_id,resgata_usuario());
        END IF;

        IF(:old.materiais_mat_id <> :new.materiais_mat_id) THEN
                insert_audit(systimestamp,'U','REGISTROS','APP','MATERIAIS_MAT_ID',:old.materiais_mat_id,:new.materiais_mat_id,:new.reg_id,resgata_usuario());
        END IF;

        IF(:old.fornecedores_for_id <> :new.fornecedores_for_id) THEN
                insert_audit(systimestamp,'U','REGISTROS','APP','FORNECEDORES_FOR_ID',:old.fornecedores_for_id,:new.fornecedores_for_id,:new.reg_id,resgata_usuario());
        END IF;  
    END IF;
END;

    -- Funcionarios --
CREATE TRIGGER tg_fun_audit
AFTER INSERT OR UPDATE OR DELETE ON funcionarios
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        insert_audit(SYSTIMESTAMP,'I','FUNCIONARIOS','APP',null,null,null,:new.fun_id,resgata_usuario());
    END IF;

    IF DELETING THEN
        insert_audit(SYSTIMESTAMP,'D','FUNCIONARIOS','APP',null,null,null,:old.fun_id,resgata_usuario());
    END IF;

    IF UPDATING THEN
        IF(:old.fun_matricula <> :new.fun_matricula) THEN
                insert_audit(systimestamp,'U','FUNCIONARIOS','APP','FUN_MATRICULA',:old.fun_matricula,:new.fun_matricula,:new.fun_id,resgata_usuario());
        END IF;

        IF(:old.fun_primeiro_nome <> :new.fun_primeiro_nome ) THEN
                insert_audit(systimestamp,'U','FUNCIONARIOS','APP','FUN_PRIMEIRO_NOME',:old.fun_primeiro_nome ,:new.fun_primeiro_nome ,:new.fun_id,resgata_usuario());
        END IF;

        IF(:old.fun_nome_meio <> :new.fun_nome_meio) THEN
                insert_audit(systimestamp,'U','FUNCIONARIOS','APP','FUN_NOME_MEIO',:old.fun_nome_meio,:new.fun_nome_meio,:new.fun_id,resgata_usuario());
        END IF;

        IF(:old.fun_sobrenome <> :new.fun_sobrenome) THEN
                insert_audit(systimestamp,'U','FUNCIONARIOS','APP','FUN_SOBRENOME',:old.fun_sobrenome,:new.fun_sobrenome,:new.fun_id,resgata_usuario());
        END IF;

        IF(:old.fun_data_contratacao <> :new.fun_data_contratacao) THEN
                insert_audit(systimestamp,'U','FUNCIONARIOS','APP','FUN_DATA_CONTRATACAO',:old.fun_data_contratacao,:new.fun_data_contratacao,:new.fun_id,resgata_usuario());
        END IF;
    END IF;
END;

    -- Vendas --
CREATE TRIGGER tg_vnd_audit
AFTER INSERT OR UPDATE OR DELETE ON vendas
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        insert_audit(SYSTIMESTAMP,'I','VENDAS','APP',null,null,null,:new.vnd_id,resgata_usuario());
    END IF;

    IF DELETING THEN
        insert_audit(SYSTIMESTAMP,'D','VENDAS','APP',null,null,null,:old.vnd_id,resgata_usuario());
    END IF;

    IF UPDATING THEN
        IF(:old.vnd_data_hora <> :new.vnd_data_hora) THEN
                insert_audit(systimestamp,'U','VENDAS','APP','VND_DATA_HORA',:old.vnd_data_hora,:new.vnd_data_hora,:new.vnd_id,resgata_usuario());
        END IF;

        IF(:old.vnd_valor <> :new.vnd_valor ) THEN
                insert_audit(systimestamp,'U','VENDAS','APP','VND_VALOR',:old.vnd_valor ,:new.vnd_valor ,:new.vnd_id,resgata_usuario());
        END IF;

        IF(:old.vnd_cpf_cnpj <> :new.vnd_cpf_cnpj) THEN
                insert_audit(systimestamp,'U','VENDAS','APP','VND_CPF_CNPJ',:old.vnd_cpf_cnpj,:new.vnd_cpf_cnpj,:new.vnd_id,resgata_usuario());
        END IF;

        IF(:old.funcionarios_fun_id <> :new.funcionarios_fun_id) THEN
                insert_audit(systimestamp,'U','VENDAS','APP','FUNCIONARIOS_FUN_ID',:old.funcionarios_fun_id,:new.funcionarios_fun_id,:new.vnd_id,resgata_usuario());
        END IF;
    END IF;
END;

    -- Pertencem --
CREATE TRIGGER tg_per_audit
AFTER INSERT OR UPDATE OR DELETE ON pertencem
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        insert_audit(SYSTIMESTAMP,'I','PERTENCEM','APP',null,null,null,:new.per_id,resgata_usuario());
    END IF;

    IF DELETING THEN
        insert_audit(SYSTIMESTAMP,'D','PERTENCEM','APP',null,null,null,:old.per_id,resgata_usuario());
    END IF;
    
    IF UPDATING THEN
        IF(:old.per_quantidade_vendida <> :new.per_quantidade_vendida) THEN
                insert_audit(systimestamp,'U','PERTENCEM','APP','MATERIAIS_MAT_ID',:old.per_quantidade_vendida,:new.per_quantidade_vendida,:new.per_id,resgata_usuario());
        END IF;

        IF(:old.materiais_mat_id <> :new.materiais_mat_id) THEN
                insert_audit(systimestamp,'U','PERTENCEM','APP','MATERIAIS_MAT_ID',:old.materiais_mat_id,:new.materiais_mat_id,:new.per_id,resgata_usuario());
        END IF;

        IF(:old.vendas_vnd_id <> :new.vendas_vnd_id ) THEN
                insert_audit(systimestamp,'U','PERTENCEM','APP','VENDAS_VND_ID',:old.vendas_vnd_id ,:new.vendas_vnd_id ,:new.per_id,resgata_usuario());
        END IF;
    END IF;
END;

-- Procedure Tabela Stage --
CREATE PROCEDURE insert_stage AS
BEGIN
    DELETE FROM stage;
    INSERT INTO stage
        SELECT 
            mat_nome    AS NOME_MATERIAL,
            mat_preco   AS PRECO_MATERIAL,
            tip_nome    AS TIPO_MATERIAL,
            reg_data_aquisicao AS DATA_FORNECIMENTO,
            per_quantidade_vendida AS QUANTIDADE_VENDIDA,
            for_nome    AS NOME_FORNECEDOR,
            for_estado  AS ESTADO_FORNECEDOR,
            fun_primeiro_nome || ' ' || fun_nome_meio || ' ' || fun_sobrenome AS NOME_FUNCIONARIO,
            vnd_valor   AS VALOR_VENDA,

            decode(length(vnd_cpf_cnpj), 11, 'CPF', 'CNPJ') AS TIPO_CLIENTE,  

            to_char(vnd_data_hora, 'DAY') AS DIA_SEMANA,

            (CASE
                WHEN to_char(vnd_data_hora, 'mm') IN (1,2,3) THEN 1
                WHEN to_char(vnd_data_hora, 'mm') IN (4,5,6) THEN 2
                WHEN to_char(vnd_data_hora, 'mm') IN (7,8,9) THEN 3
                WHEN to_char(vnd_data_hora, 'mm') IN (10,11,12) THEN 4
                END
            ) AS TRIMESTRE_VENDA,

            (CASE
                WHEN to_char(vnd_data_hora, 'HH24') >= 6 AND to_char(vnd_data_hora, 'HH24') < 12 THEN 'MANHÃ'
                WHEN to_char(vnd_data_hora, 'HH24') >= 12 AND to_char(vnd_data_hora, 'HH24') < 18 THEN 'TARDE'
                ELSE 'NOITE'
                END
            ) AS PERIODO_VENDA,

            vnd_id AS VENDA
        FROM
            pertencem  
            INNER JOIN materiais ON materiais.mat_id = pertencem.materiais_mat_id
            INNER JOIN vendas ON vendas.vnd_id = pertencem.vendas_vnd_id
            INNER JOIN funcionarios ON vendas.funcionarios_fun_id = funcionarios.fun_id
            INNER JOIN registros ON materiais.mat_id = registros.materiais_mat_id
            INNER JOIN fornecedores ON fornecedores.for_id = registros.fornecedores_for_id
            INNER JOIN tipos ON tipos.tip_id = materiais.tipos_tip_id;
END;

-- Inserts --
    -- Tabela Fornecedores --
INSERT INTO fornecedores (for_nome , for_logradouro, for_numero, for_complemento, for_bairro, for_cidade, for_estado, for_cep, for_telefone_fixo, for_telefone_movel, for_email)
    WITH dados AS 
    (
        SELECT 'Gazin Atacado', 'Rod Antonio Pedroso', 01, 'Loja Comercial', 'Centro', 'Douradina', 'Paraná', 87485000, 4436638181, null , 'contato@gazinatacado.com.br' FROM dual UNION ALL 
        SELECT 'Oderço', 'Av. Mauá', 1502, 'Loja Comercial', 'Zona 03', 'Maringá', 'Paraná', 87050020, 4421011400, null , 'contato@oderco.com.br' FROM dual UNION ALL 
        SELECT 'Martins Atacado', 'Rua Jataí', 1150, 'Loja Comercial', ' Aparecida', 'Uberlândia', 'Minas Gerais', 38400632, 3432181550, 3433015819, 'site@martins.com.br' FROM dual UNION ALL 
        SELECT 'Comp Distribuidora', 'Rua Antonio de Barros', 2391, 'Loja Comercial', 'Tatuapé', 'São Paulo', 'São Paulo', 87050020, null , 11977941000 , 'contato@compdistribuidora.com.br' FROM dual UNION ALL 
        SELECT 'Summerland', 'Rua Silva Teles', 329, 'Loja Comercial', 'Pari', 'São Paulo', 'São Paulo', 03026001, null , 11950485734, 'shop@summerland.com.br' FROM dual UNION ALL 
        SELECT 'Mirão Distribuidora', 'Av. Olavo Egidio de Souza Aranha', 674, 'Loja Comercial', 'Parque Císper', 'São Paulo', 'São Paulo', 03822000, null , 11981466079, 'atendimento@mirao.com.br' FROM dual UNION ALL 
        SELECT 'Feira da Madrugada SP', ' R. Rodrigues dos Santos', 329, 'Loja Comercial', 'Brás', 'São Paulo', 'São Paulo', 03009010, null , 11950485734, 'vendas@feiradamadrugadasp.com.br' FROM dual UNION ALL 
        SELECT 'Hayamax', 'Rua João Marques de Nóbrega', 300, 'Loja Comercial', 'San Rafael', 'Ibiporã', 'Paraná', 86200000, null , 11950485734, 'hayamax@hayamax.com.br' FROM dual UNION ALL 
        SELECT 'SND', 'Av. Copacabana', 238, 'Loja Comercial', 'Empresarial 18 do Forte', 'Barueri', 'São Paulo', 06472001, 1121878400, null , 'ecommerce@snd.com.br' FROM dual UNION ALL 
        SELECT 'Inova', 'Rua Carlos de Sousa Nazaré', 418, 'Loja Comercial', 'Centro Histórico de São Paulo', 'São Paulo', 'São Paulo', 01018000, null , 11966422426, 'kp04inovaatacadista@gmail.com' FROM dual UNION ALL 
        SELECT 'Eletrônica Santana', 'Rua Voluntários da Pátria', 1495, 'Loja Comercial', 'Santana', 'São Paulo', 'São Paulo', 02011200, 1128237066, null , 'atendimentosantana@gmail.com.br' FROM dual UNION ALL 
        SELECT 'Maxpel', 'R. Alexandre Mackenzie', 107, 'Loja Comercial', 'Centro', 'Rio de Janeiro', 'Rio de Janeiro', 00221410, null , 2122061200, 'contato@maxpel.com.br' FROM dual UNION ALL 
        SELECT 'Aldo', 'Av. Advogado Horácio Raccanello Filho', 1836, 'Loja Comercial', 'Vila Nova', 'Maringá', 'Paraná', 87045237, 4432612000, null , 'cartas@aldo.com.br' FROM dual UNION ALL 
        SELECT 'Franjinha','R. Limoeiro', 420, 'Loja Comercial', 'Bairro do Limoeiro', 'São Paulo', 'São Paulo', 04362080, 1160432432, null , 'franjinha@comics.com' FROM dual UNION ALL 
        SELECT 'Ruy', 'R. Grime', 321, 'Loja Comercial', 'Lavender Lane', 'Ovlupledo', 'Acre', 01233032, null , 68988724371, 'ruystore@gmail.com' FROM dual UNION ALL 
        SELECT 'Alfredo','R. Garnet Row', 431, 'Loja Comercial', 'Storm', 'Frine', 'Amapá', 09837023, 9624538746, null ,'alfredoshop@hotmail.com' FROM dual UNION ALL 
        SELECT 'Efigénia', 'R. Blossom', 765, 'Loja Comercial', ' Xaedale', 'Ukark', 'Bahia', 04545075, null , 75945734567,'efigéniastore@gmail.com' FROM dual UNION ALL 
        SELECT 'Virginia', 'R. Redwood', 546, 'Loja Comercial', 'Kolis', 'Anbuby', 'Mato Grosso', 07564097, null ,6578392871, 'virginiashop@hotmail.com' FROM dual UNION ALL 
        SELECT 'Teodósio', 'R. Snowflake', 876, 'Loja Comercial', 'Agririe', 'Vobridge', 'Mato Grosso do Sul', 01353071, null , 67942389183, 'teodosiostore@gmail.com' FROM dual UNION ALL 
        SELECT 'Elias', 'R. Grand Lane', 345, 'Loja Comercial', 'Brine', 'Icharc', 'Rondonia', 06732047, 6998771225, null , 'elliasshop@hotmail.com' FROM dual UNION ALL 
        SELECT 'Filipa', 'R. Seaview Avenue', 395, 'Loja Comercial', 'Zhore', 'Krora', 'Roraima', 07832074, null ,9598728198, 'filipastore@gmail.com' FROM dual UNION ALL 
        SELECT 'Rodolfo', 'R. Grove Row', 563, 'Loja Comercial', 'Ovrore', 'Cloln', 'Goias', 04562032, 6267542678, null , 'rodolfoshop@hotmail.com' FROM dual UNION ALL 
        SELECT 'Paloma', 'R. Anchor Passage', 654, 'Loja Comercial', 'Ploit' , 'Clalo', 'Curitiba', 05324036, null ,41976508534, 'palomastore@gmail.com' FROM dual UNION ALL 
        SELECT 'Thalita', 'R. Farmer Route', 956, 'Loja Comercial', 'Nalmore', 'Evregend', 'Pernambuco', 04123045, 8776839123, null , 'thalitashop@hotmail.com' FROM dual UNION ALL 
        SELECT 'Manoela', 'R. Coral Lane', 879, 'Loja Comercial', 'Farc', 'Uphedo', 'Ceara', 09476086, null , 8596546438, 'manoelastore@gmail.com' FROM dual UNION ALL 
        SELECT 'Érico', 'R. Gray Way', 568, 'Loja Comercial', 'Yrison', 'Strock', 'Rio de Janeiro', 09876017, 2164630796, null , 'ericoshop@hotmail.com' FROM dual UNION ALL 
        SELECT 'Almir', 'R. Jewel Passage', 987, 'Loja Comercial', 'Plago', 'Oragate', 'Rio Grande do Norte', 06624098, null , 8493456382, 'almirstore@gmail.com' FROM dual UNION ALL 
        SELECT 'Andreia', 'R. Vale Street', 487, 'Loja Comercial', 'Qinhull', 'Eimton', 'Rio Grande do Sul', 03783056, null ,5397549689, 'andreiashop@hotmail.com' FROM dual UNION ALL 
        SELECT 'Adelmar', 'R. Emerald Way', 865, 'Loja Comercial', 'Jence', 'Flaka', 'Santa Catarina', 04573068, 4729493286, null , 'adelmarstore@gmail.com' FROM dual UNION ALL 
        SELECT 'Liliana Maciel', 'R. Aurora Lane', 654, 'Loja Comercial', 'Jence', 'Udetol', 'Goiania', 09854049, null , 62974785253, 'lilianashop@hotmail.com' FROM dual
    )
    SELECT * FROM dados;

    -- Tabela Tipos --
INSERT INTO tipos (tip_nome)
    WITH dados AS 
    (
        SELECT 'Teclado' FROM dual UNION ALL
        SELECT 'Mouse' FROM dual UNION ALL
        SELECT 'Microfone' FROM dual UNION ALL
        SELECT 'Mousepad' FROM dual UNION ALL
        SELECT 'Headset' FROM dual UNION ALL
        SELECT 'Caixa de Som' FROM dual UNION ALL
        SELECT 'Processador' FROM dual UNION ALL
        SELECT 'Placa de Vídeo' FROM dual UNION ALL
        SELECT 'Placa Mãe' FROM dual UNION ALL
        SELECT 'Placa de Rede' FROM dual UNION ALL
        SELECT 'Placa de ?udio' FROM dual UNION ALL
        SELECT 'Fonte de Energia' FROM dual UNION ALL
        SELECT 'Memória RAM' FROM dual UNION ALL
        SELECT 'Gabinete' FROM dual UNION ALL
        SELECT 'SSD' FROM dual UNION ALL
        SELECT 'HD' FROM dual UNION ALL
        SELECT 'Monitor' FROM dual UNION ALL
        SELECT 'Impressora' FROM dual UNION ALL
        SELECT 'Pendrive' FROM dual UNION ALL
        SELECT 'Roteador' FROM dual
    )
    SELECT * FROM dados;

    -- Tabela Materiais --
INSERT INTO materiais (mat_nome, mat_preco, mat_quantidade, tipos_tip_id)
    WITH dados AS 
    (
        SELECT 'HyperX Mars RGB Switch Outemu Blue', 349.90, 84, 1 FROM dual UNION ALL
        SELECT 'T-Dagger Bora LED Vermelho Switch Blue', 189.90, 45, 1 FROM dual UNION ALL
        SELECT 'Redragon Cobra Chroma Preto M711', 114.90, 32, 2 FROM dual UNION ALL
        SELECT 'Logitech G403 HERO RGB LIGHTSYNC', 269.90, 37, 2 FROM dual UNION ALL
        SELECT 'HyperX QuadCast', 899.90, 17, 3 FROM dual UNION ALL
        SELECT 'Husky Gaming Howl', 269.90, 11, 3 FROM dual UNION ALL
        SELECT 'Husky Gaming Storm Gold HGMH001', 89.90, 5, 4 FROM dual UNION ALL
        SELECT 'HyperX Fury S Speed', 214.90, 12, 4 FROM dual UNION ALL
        SELECT 'Husky Snow HS-HSN-BL', 149.90, 54, 5 FROM dual UNION ALL
        SELECT 'Redragon Scylla H901', 109.90, 25, 5 FROM dual UNION ALL
        SELECT 'Husky Gaming Polar HGMD002', 119.90, 40, 5 FROM dual UNION ALL
        SELECT 'Husky Gaming Storm Preto 6W HGMK000', 89.90, 65, 6 FROM dual UNION ALL
        SELECT 'Multilaser 2.0 Standard USB', 26.90, 67, 6 FROM dual UNION ALL
        SELECT 'Intel Core i5-10400 Cache 12MB 2.9Ghz', 1499.90, 51, 7 FROM dual UNION ALL
        SELECT 'AMD Ryzen 5 5600X Cache 35MB 3.7Ghz', 1759.90, 75, 7 FROM dual UNION ALL
        SELECT 'Asus NVIDIA GeForce GTX 1650 4GB GDDR6', 2399.90, 4, 8 FROM dual UNION ALL
        SELECT 'Asus Phoenix NVIDIA GeForce GTX 1660 6GB GDDR5', 3399.90, 7, 8 FROM dual UNION ALL
        SELECT 'PCYes NVIDIA GeForce GT 710 2GB DDR3', 329.90, 14, 8 FROM dual UNION ALL
        SELECT 'ASRock B450M Steel Legend AMD AM4 mATX DDR4', 759.90, 10, 9 FROM dual UNION ALL
        SELECT 'Gigabyte H510M S2H Intel LGA1200 Micro ATX DDR4', 659.90, 15, 9 FROM dual UNION ALL
        SELECT 'Gigabit D-Link PCI DGE-528T', 83.42, 22, 10 FROM dual UNION ALL
        SELECT 'PCI-E PRV1000E', 31.90, 16, 10 FROM dual UNION ALL
        SELECT 'Asus Strix Raid Pro PCIe', 1349.90, 15, 11 FROM dual UNION ALL
        SELECT 'Creative Labs SB1500', 869.90, 16, 11 FROM dual UNION ALL
        SELECT 'XPG Core Reactor 850W', 1299.90, 26, 12 FROM dual UNION ALL
        SELECT 'XPG Core Reactor 750W', 999.90, 15, 12 FROM dual UNION ALL
        SELECT 'Crucial Ballistix 8GB DDR4 2666Mhz', 269.90, 36, 13 FROM dual UNION ALL
        SELECT 'Kingston Fury Beast 8GB 2666Mhz DDR4', 289.90, 47, 13 FROM dual UNION ALL
        SELECT 'Corsair Carbide Series 175R Mid Tower RGB', 279.90, 17, 14 FROM dual UNION ALL
        SELECT 'Corsair Carbide Series Spec Delta RGB Mid-Tower', 399.90, 32, 14 FROM dual UNION ALL
        SELECT 'Kingston A400 240GB SATA', 249.90, 95, 15 FROM dual UNION ALL
        SELECT 'Kingston NV1 1TB M.2 2280 NVMe', 729.90, 49, 15 FROM dual UNION ALL
        SELECT 'Seagate BarraCuda 2TB 3.5 SATA', 374.90, 56, 16 FROM dual UNION ALL
        SELECT 'Mouse Gamer Redragon Cobra', 89.90, 56, 2 FROM dual UNION ALL
        SELECT 'Mouse Gamer Razer Deathadder V2 Chroma', 399.90, 97, 2 FROM dual UNION ALL
        SELECT 'Mouse Gamer Logitech G403 HERO com RGB LIGHTSYNC', 159.90, 13, 2 FROM dual UNION ALL
        SELECT 'Mouse Logitech M90 Preto 1000DPI', 36.90, 5, 2 FROM dual UNION ALL
        SELECT 'SSD Kingston A400, 240GB, SATA', 189.90, 2, 15 FROM dual UNION ALL 
        SELECT 'Pen Drive Cruzer Blade Sandisk USB 2.0 16GB', 39.90, 27, 19 FROM dual UNION ALL
        SELECT 'Monitor Gamer Ozone DSP24 240, 24", Full HD', 2099.90, 6, 17 FROM dual UNION ALL
        SELECT 'Monitor Gamer Samsung Odyssey G3, 24 Full HD', 1899.90, 11, 17 FROM dual UNION ALL
        SELECT 'Monitor PCTOP 17 LED, HDMI', 499.90, 88, 17 FROM dual UNION ALL
        SELECT 'Processador AMD Athlon 3000G Two Core', 449.90, 26, 7 FROM dual UNION ALL
        SELECT 'Processador AMD Ryzen 5 5600X, Cache 35MB', 1779.90, 34, 7 FROM dual UNION ALL
        SELECT 'Teclado Sem Fio Magic Keyboard Apple', 1699.90, 134, 1 FROM dual
    )
    SELECT * FROM dados;

    -- Tabela Registros --
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('02/05/21', 84, 1, 4);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('23/07/21', 25, 2, 1);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('15/07/21', 20, 2, 3);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('01/11/21', 10, 3, 11); 
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('21/11/21', 15, 3, 20);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('06/11/21', 7, 3, 4);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('19/01/21', 32, 4, 1);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('25/01/21', 5, 4, 8);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('19/08/21', 10, 5, 18);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('03/01/21', 6, 5, 1);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('15/03/21', 1, 5, 12);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('07/08/21', 11, 6, 15);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('15/12/21', 1, 7, 6); 
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('05/12/21', 4, 7, 17); 
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('12/09/21', 12, 8, 12);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('28/02/21', 25, 9, 1);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('18/02/21', 25, 9, 2);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('08/02/21', 4, 9, 16);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('12/10/21', 25, 10, 20);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('03/04/21', 10, 11, 12);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('13/04/21', 10, 11, 5);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('23/04/21', 10, 11, 9);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('31/04/21', 10, 11, 1);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('29/05/21', 55, 12, 3);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('13/04/21', 10, 12, 5);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('30/12/21', 50, 13, 18);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('18/04/21', 10, 13, 12);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('15/04/21', 6, 13, 4);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('28/04/21', 1, 13, 6);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('27/03/21', 50, 14, 9);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('17/03/21', 1, 14, 15);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('05/03/21', 25, 15, 3);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('25/03/21', 25, 15, 2);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('14/03/21', 25, 15, 1);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('04/09/21', 4, 16, 2);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('06/10/21', 7, 17, 2);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('07/11/21', 14, 18, 6);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('08/12/21', 10, 19, 6);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('09/01/21', 15, 20, 6);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('10/02/21', 22, 21, 7);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('11/03/21', 16, 22, 9);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('12/04/21', 15, 23, 18);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('13/05/21', 16, 24, 2);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('04/09/21', 12, 25, 12);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('15/03/21', 5, 26, 1);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('19/03/21', 5, 26, 2);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('17/03/21', 5, 26, 3);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('08/10/21', 3, 27, 8);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('19/10/21', 33, 27, 20);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('23/02/21', 47, 28, 1);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('21/05/21', 15, 29, 15);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('23/05/21', 2, 29, 2);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('15/03/21', 32, 30, 20);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('02/05/21', 95, 31, 4);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('28/05/21', 49, 32, 8);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('14/01/21', 56, 33, 15);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('30/04/21', 56, 34, 11);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('09/02/21', 97, 35, 2);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('24/10/21', 13, 36, 7);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('20/10/21', 5, 37, 13);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('05/07/21', 2, 38, 1);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('11/03/21', 27, 39, 9);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('27/09/21', 6, 40, 18); 
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('30/11/21', 8, 41, 3);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('04/08/21', 3, 41, 8);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('02/06/21', 88, 42, 1);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('17/09/21', 20, 43, 2);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('25/03/21', 6, 43, 20);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('13/10/21', 30, 44, 10);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('26/10/21', 4, 44, 18);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('03/06/21', 103, 45, 3);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('15/05/21', 14, 45, 17);
INSERT INTO registros (reg_data_aquisicao, reg_quantidade, materiais_mat_id, fornecedores_for_id) VALUES ('22/03/21', 17, 45, 14);

    -- Tabela Funcionarios 
INSERT INTO funcionarios (fun_matricula, fun_primeiro_nome, fun_nome_meio, fun_sobrenome, fun_data_contratacao)
    WITH dados AS 
    ( 
        SELECT 123456, 'Caio', 'Henrique', 'Paulino', '20/9/21' FROM dual UNION ALL
        SELECT 234578, 'Rosangela', 'Velasco', 'Paula', '15/9/20' FROM dual UNION ALL
        SELECT 113578, 'Lidia', 'Amorin', 'França', '08/2/19' FROM dual UNION ALL
        SELECT 112288, 'Rinaldo', 'Silva', 'Fernandes', '20/4/21' FROM dual UNION ALL
        SELECT 355689, 'Arnaldo', 'Garcia', 'Camelo', '14/1/20' FROM dual UNION ALL
        SELECT 123569, 'Andre', 'Camacho', 'Biango', '19/9/20' FROM dual UNION ALL
        SELECT 234569, 'Luiza', 'Zava', 'Camargo', '25/11/18' FROM dual UNION ALL
        SELECT 356789, 'Joaquim', 'Nascimento', 'Vasconcelos', '27/8/19' FROM dual UNION ALL
        SELECT 134579, 'Nara', 'Palmas', 'Marins', '12/6/18' FROM dual UNION ALL
        SELECT 641176, 'Francielle', 'Machado', 'Sena', '16/12/20' FROM dual UNION ALL
        SELECT 996124, 'Firmino', 'Caruso', 'Barros', '30/3/19' FROM dual UNION ALL
        SELECT 623177, 'Ruan', 'Henrique', 'Santos', '08/1/21' FROM dual UNION ALL
        SELECT 532474, 'Adriana', 'Vieira', 'Rangel', '03/4/21' FROM dual UNION ALL
        SELECT 315842, 'Edna', 'Bezerra', 'Lopes', '24/11/20' FROM dual UNION ALL
        SELECT 972472, 'Pedro', 'Castilho', 'Martins', '02/12/19' FROM dual UNION ALL
        SELECT 322798, 'Devanir', 'Facre', 'Germano', '09/9/21' FROM dual UNION ALL
        SELECT 447937, 'Andressa', 'Lana', 'Penha', '15/10/21' FROM dual UNION ALL
        SELECT 456413, 'Antonio', 'Aguiar', 'Barellos', '20/2/20' FROM dual UNION ALL
        SELECT 619674, 'Erick', 'Farias', 'Regufe', '13/8/20' FROM dual UNION ALL
        SELECT 716412, 'Adelina', 'Lopes', 'Pinho', '20/1/17' FROM dual UNION ALL
        SELECT 486673, 'Rosangela', 'Aguiar', 'Carvalho', '20/3/19' FROM dual UNION ALL
        SELECT 587797, 'Dilmar', 'Barboza', 'Salles', '24/6/21' FROM dual UNION ALL
        SELECT 758394, 'Joyce', 'Silva', 'Esteves', '02/9/20' FROM dual UNION ALL
        SELECT 214955, 'Daniele', 'Temperini', 'Santos', '20/12/20' FROM dual UNION ALL
        SELECT 991795, 'Geraldo', 'Vilela', 'Padua', '28/10/18' FROM dual UNION ALL
        SELECT 219168, 'Andrea', 'Milanez', 'Branco', '04/2/21' FROM dual UNION ALL
        SELECT 573722, 'Caio', 'Theodoro', 'Viana', '13/2/17' FROM dual UNION ALL
        SELECT 116154, 'Camila', 'Matta', 'Barros', '29/5/17' FROM dual UNION ALL
        SELECT 399867, 'Maria', 'Ramos', 'Vasconcelos', '05/6/21' FROM dual UNION ALL
        SELECT 279629, 'Ana', 'Belmiro', 'Moura', '11/4/21' FROM dual UNION ALL
        SELECT 625156, 'Lucas', 'Correia', 'Fonseca', '04/12/19' FROM dual
    )
    SELECT * FROM dados;
  
             
    -- Tabela Vendas --
INSERT INTO vendas (vnd_data_hora, vnd_valor, vnd_cpf_cnpj, funcionarios_fun_id)
    WITH dados AS 
    ( 
        SELECT '20/09/21 12:30:25', 969.70, 51915047801, 1 FROM dual UNION ALL
        SELECT '1/01/21 10:20:31', 2099.90, 99020223000188, 13 FROM dual UNION ALL
        SELECT '2/02/21 15:21:01', 1709.50, 32018203000100, 3 FROM dual UNION ALL
        SELECT '3/03/21 18:00:00', 1969.3, 28486004000140, 20 FROM dual UNION ALL
        SELECT '4/08/21 13:40:27', 109.00, 75243076000147, 13 FROM dual UNION ALL
        SELECT '5/09/21 14:30:13', 20399.40, 84734439000138, 17 FROM dual UNION ALL
        SELECT '6/08/21 11:20:52', 3092.00, 63229696000142, 8 FROM dual UNION ALL
        SELECT '7/11/21 12:30:12', 804.30, 18588931000118, 8 FROM dual UNION ALL
        SELECT '8/12/21 9:00:47', 269.90, 18352409000132, 8 FROM dual UNION ALL
        SELECT '9/01/21 10:50:16', 5826.60, 27438949000124, 5 FROM dual UNION ALL
        SELECT '10/02/21 8:35:27', 2099.40, 31348554000108, 6 FROM dual UNION ALL
        SELECT '11/03/21 10:45:51', 539.80, 84197940000102, 16 FROM dual UNION ALL
        SELECT '12/08/21 12:52:01', 864.40, 01630165000100, 18 FROM dual UNION ALL
        SELECT '13/09/21 16:35:42', 5279.70, 86869723000147, 13 FROM dual UNION ALL
        SELECT '14/08/21 14:53:09', 1939.30, 39939882000190, 5 FROM dual UNION ALL
        SELECT '15/11/21 18:43:19', 1379.50, 68725446000117, 8 FROM dual UNION ALL
        SELECT '16/11/21 13:21:48', 3954.00, 25541910000102, 17 FROM dual UNION ALL
        SELECT '17/11/21 09:11:53', 7999.10, 21875880000110, 18 FROM dual UNION ALL
        SELECT '18/12/21 19:26:00', 15230.10, 27969744000175, 17 FROM dual UNION ALL
        SELECT '19/01/21 15:14:00', 1449.30, 25120406000139, 20 FROM dual UNION ALL
        SELECT '20/02/21 13:24:18', 569.70, 43058417000118, 11 FROM dual UNION ALL
        SELECT '21/03/21 17:42:42', 14683.38, 67831870000183, 12 FROM dual UNION ALL
        SELECT '22/08/21 09:21:22', 17544.30, 36732540000107, 3 FROM dual UNION ALL
        SELECT '23/09/21 19:30:22', 7995.00, 72139707000194, 14 FROM dual UNION ALL
        SELECT '24/08/21 09:34:42', 869.90, 92624749000128, 19 FROM dual UNION ALL
        SELECT '25/11/21 12:52:45', 41881.30, 43694203000138, 4 FROM dual UNION ALL
        SELECT '26/11/21 15:12:54', 21167.10, 87807333000105, 16 FROM dual UNION ALL
        SELECT '27/12/21 09:21:25', 92.554.80, 13509985000127, 4 FROM dual UNION ALL
        SELECT '28/12/21 19:31:27', 6339.92, 56465714000120, 7 FROM dual UNION ALL
        SELECT '29/12/21 14:21:51', 91388.30, 37601815000136, 3 FROM dual UNION ALL
        SELECT '30/01/21 12:41:26', 15558.40, 30100100000150, 2 FROM dual UNION ALL
        SELECT '2/01/21 16:28:46', 1999.80, 72449303000105, 20 FROM dual UNION ALL
        SELECT '4/03/21 09:11:08', 819.30, 46206576000100, 5 FROM dual UNION ALL
        SELECT '5/04/21 14:25:36', 2559.00, 88800222000130, 2 FROM dual UNION ALL
        SELECT '6/08/21 17:17:24', 1528.30, 42029308000100, 13 FROM dual UNION ALL
        SELECT '7/09/21 15:42:52', 3778.60, 33592973000116, 14 FROM dual UNION ALL
        SELECT '8/08/21 12:15:24', 17018.00, 85943285000157, 3 FROM dual UNION ALL
        SELECT '9/11/21 16:58:13', 23098.90, 51869845000159, 6 FROM dual UNION ALL
        SELECT '10/12/21 13:46:23', 999.80, 27943819000149, 8 FROM dual UNION ALL
        SELECT '11/01/21 18:02:08', 1779.90, 76252976000113, 12 FROM dual UNION ALL
        SELECT '12/02/21 19:38:14', 2033.20, 24287486000159, 16 FROM dual UNION ALL
        SELECT '14/03/21 08:58:28', 1399.60, 74679629000146, 16 FROM dual UNION ALL
        SELECT '15/04/21 10:42:46', 899.90, 54030595000157, 6 FROM dual UNION ALL
        SELECT '16/08/21 15:23:50', 14048.90, 58873766000160, 1 FROM dual UNION ALL
        SELECT '3/02/21 17:04:21', 574.50, 01121883000150, 20 FROM dual
    )
    SELECT * FROM dados;

    -- Tabela Pertencem --
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (2, 1, 1 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (1, 4, 1 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (1, 40, 2 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (4, 34, 3 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (1, 23, 3 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (3, 2, 4 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (4, 1, 4 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (1, 33, 5 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (1, 32, 5 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (1, 23, 5 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (1, 22, 5 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (6, 17, 6 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (1, 45, 7 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (7, 3, 8 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (1, 6, 9 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (2, 41, 10 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (1, 13, 10 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (2, 26, 10 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (6, 1, 11 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (2, 4, 12 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (1, 8, 13 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (4, 3, 13 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (1, 2, 13 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (3, 15, 14 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (1, 19, 15 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (2, 7, 15 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (4, 31, 15 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (3, 29, 16 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (2, 27, 16 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (6, 20, 17 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (2, 31, 18 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (4, 43, 18 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (3, 41, 18 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (1, 26, 19 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (8, 44, 19 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (5, 09, 20 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (2, 01, 20 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (3, 38, 21 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (4, 21, 22 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (7, 34, 22 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (6, 37, 22 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (10, 23, 22 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (25, 38, 23 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (32, 35, 23 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (50, 36, 24 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (1, 24, 25 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (7, 27, 26 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (80, 42, 26 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (29, 32, 27 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (52, 44, 28 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (76, 21, 29 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (54, 24, 30 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (87, 31, 30 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (20, 01, 30 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (56, 29, 30 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (6, 15, 31 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (10, 42, 31 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (2, 26, 32 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (1, 11, 33 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (2, 6, 33 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (4, 39, 33 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (7, 31, 34 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (3, 27, 34 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (17, 34, 35 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (14, 06, 36 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (9, 29, 37 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (7, 5, 37 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (4, 44, 37 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (11, 40, 38 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (2, 38, 39 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (1, 44, 40 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (6, 18, 41 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (2, 13, 41 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (4, 1, 42 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (1, 5, 43 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (3, 9, 44 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (8, 45, 44 );
INSERT INTO pertencem (per_quantidade_vendida, materiais_mat_id, vendas_vnd_id) VALUES (5, 3, 45 );