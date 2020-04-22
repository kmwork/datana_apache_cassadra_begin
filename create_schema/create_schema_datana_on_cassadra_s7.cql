-- создание бд без реплик по простому
create keyspace datana_test WITH replication = {'class':'SimpleStrategy', 'replication_factor' : 1};

-- переход в бд датаны
use datana_test;
-- ====================================
--создание табилцы для Сименс датчиков
-- ====================================

-- таблица значений с датчиков
--drop  table datana_test.s7_plc_gateway;
CREATE TABLE datana_test.s7_plc_gateway
(
    request_uuid UUID, /** id запроса на шлюз на один dataset */
    controller_id int, /* id контроллера  */
    readed_time TIMESTAMP, /** время когда считали данные с контроллера */
    data_value map<int, decimal>, /* dataset_id переменной  и ее значение */
    PRIMARY KEY (controller_id, request_uuid)
);

-- Настройки соединения с контроллерами (заимствовано из PostgreSQL)
-- drop table datana_test.s7_plc_controllers;
CREATE TABLE datana_test.s7_plc_controllers
(
    id bigint PRIMARY KEY,       /* Идентификатор */
    controller_name ascii,   /* 'Наименование контроллера' */
    rack tinyint,               /* Корзина */
    slot tinyint,               /* Место в корзине */
    ip inet,                    /* IP адрес контроллера */
    write_enable boolean,       /* Разрешить запись в dbblock контроллера */
    permanent_connection boolean,       /* Удерживать постоянное соединение */
    timeout int                 /* Время таймаута для повторного соединения в мс */
);

-- Таблица описания контроллеров и датчиков (заимствовано из PostgreSQL)
CREATE TABLE datana_test.s7_controllers_dataset
(
    dataset_id bigint,      /* Внутренний идентификатор записи */
    description text,       /* Описание данных в контроллере */
    unit_id int,            /* Идентификатор агрегата */
    controller_id int,      /* Идентификатор контроллера */
    data_block int,         /* Номер дата блока */
    data_type ascii,        /* Тип данных дата блоке */
    data_offset int,        /* Сдвиг в байтах относительно начала блока данных */
    bitmask ascii,          /* Маска бита, который нужно получить */
    sign boolean,           /* Знаковое число (может быть минус) */
    PRIMARY KEY (controller_id, dataset_id)
);

