with fechas as (

    select distinct
        fecha_venta as fecha
    from {{ ref('stg_venta') }}
    where fecha_venta is not null

)

select
    {{ dbt_utils.generate_surrogate_key(['fecha']) }} as fecha_key,
    fecha,
    extract(year from fecha) as anio,
    extract(month from fecha) as mes,
    extract(day from fecha) as dia,
    extract(quarter from fecha) as trimestre
from fechas
