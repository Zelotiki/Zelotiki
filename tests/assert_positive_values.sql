-- Тест для проверки, что в маркетинговых кампаниях бюджет больше 0
SELECT *
FROM {{ ref('example_marketing_model') }}
WHERE budget <= 0