# Data visualization on IMDB dataset
library(readxl)
data1 <- read_excel("D:\\R studio\\5th july\\Combined IMDB dataset.xlsx")
data1
#Pie chart
# Count the frequency of each Base value
rating_counts <- table(data1$rating)

# Create a pie chart
pie(rating_counts, 
    labels = paste(names(rating_counts), round(100 * rating_counts / sum(rating_counts), 1), "%"), 
    main = "Distribution of rating Values", 
    col = rainbow(length(rating_counts)))

#Bar chart

data1$rating <- factor(data1$rating)

ggplot(data1, aes(x = rating,fill = rating)) +
  geom_bar() +
  scale_fill_manual(values = c("0.5" = "skyblue", "1" = "red", "1.5" = "blue","2" = "pink","2.5" = "orange","3" = "darkblue","3.5" = "yellow","4" = "black","4.5" = "grey","5" ="violet")) +
  labs(title = "Number movie id by ratings", x = "rating", y ="Count")

# Line graph
ggplot(data1, aes(x = rating, y = movieId)) +
  geom_line(color = "blue") +
  labs(title = "IMDB Rating Over movieid",
       x = "rating",
       y = "movieId") +
  theme_minimal()


# Step 2: Load the libraries
library(readxl)
library(treemap)
library(dplyr)

colnames(data1)

# Count the number of records for each Base
genres_counts <- as.data.frame(table(data1$genres))
colnames(genres_counts) <- c("genres", "Count")

# Create the treemap
treemap(genres_counts,
        index = "genre",       # Column to group by
        vSize = "Count",      # Size of each tile
        title = "Treemap of Uber Trips by genre",
        palette = "Set2",     # Color palette
        border.col = "white") # Tile border color

plot(data1$rating, type = "l" , main = "Line plot of rating",xlab = "movieId",ylab = "rating")
plot(data1$rating,data1$movieId,main = "rating vs movieId", xlab = "rating",ylab = "movieId")

#histogram
hist(data1$rating, main = "Histogram of ratings", xlab = "rating")

library(plotrix)


genres_counts <- data1 %>%
  count(genres)

genres_counts <- genres_counts %>%
  mutate(perc = round(100 * n / sum(n), 1),
         label = paste0(Base, " (", perc, "%)"))

ggplot(genres_counts, aes(x = 2, y = n, fill = genres)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y") +
  xlim(0.5, 2.5) +  # creates the donut hole
  theme_void() +
  geom_text(aes(label = label), 
            position = position_stack(vjust = 0.5), size = 4) +
  ggtitle("Donut Chart of genres Values") +
  theme(legend.position = "none")

