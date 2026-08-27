select
    codigo,
    trim(nombre) as nombre,
    cast(precio as decimal(12, 2)) as precio
from {{ source('postgres_oltp', 'producto') }}
