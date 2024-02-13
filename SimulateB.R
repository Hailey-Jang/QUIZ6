```{r}
install.packages("e1071")
library(e1071)
```

```{r}
set.seed(123)

subscriber_ids <- 1:1000

comments <- rpois(1000, lambda = 2)  # Average 2 comments per year

subscriber_data <- data.frame(Subscriber_ID = subscriber_ids, Number_of_Comments_Posted = comments)

head(subscriber_data)
```

```{r}
# Plot histogram to visualize the distribution of comments
hist(subscriber_data$Number_of_Comments_Posted, breaks = 20, main = "Distribution of Comments Posted", xlab = "Number of Comments", ylab = "Frequency")
```

```{r}
# Boxplot to identify outliers
boxplot(subscriber_data$Number_of_Comments_Posted, main = "Boxplot of Number of Comments Posted", ylab = "Number of Comments")
```

```{r}
# Calculate mean number of comments
mean_comments <- mean(subscriber_data$Number_of_Comments_Posted)
mean_comments
```

```{r}
# Calculate variance of comments
var_comments <- var(subscriber_data$Number_of_Comments_Posted)
var_comments
```

```{r}
# Calculate skewness of comments
skewness_comments <- skewness(subscriber_data$Number_of_Comments_Posted)
skewness_comments
```
