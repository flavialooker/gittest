view: order_items {
  sql_table_name: demo_db.order_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: product_ID {
    type: number
    sql: ${products.id} ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  measure: highest_sale_order {
    type: max
    sql: ${sale_price} ;;
    value_format_name: eur_0
  }

  measure: Average {
    type: average
    sql: ${sale_price} ;;
    value_format_name: eur
  }

measure: test_number_measure  {
  type: number
  value_format_name: percent_2
  sql: ${highest_sale_order}/${Average} ;;
}

  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }
}
