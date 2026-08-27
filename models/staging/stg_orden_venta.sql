select
    nro,
    fecha_solicitud,
    trim(domicilio) as domicilio,
    cc,
    id_empleado
from {{ source('postgres_oltp', 'orden_venta') }}
