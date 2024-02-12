library(ggplot2)

simulate_efficiency <- function(num_hours = 8, num_employees = 2, opening_hour = 9, closing_hour = 17) {
  hours <- seq(opening_hour, closing_hour)
  employees <- seq(1, num_employees)
  data <- list()
  
  for (hour in hours) {
    for (employee in employees) {
      # Simulate number of customers served as a random number between 3 and 10
      customers_served <- sample(3:10, 1)
      data <- c(data, list(c(employee, hour, customers_served)))
    }
  }
  
  df <- as.data.frame(do.call(rbind, data))
  colnames(df) <- c('employee_id', 'hour', 'customers_served')
  return(df)
}

# Test
conduct_tests <- function(df) {
  # Test 1: Check the average number of customers served per hour for each employee
  avg_customers_per_hour <- tapply(df$customers_served, df$employee_id, mean)
  cat("Test 1: Average number of customers served per hour for each employee:\n")
  print(avg_customers_per_hour)
  
  # Test 2: Check the total number of customers served by each employee throughout the day
  total_customers_served <- tapply(df$customers_served, df$employee_id, sum)
  cat("\nTest 2: Total number of customers served by each employee throughout the day:\n")
  print(total_customers_served)
  
  # Test 3: Check the overall efficiency of each employee (total customers served divided by total hours)
  total_hours <- length(unique(df$hour))
  total_customers <- sum(df$customers_served)
  efficiency <- total_customers / (total_hours * length(unique(df$employee_id)))
  cat("\nTest 3: Overall efficiency of each employee:\n")
  print(efficiency)
  
  # Test 4: Check the correlation between the number of customers served by each employee
  correlation <- cor.test(df$customers_served, df$employee_id)$estimate
  cat("\nTest 4: Correlation between the number of customers served by each employee:\n")
  print(correlation)
  
  # Test 5: Visualize the data
  cat("\nTest 5: Visualizing the simulated data:\n")
  ggplot(df, aes(x = hour, y = customers_served, color = factor(employee_id))) +
    geom_point() +
    labs(x = "Hour", y = "Number of Customers Served", color = "Employee ID") +
    ggtitle("Efficiency of Employees") +
    theme_minimal()
}


simulated_data <- simulate_efficiency()

conduct_tests(simulated_data)
