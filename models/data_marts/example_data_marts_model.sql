{{ config(materialized='table', schema='data_marts') }}

-- Пример модели для схемы data_marts
-- Эта модель будет создана в базе данных data_marts в схеме data_marts

SELECT 
    1 as id,
    'example_data' as name,
    now() as created_at

UNION ALL

SELECT 
    2 as id,
    'another_example' as name,
    now() as created_at