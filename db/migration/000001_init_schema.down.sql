DROP TABLE IF EXISTS entries;
DROP TABLE IF EXISTS transfers;
DROP TABLE IF EXISTS accounts;  
-- 必须drop entries和transfers在accounts之前，因为entries和transfers中存在引用accounts的外键
