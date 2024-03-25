library(ggplot2)
library(readxl)
library(RColorBrewer)

#excel_data <- read_excel("./FFH/questionnaires.xlsx", sheet = "Sheet1")
excel_data <- read_excel("./FFH/questionnaires.xlsx", sheet = "Sheet5")
label_x = "Scenario"
label_y = "Answer (7-point Likert Scale)"

p <- ggplot(excel_data, aes(x = factor(condition), y = q1, fill = factor(condition))) +
  geom_boxplot() +
  #labs(x = "Conditions", y = "Answer", title = "Mental Demand: How mentally demanding was the task?") +
  labs(x = label_x, y = label_y, title = "Mental Demand (the lower, the better)") +
  scale_fill_brewer(palette="Dark2") +
  theme_classic()+ coord_cartesian(ylim = c(0, 7))

print(p)

p <- ggplot(excel_data, aes(x = factor(condition), y = q2, fill = factor(condition))) +
  geom_boxplot() +
  #labs(x = "Conditions", y = "Answer", title = "Physical Demand: How physically demanding was the task?") +
  labs(x = label_x, y = label_y, title = "Physical Demand (the lower, the better)") +
  scale_fill_brewer(palette="Dark2") +
  theme_classic()+ coord_cartesian(ylim = c(0, 7))
print(p)

p <- ggplot(excel_data, aes(x = factor(condition), y = q3, fill = factor(condition))) +
  geom_boxplot() +
  #labs(x = "Conditions", y = "Answer", title = "Temporal Demand: How hurried or rushed was the pace of the task?") +
  labs(x = label_x, y = label_y, title = "Temporal Demand (the lower, the better)") +
  #scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9", "#56B4E9")) +
  scale_fill_brewer(palette="Dark2") +
  theme_classic()+ coord_cartesian(ylim = c(0, 7))
print(p)

p <- ggplot(excel_data, aes(x = factor(condition), y = q4, fill = factor(condition))) +
  geom_boxplot() +
  #labs(x = "Conditions", y = "Answer", title = "Performance: How successful were you in accomplishing what you were asked to do?") +
  labs(x = label_x, y = label_y, title = "Performance (the higher, the better)") +
  scale_fill_brewer(palette="Dark2") +
  theme_classic()+ coord_cartesian(ylim = c(0, 7))

print(p)

p <- ggplot(excel_data, aes(x = factor(condition), y = q5, fill = factor(condition))) +
  geom_boxplot() +
  #labs(x = "Conditions", y = "Answer", title = "Effort: How hard did you have to work to accomplish your level of performance?") +
  labs(x = label_x, y = label_y, title = "Effort (the lower, the better)") +
  #scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9", "#56B4E9")) +
  scale_fill_brewer(palette="Dark2") +
  theme_classic()+ coord_cartesian(ylim = c(0, 7))
print(p)

p <- ggplot(excel_data, aes(x = factor(condition), y = q6, fill = factor(condition))) +
  geom_boxplot() +
  #labs(x = "Conditions", y = "Answer", title = "Frustration: How insecure, discouraged, irritated, stressed, and annoyed were you?") +
  labs(x = label_x, y = label_y, title = "Frustration (the lower, the better)") +
  #scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9", "#56B4E9")) +
  scale_fill_brewer(palette="Dark2") +
  theme_classic()+ coord_cartesian(ylim = c(0, 7))

print(p)

p <- ggplot(excel_data, aes(x = factor(condition), y = q7, fill = factor(condition))) +
  geom_boxplot() +
  #labs(x = "Conditions", y = "Answer", title = "Task control: How difficult was the task to control/navigate?") +
  labs(x = label_x, y = label_y, title = "Task control (the lower, the better)") +
  #scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9", "#56B4E9")) +
  scale_fill_brewer(palette="Dark2") +
  theme_classic()+ coord_cartesian(ylim = c(0, 7))
print(p)

p <- ggplot(excel_data, aes(x = factor(condition), y = q8, fill = factor(condition))) +
  geom_boxplot() +
  #labs(x = "Conditions", y = "Answer", title = "Presence: How immersed/present did you feel in the task?") +
  labs(x = label_x, y = label_y, title = "Presence (the higher, the better)") +
  #scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9", "#56B4E9")) +
  scale_fill_brewer(palette="Dark2") +
  theme_classic()+ coord_cartesian(ylim = c(0, 7))
print(p)
