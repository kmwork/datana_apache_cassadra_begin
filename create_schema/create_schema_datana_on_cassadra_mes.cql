-- таблица значений с химией
--drop  table datana_test.mes_data;
CREATE TABLE datana_test.mes_data
(
    request_uuid UUID, /** id запроса на шлюз на один dataset */
    request_time TIMESTAMP, /** время когда считали данные с mes */
    mes_value map<ascii, decimal>, /* имя переменой переменной  и ее значение */
    PRIMARY KEY (request_uuid)
);
