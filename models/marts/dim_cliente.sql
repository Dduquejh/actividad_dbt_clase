select
    {{ dbt_utils.generate_surrogate_key(['cc']) }} as cliente_key,
    cc as cliente_id,
    nombre,
    apellidos,
    telefono
from {{ ref('stg_cliente') }}
