library(tidyverse)
library(rvest)
library(plyr)
library(XML)
library(RCurl)
library(rvest)
library(dplyr)
library(stringr)

webpage <- read_html("https://www.cbssports.com/college-basketball/bracketology/")
table <- html_nodes(webpage, xpath = '//*[@id="page-content"]/div/div/div[2]/div/div/div[1]/div/div/div[1]/div/div/div[1]/div/div[2]/section/div[1]')
colleges <- html_table(xml_child(xml_child(xml_child(table[[1]], 1), 3), 3), fill=TRUE)

# Get rid of team records in the parentheses.
# Scrape team logos

images_html <- read_html("https://www.cbssports.com/college-basketball/bracketology/")
images <- images_html %>% 
  html_nodes(".tournament-section.tournament-section-predictions")%>%
  html_nodes(".table-base.has-border-full.has-row-span-hover.has-cell-padding-default")%>%
  html_nodes(".cell-border-left")%>%
  html_nodes("a")%>%
  html_nodes("figure")%>%
  html_nodes("img")%>%
  html_attr("data-lazy")

colleges_w_images <- cbind.data.frame(colleges, images)

colleges_w_images <- colleges_w_images%>%
  select("Team", "images")%>%
  mutate(Team = gsub("[(][0-9]{1,}-[0-9]{1,}[)]", "", Team))


MTeamSpellings <- read.csv("data/MTeamSpellings.csv")

MTeamSpellings <- MTeamSpellings %>%
  mutate(TeamNameSpelling = str_to_title(TeamNameSpelling))


colleges_w_images <- colleges_w_images %>%
  mutate(Team = str_to_title(Team))%>%
  mutate(Team = if_else(Team == "Okla. St.", "Oklahoma State", Team))%>%
  mutate(Team = if_else(Team == "W. Virginia", "West Virginia", Team))%>%
  mutate(Team = if_else(Team == "Va. Tech", "Virginia Tech", Team))%>%
  mutate(Team = if_else(Team == "N. Carolina", "North Carolina", Team))%>%
  mutate(Team = if_else(Team == "Ga. Tech", "Georgia Tech", Team))%>%
  mutate(Team = if_else(Team == "Loyola Chi.", "Loyola Chicago", Team))%>%
  mutate(Team = if_else(Team == "St. Bona.", "St. Bonaventure", Team))%>%
  mutate(Team = if_else(Team == "E. Washington", "Eastern Washington", Team))%>%
  mutate(Team = if_else(Team == "Abilene Chr.", "Abilene Christian", Team))%>%
  mutate(Team = if_else(Team == "Clev. St.", "Cleveland State", Team))%>%
  mutate(Team = if_else(Team == "App. St.", "Appalachian State", Team))%>%
  mutate(Team = if_else(Team == "Texas So.", "Texas Southern", Team))

colleges <- left_join(colleges_w_images, MTeamSpellings, by = c("Team" = "TeamNameSpelling"))

seeding <- MTeamSpellings <- read.csv("data/MNCAATourneySeeds.csv")
seeding <- seeding %>%
  filter(Season == 2021)

colleges <- left_join(colleges, seeding, by="TeamID")
colleges <- colleges %>%
  filter(!is.na(Seed))


suppressWarnings(suppressMessages(devtools::install_github("dhutexas/collegehoops", dep = FALSE)))
library(collegehoops)
options(repr.plot.width = 14, repr.plot.height = 8)
bracket = collegehoops::parse_bracket("data/preds_to_send.csv", year = '2021')
outcomes <- full_join(colleges, bracket, by=c("TeamID" = "winner"))
outcomes <- rbind.fill(outcomes, colleges)
outcomes <- outcomes %>%
  distinct()


