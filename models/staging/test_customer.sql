select
    cc,
    nombre,
    apellidos,
    telefono
from {{ source('postgres_oltp', 'cliente') }}
