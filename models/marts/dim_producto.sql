select
    {{ dbt_utils.generate_surrogate_key(['codigo']) }} as producto_key,
    codigo as producto_id,
    nombre,
    precio
from {{ ref('stg_producto') }}


