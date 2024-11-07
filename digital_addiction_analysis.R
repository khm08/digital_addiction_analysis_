
# Load necessary libraries
library(ggplot2)
library(dplyr)

# Load data
data <- read.csv('digital_addiction_psychological_wellbeing_data.csv')

# Descriptive statistics
summary(data)

# Visualization: Average Addiction Score by Primary Activity
ggplot(data, aes(x=Primary_Activity, y=Addiction_Score)) +
  geom_bar(stat='summary', fun='mean', fill='lightblue') +
  theme_minimal() +
  labs(title='Average Addiction Score by Primary Activity', x='Primary Activity', y='Addiction Score')

# Save plot
ggsave('addiction_score_by_activity_R.png')

# Visualization: Average Wellbeing Score by Digital Usage Hours
ggplot(data, aes(x=Digital_Usage_Hours_Per_Day, y=Wellbeing_Score)) +
  geom_point(color='darkgreen') +
  theme_minimal() +
  labs(title='Wellbeing Score by Digital Usage Hours', x='Digital Usage Hours per Day', y='Wellbeing Score')

# Save plot
ggsave('wellbeing_score_by_usage_R.png')

# Visualization: Boxplot of Stress Level by Device Used
ggplot(data, aes(x=Device_Used_Most, y=Stress_Level)) +
  geom_boxplot(fill='lightcoral') +
  theme_minimal() +
  labs(title='Stress Level by Device Used', x='Device Used Most', y='Stress Level')

# Save plot
ggsave('stress_level_by_device_R.png')
