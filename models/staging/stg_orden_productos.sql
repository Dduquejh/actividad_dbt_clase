select
    codigo,
    nro,
    cast(descuento as decimal(5, 2)) as descuento,
    cantidad
from {{ source('postgres_oltp', 'orden_productos') }}
