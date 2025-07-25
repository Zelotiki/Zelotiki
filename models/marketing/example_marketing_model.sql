{{ config(materialized='table', schema='marketing') }}

-- Пример модели для схемы marketing
-- Эта модель будет создана в базе данных marketing в схеме marketing

SELECT 
    1 as id,
    'Google Ads Campaign' as campaign_name,
    'PPC' as campaign_type,
    1000.00 as budget,
    now() as created_at

UNION ALL

SELECT 
    2 as id,
    'Facebook Campaign' as campaign_name,
    'Social Media' as campaign_type,
    750.00 as budget,
    now() as created_at