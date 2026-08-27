select
    id_empleado,
    trim(nombre) as nombre,
    trim(apellidos) as apellidos,
    trim(cargo) as cargo
from {{ source('postgres_oltp', 'empleado') }}
