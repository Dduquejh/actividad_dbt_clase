with ventas as (

    select
        nro,
        fecha_venta
    from {{ ref('stg_venta') }}

),

ordenes as (

    select
        nro,
        cc,
        id_empleado
    from {{ ref('stg_orden_venta') }}

),

detalle as (

    select
        codigo,
        nro,
        descuento,
        cantidad
    from {{ ref('stg_orden_productos') }}

),

productos as (

    select
        codigo,
        precio
    from {{ ref('stg_producto') }}

)

select
    {{ dbt_utils.generate_surrogate_key([
        'd.nro',
        'd.codigo'
    ]) }} as venta_key,

    dc.cliente_key,
    de.empleado_key,
    dp.producto_key,
    df.fecha_key,

    d.nro as orden_id,
    d.codigo as producto_id,

    d.cantidad,
    p.precio as precio_unitario,
    d.descuento,

    d.cantidad * p.precio as valor_bruto,

    (d.cantidad * p.precio) * d.descuento as valor_descuento,

    (d.cantidad * p.precio)
        - ((d.cantidad * p.precio) * d.descuento) as valor_neto

from ventas v

inner join ordenes o
    on v.nro = o.nro

inner join detalle d
    on o.nro = d.nro

inner join productos p
    on d.codigo = p.codigo

inner join {{ ref('dim_cliente') }} dc
    on o.cc = dc.cliente_id

inner join {{ ref('dim_empleado') }} de
    on o.id_empleado = de.empleado_id

inner join {{ ref('dim_producto') }} dp
    on d.codigo = dp.producto_id

inner join {{ ref('dim_fecha') }} df
    on v.fecha_venta = df.fecha
