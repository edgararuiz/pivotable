#' Manipulate pivot tables
#'
#' @param .data A data.frame or a pivot_prep object
#' @param ...   Variables or calculation to group by
#' @name rows-cols

#' @rdname rows-cols
#'
#' @examples
#'
#' retail_orders %>%
#'   pivot_rows(status) %>%
#'   pivot_columns(country) %>%
#'   pivot_values(total_sales = sum(sales))
#'
#' @export
pivot_rows <- function(.data, ...) {
  set_cat(.data, "rows", ...)
}

#' @rdname rows-cols
#' @export
pivot_columns <- function(.data, ...) {
  set_cat(.data, "columns", ...)
}

#' Filter a pivot table
#'
#' @param .data A data.frame or a pivot_prep object
#' @param ...   Variables or calculation to group by
#'
#' @examples
#'
#' retail_orders %>%
#'   pivot_rows(status) %>%
#'   pivot_columns(country) %>%
#'   pivot_values(total_sales = sum(sales)) %>%
#'   pivot_focus(
#'     country %in% c("Japan", "USA", "UK"),
#'     status == "Shipped",
#'     total_sales > 200000
#'   )
#' @export
pivot_focus <- function(.data, ...) {
  set_cat(.data, "focus", ...)
}

#' Add an aggregation to a pivot table
#'
#' @param .data A data.frame or a pivot_prep object
#' @param ...   Variables or calculation to aggregate by
#'
#' @examples
#'
#' retail_orders %>%
#'   pivot_rows(status) %>%
#'   pivot_values(n())
#' @export
pivot_values <- function(.data, ...) {
  set_cat(.data, "values", ...)
}

#' Control if the totals will display when printed
#'
#' @param .data A data.frame or a pivot_prep object
#' @param include_column_totals Indicates if the column totals are included in the pivot table
#' @param include_row_totals Indicates if the row totals are included in the pivot table
#'
#' @examples
#'
#' retail_orders %>%
#'   pivot_rows(status, country) %>%
#'   pivot_values(n()) %>%
#'   pivot_totals(include_row_totals = FALSE)
#' @export
pivot_totals <- function(.data,
                         include_column_totals = TRUE,
                         include_row_totals = TRUE) {
  set_cat(
    .data,
    "totals",
    include_column = !!include_column_totals,
    include_row = !!include_row_totals
  )
}
