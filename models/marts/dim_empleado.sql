select
    {{ dbt_utils.generate_surrogate_key(['id_empleado']) }} as empleado_key,
    id_empleado as empleado_id,
    nombre,
    apellidos,
    cargo
from {{ ref('stg_empleado') }}
