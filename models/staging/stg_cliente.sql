select
    cc,
    trim(nombre) as nombre,
    trim(apellidos) as apellidos,
    trim(telefono) as telefono
from {{ source('postgres_oltp', 'cliente') }}
