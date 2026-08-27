select
    nro,
    fecha_venta,
    trim(descripcion) as descripcion
from {{ source('postgres_oltp', 'venta') }}
