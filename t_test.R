# Load necessary libraries
library(ggplot2)
library(readxl)
library(RColorBrewer)

#excel_data <- read_excel("./FFH/exp1.xlsx", sheet = "fps")
excel_data <- read_excel("./FFH/exp1.xlsx", sheet = "ftime")

original <- excel_data$Original
original2 <- excel_data$Original2
original4 <- excel_data$Original4
original8 <- excel_data$Original8
cut2 <- excel_data$Cut2
cut4 <- excel_data$Cut4
cut8 <- excel_data$Cut8

# t-test 수행
result <- t.test(original, cut8)
print(result)

# 요약된 결과를 데이터 프레임으로 변환
t_test_table <- data.frame(
  Statistics = c("t", "df", "p-value", "Mean of Group A", "Mean of Group B"),
  Values = c(result$statistic, result$parameter, result$p.value, mean(original,na.rm = T), mean(cut8,na.rm = T))
)

# 테이블 출력
print(t_test_table)