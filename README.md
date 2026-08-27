Se crea usando ambiente de conda tal como fue especificado en la actividad

``` bash
conda create -n actividad_dbt python=3.12 -y
conda activate actividad_dbt
pip install dbt-duckdb

dbt --version
dbt init ventas_dbt
cd ventas_dbt
```


Se agrega también el archivo consultar_duckdb.py para ver la estructura de la salida de ventas_olap.duckdb


Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
