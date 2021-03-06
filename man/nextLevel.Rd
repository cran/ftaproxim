% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nextLevel.R
\name{nextLevel}
\alias{nextLevel}
\title{Proxels of the next time step}
\usage{
nextLevel(BE, proxel, delta)
}
\arguments{
\item{BE}{a list containing states, transition matrix, distributions and their parameters for a basic event}

\item{proxel}{a data frame containing a state, age intensity and a probability.}

\item{delta}{a numeric value as time step}
}
\value{
a data frame where each row is a proxel
}
\description{
For a given basic event and a proxel, this function
calculates all the possible proxels for the next time step.
}
\examples{
#A multi-state basic event with Weibull(2, 3) transition distribution function
#from working (OK) to an Intermediate State (IS), a fixed time of 0.5 transtion
#from IS to failure (F), and a fixed repair time of 0.1 (transition from state F to state OK).
delta <- 0.1
BE <- list(
  states = c("OK", "IS", "F"),
  G = rbind(
    c(NA, 1, 0),
    c(0, NA, 1),
    c(1, 0, NA)
  ),
  dist = c("weibull", "unif", "unif"),
  param = list(c(2, 3), c(0.5 - delta, 0.5 + delta), c(0.1 - delta, 0.1 + delta))
)
proxel <- data.frame(State = "IS", ageInt = 0.1, Prob = 0.9)
delta <- 0.1
nextLevel(BE, proxel, delta)

}
