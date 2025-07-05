#Data visualization with R 
plot(mtcars$mpg, type = "l" , main = "Line plot of MPG",xlab = "Index",ylab = "MPG")
plot(mtcars$mpg,mtcars$hp,main = "MPG Vs HP", xlab = "MPG",ylab = "Horsepower")

barplot(mtcars$cyl, main = "Count of cylinders")

pie(table(mtcars$cyl), main = "Count of cylinder")

hist(mtcars$mpg, main = "Histogram of MPG", xlab = "MPG")    
library(ggplot2)
ggplot(mtcars, aes(x = mpg,y = hp)) + geom_point()
labs("MPG vs HP")

ggplot(mtcars, aes(x = factor(cyl))) +geom_bar() +
  labs(title ="Number of Cars per cylinder Group")

mtcars$cyl <- factor(mtcars$cyl)

ggplot(mtcars, aes(x = cyl,fill = cyl)) +
         geom_bar() +
         scale_fill_manual(values = c("4" = "skyblue", "6" = "red", "8" = "blue")) +
         labs(title = "Number of cars by Cylinder", x = "Cylinders", y ="Count")

mtcars$cyl
       
ggplot(mtcars, aes(x = hp,fill = hp)) +
  geom_bar() +
  labs(title = "Number of cars by hp", x = "hp", y ="Count")
theme_minimal()

# Line graph
mtcars$cyl

ggplot2::ggplot(mtcars, aes(x = seq_along(mpg), y = mpg)) +
  geom_line(color = "darkgreen",size = 1) + 
  geom_point(color="red") +
  geom_text(aes(label = round(mpg, 1)), vjust = -0.5,size = 5) +
  labs(
    title = "Mile_per Gallon by Model",
    x="Index",
    y="MPG") +
  theme_classic()

x = -10:10
y = -10:10

z_func <- function(x,y) sqrt(x^2 + y^2)
z <- outer(x,y,z_func)

persp(x,y,z,
      xlab = "X Axis", ylab = "Y Axis", zlab = "Z Axis",
      main = "3D surface Plot",
      col = "lightblue",shade =0.5, theta = 30, phi = 15)

library(rgl)

x <- rnorm(100)
y <- rnorm(100)
z <- rnorm(100)

plot3d(x,y,z, col = "red", size = 5)

# Data visualization on the uber dataset
Uber_dataset= uber.raw.data.jul14
str(Uber_dataset)
nrow(Uber_dataset)
ncol(Uber_dataset)
summary(Uber_dataset)
barplot(Uber_dataset$Lat, main = "Count of lat")
plot(Uber_dataset$Lat,Uber_dataset$Lon,main = "Lat vs Lon", xlab = "Lat",ylab = "Lon")
plot(Uber_dataset$Date.Time, type = "l" , main = "Date with respect to Longitude",xlab = "Date.Time",ylab = "Lon")
library(ggplot2)
hist(Uber_dataset$Lat, main = "Histogram of Lat", xlab = "Lat")
hist(Uber_dataset$Lon, main = "Histogram of Lon", xlab = "Lon")

ggplot(Uber_dataset, aes(x = Lat,y = Lon)) + geom_point()
labs("Lat vs Lon")

ggplot(Uber_dataset, aes(x = factor(Base))) +geom_bar() +
  labs(title ="Number of bases in Uber dataset")

ggplot(Uber_dataset, aes(x = Base,fill = Base)) +
  geom_bar() +
  scale_fill_manual(values = c("B02512" = "skyblue", "B02598" = "red", "B02617" = "blue","B02682" = "brown")) +
  labs(title = "Number of cars by Cylinder", x = "Base", y ="Count")

df <- read.csv("uber-raw-data-jul14.csv")

# Count the frequency of each Base value
base_counts <- table(df$Base)

# Create a pie chart
pie(base_counts, 
    labels = paste(names(base_counts), round(100 * base_counts / sum(base_counts), 1), "%"), 
    main = "Distribution of Base Values", 
    col = rainbow(length(base_counts)))

library(dplyr)

# Load required libraries
library(ggplot2)
library(dplyr)
library(lubridate)

# Read the CSV file
df <- read.csv("uber-raw-data-jul14.csv")

# Convert the Date/Time column to proper datetime format
df$Date.Time <- mdy_hms(df$Date.Time)

# Extract date part only
df$Date <- as.Date(df$Date.Time)

# Count trips per day
daily_trips <- df %>%
  group_by(Date) %>%
  summarise(Trips = n())

# Plot dotted line chart
ggplot(daily_trips, aes(x = Date, y = Trips)) +
  geom_line(linetype = "dotted", color = "blue", size = 2) +
  labs(title = "Daily Uber Trips (Dotted Line Chart)",
       x = "Date",
       y = "Number of Trips") +
  theme_minimal()

#Donut chart

# Summarize the counts for each Base
base_counts <- df1 %>%
  count(Base)

# Calculate percentage
base_counts <- base_counts %>%
  mutate(perc = round(100 * n / sum(n), 1),
         label = paste0(Base, " (", perc, "%)"))

# Create the donut chart
ggplot(base_counts, aes(x = 2, y = n, fill = Base)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y") +
  xlim(0.5, 2.5) +  # creates the donut hole
  theme_void() +
  geom_text(aes(label = label), 
            position = position_stack(vjust = 0.5), size = 4) +
  ggtitle("Donut Chart of Base Values") +
  theme(legend.position = "none")

# Tree map
library(treemap)


# Count the number of records for each Base
base_counts <- as.data.frame(table(df2$Base))
colnames(base_counts) <- c("Base", "Count")

# Create the treemap
treemap(base_counts,
        index = "Base",       # Column to group by
        vSize = "Count",      # Size of each tile
        title = "Treemap of Uber Trips by Base",
        palette = "Set2",     # Color palette
        border.col = "white") # Tile border color



