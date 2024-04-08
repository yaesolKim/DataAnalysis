# Load necessary libraries
library(ggplot2)
library(readxl)
library(RColorBrewer)

# normality test with data type B
check_normality_B <- function(dataset, group1, group2, qu, data) {

  #data1 <- subset(dataset, condition_abb == group1 & question_abb == qu)[[data]]
  #data2 <- subset(dataset, condition_abb == group2 & question_abb == qu)[[data]]

  data1 <- subset(dataset, condition_abb == group1 & question == qu)[[data]]
  data2 <- subset(dataset, condition_abb == group2 & question == qu)[[data]]

 ## Shapiro-Wilk Test for Normality
 shapiro_test1 <- shapiro.test(data1)
 shapiro_test2 <- shapiro.test(data2)

 ## Extract the p-value from the test result
 p_value1 <- shapiro_test1$p.value
 p_value2 <- shapiro_test2$p.value

 # Check if the data is normally distributed based on the p-value
 if (p_value1 > 0.05) {
   print("The data1 is normally distributed (p > 0.05), do the t test")
   print(shapiro_test1)
 } else {
   print("The data1 is not normally distributed (p <= 0.05)")
   print(shapiro_test1)
 }

  if (p_value2 > 0.05) {
   print("The data2 is normally distributed (p > 0.05), do the t test")
    print(shapiro_test2)
 } else {
   print("The data2 is not normally distributed (p <= 0.05)")
   print(shapiro_test2)
 }
  }





# normality test with data type A
check_normality_A <- function(dataset, group1, group2, data) {

  data1 <- subset(dataset, condition == group1)[[data]]
  data2 <- subset(dataset, condition == group2)[[data]]

 ## Shapiro-Wilk Test for Normality
 shapiro_test1 <- shapiro.test(data1)
 shapiro_test2 <- shapiro.test(data2)

 ## Extract the p-value from the test result
 p_value1 <- shapiro_test1$p.value
 p_value2 <- shapiro_test2$p.value

 # Check if the data is normally distributed based on the p-value
 if (p_value1 > 0.05) {
   print("The data1 is normally distributed (p > 0.05), do the t test")
   print(shapiro_test1)
 } else {
   print("The data1 is not normally distributed (p <= 0.05)")
   print(shapiro_test1)
 }

  if (p_value2 > 0.05) {
   print("The data2 is normally distributed (p > 0.05), do the t test")
    print(shapiro_test2)
 } else {
   print("The data2 is not normally distributed (p <= 0.05)")
   print(shapiro_test2)
 }
}

# t-test : 두 그룹 평균 비교
# Independent t test: 독립된 두 그룹 간 평균 비교
# Paired T test: 동일 개체 혹은 동일 단위의 두 관측치 간 평균 비교
t_test_A <- function(dataset, group1, group2, data) {
  data1 <- subset(dataset, condition == group1)[[data]]
  data2 <- subset(dataset, condition == group2)[[data]]

  result <- t.test(data1, data2)

  t_test_table <- data.frame(
  Statistics = c("t", "df", "p-value", "Mean of data1", "Mean of data2"),
  Values = c(sprintf("%.2f", result$statistic), sprintf("%.2f",result$parameter), sprintf("%.2f", result$p.value), sprintf("%.2f", mean(group1, na.rm = TRUE)), sprintf("%.2f", mean(group2, na.rm = TRUE)))
  )
  print(t_test_table)

}

t_test <- function(group1, group2, label_1, label_2, doc_title) {

  result <- t.test(group1, group2)
  t_test_table <- data.frame(
  Statistics = c("t", "df", "p-value", label_1, label_2),
  Values = c(sprintf("%.2f", result$statistic), sprintf("%.2f",result$parameter), sprintf("%.2f", result$p.value), sprintf("%.2f", mean(group1, na.rm = TRUE)), sprintf("%.2f", mean(group2, na.rm = TRUE)))
  )
  print(t_test_table)

}


# ANOVA: 세 개 이상의 그룹 평균 비교
# one way anova: 하나의 독립 변수를 기준으로 비교
# two way anova: 두개 이상의 변수를 고려하여 그룹 비교
# RM anova
anova <- function(gropu1, group2, label_1, label_2, doc_title) {
}

# Non parametric method: 데이터가 정규분포를 따르지 않거나 등분산성을 만족하지 않을 때.
# wilcoxon rank-sum test

wilcox_test_A <- function(dataset, group1, group2, data) {

  data1 <- subset(dataset, condition == group1)[[data]]
  data2 <- subset(dataset, condition == group2)[[data]]
  wilcox.test(data1, data2)
}

wilcox_test_B <- function(dataset, group1, group2, qu, data) {

#  data1 <- subset(dataset, condition_abb == group1 & question_abb == qu)[[data]]
#  data2 <- subset(dataset, condition_abb == group2 & question_abb == qu)[[data]]

  data1 <- subset(dataset, condition_abb == group1 & question == qu)[[data]]
  data2 <- subset(dataset, condition_abb == group2 & question == qu)[[data]]
  wilcox.test(data1, data2)
}
# Kruskal wallis test

