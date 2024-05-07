CREATE TABLE tb_audit_log (
    id_audit INT PRIMARY KEY IDENTITY(1,1),
    table_name VARCHAR(50) NOT NULL,
    operation_type VARCHAR(50) NOT NULL,
    timestamp DATETIME NOT NULL DEFAULT GETDATE(),
    username VARCHAR(50) NOT NULL,
    old_data XML,
    new_data XML
)

CREATE INDEX idx_audit ON tb_audit_log(id_audit);