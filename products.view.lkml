view: products {
  sql_table_name: demo_db.products ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    label: "Marca"
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

dimension: prime_rank{
  description: "The first 100 brands most bought from"
  case: {
    when: {
      sql: ${rank} <= 100 ;;
      label: "prime"
    }
    else: "standard_rank"
  }
}
  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

measure: sum_retail_price {
  type: sum
  sql: ${retail_price} ;;
  value_format_name: eur_0
}

  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }
}
