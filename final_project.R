dat <- read.csv("data.csv",header = TRUE)
head(dat)
final_project<-subset(dat, dat$country == "Honduras"| dat$country == "Germany"| dat$country == "Japan")
head(final_project)
analyze <- function(countr) {
  country_data <- subset(final_project, final_project$country == countr)
  plot(country_data$year, country_data$gdpPercap , xlab = "Year", ylab= "gdpPercap", main=countr)
}
analyze("Germany") 
analyze("Japan")   
analyze("Honduras")
