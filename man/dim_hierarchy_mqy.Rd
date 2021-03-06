% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pivot-drill.R
\name{dim_hierarchy_mqy}
\alias{dim_hierarchy_mqy}
\title{Builds a date hierarchy dimension}
\usage{
dim_hierarchy_mqy(x)
}
\arguments{
\item{x}{A date variable}
}
\description{
Builds a date hierarchy dimension
}
\details{
Helper function that creates the unevaluated code that creates the
year, quarter and month on the fly.
}
\examples{

retail_orders \%>\%
  pivot_columns(order_date = dim_hierarchy_mqy(orderdate)) \%>\%
  pivot_values(n()) \%>\%
  pivot_drill(order_date)
}
