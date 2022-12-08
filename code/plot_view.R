#!/usr/bin/env Rscript

args <- commandArgs(trailingOnly=TRUE)

if (length(args) < 1){
  message("Please provide the the stats.csv file")
  quit(status = 1)
}

suppressPackageStartupMessages(library(tidyverse))
theme_set(theme_minimal())

views <- read_csv(args[1])

views$day <- factor(
  weekdays(views$date),
  levels = c('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')
)
views$weekend <- grepl(pattern = "^S", x = views$day)
views$month <- factor(months(views$date), levels = month.name)
views$quarter <- factor(quarters(views$date))
views$year <- factor(format(views$date, "%Y"))

p <- ggplot(slice_tail(views, n = 30), aes(date, views, fill = weekend)) +
  geom_col() +
  scale_x_date(date_breaks = "1 day") +
  scale_fill_manual(values = c("skyblue", "grey")) +
  coord_flip() +
  theme(axis.title.y = element_blank()) +
  ggtitle(paste0("Site views in the last 30 days as of "), Sys.time()) +
  NULL

ggsave("output/views.png", p)
quit()
