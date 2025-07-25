# DBT ClickHouse Multi-Schema Project

Этот проект настроен для работы с двумя схемами ClickHouse:
- `data_marts` - основная схема для витрин данных
- `marketing` - схема для маркетинговых данных

## Структура проекта

```
├── models/
│   ├── data_marts/           # Модели для схемы data_marts
│   │   ├── schema.yml
│   │   └── example_data_marts_model.sql
│   └── marketing/            # Модели для схемы marketing
│       ├── schema.yml
│       └── example_marketing_model.sql
├── macros/
│   └── get_custom_schema.sql # Макрос для управления схемами
├── dbt_project.yml          # Основная конфигурация проекта
├── profiles.yml             # Конфигурация подключений
└── requirements.txt         # Python зависимости
```

## Установка

1. Установите зависимости:
```bash
pip install -r requirements.txt
```

2. Скопируйте и настройте переменные среды:
```bash
cp .env.example .env
```

## Использование

### Запуск моделей для конкретной схемы

Для запуска моделей data_marts:
```bash
dbt run --target data_marts --models data_marts
```

Для запуска моделей marketing:
```bash
dbt run --target marketing --models marketing
```

### Запуск всех моделей
```bash
dbt run
```

### Тестирование
```bash
dbt test
```

### Создание документации
```bash
dbt docs generate
dbt docs serve
```

## Конфигурация схем

В файле `dbt_project.yml` настроена конфигурация для двух схем:

```yaml
models:
  clickhouse_project:
    data_marts:
      +materialized: table
      +schema: data_marts
    marketing:
      +materialized: table
      +schema: marketing
```

## Добавление новых моделей

### Для схемы data_marts:
1. Создайте SQL файл в `models/data_marts/`
2. Добавьте конфигурацию: `{{ config(materialized='table', schema='data_marts') }}`

### Для схемы marketing:
1. Создайте SQL файл в `models/marketing/`
2. Добавьте конфигурацию: `{{ config(materialized='table', schema='marketing') }}`

## Подключения ClickHouse

Проект настроен для работы с двумя выходами (outputs):
- `data_marts` - подключение к базе данных data_marts
- `marketing` - подключение к базе данных marketing

Оба используют одинаковые учетные данные, но разные базы данных и схемы.