
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.ensemble import RandomForestClassifier
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import classification_report, confusion_matrix, accuracy_score
import statsmodels.api as sm
from scipy.stats import ttest_ind, f_oneway

# Load the data
df = pd.read_csv('digital_addiction_psychological_wellbeing_data.csv')

# Encode categorical variables
label_encoders = {}
for column in ['Gender', 'Primary_Activity', 'Device_Used_Most']:
    le = LabelEncoder()
    df[column] = le.fit_transform(df[column])
    label_encoders[column] = le

# Standardize numerical features
scaler = StandardScaler()
df[['Digital_Usage_Hours_Per_Day', 'Addiction_Score', 'Wellbeing_Score']] = scaler.fit_transform(df[['Digital_Usage_Hours_Per_Day', 'Addiction_Score', 'Wellbeing_Score']])

# Predictive Modeling
X = df[['Age', 'Gender', 'Digital_Usage_Hours_Per_Day', 'Primary_Activity', 'Device_Used_Most', 'Addiction_Score']]
y = df['Wellbeing_Score']
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

# Random Forest Classifier
rf_model = RandomForestClassifier(n_estimators=100, random_state=42)
rf_model.fit(X_train, y_train)
rf_pred = rf_model.predict(X_test)
rf_accuracy = accuracy_score(y_test, rf_pred)

# Decision Tree Classifier
dt_model = DecisionTreeClassifier(random_state=42)
dt_model.fit(X_train, y_train)
dt_pred = dt_model.predict(X_test)
dt_accuracy = accuracy_score(y_test, dt_pred)

# Save model results
with open('digital_addiction_model_results.txt', 'w') as f:
    f.write(f"Random Forest Accuracy: {rf_accuracy}\n")
    f.write(f"Decision Tree Accuracy: {dt_accuracy}\n")

# Inferential Statistics
anova_result_addiction = f_oneway(
    df[df['Primary_Activity'] == 0]['Addiction_Score'],
    df[df['Primary_Activity'] == 1]['Addiction_Score'],
    df[df['Primary_Activity'] == 2]['Addiction_Score'],
    df[df['Primary_Activity'] == 3]['Addiction_Score']
)

high_addiction_wellbeing = df[df['Addiction_Score'] > 7]['Wellbeing_Score']
low_addiction_wellbeing = df[df['Addiction_Score'] < 3]['Wellbeing_Score']
ttest_result_wellbeing = ttest_ind(high_addiction_wellbeing, low_addiction_wellbeing)

# Save inferential results
with open('digital_addiction_inferential_stats_results.txt', 'w') as f:
    f.write(f"ANOVA Results (Addiction Score by Primary Activity): F-statistic = {anova_result_addiction.statistic}, p-value = {anova_result_addiction.pvalue}\n")
    f.write(f"T-test Results (Wellbeing Score between High and Low Addiction): T-statistic = {ttest_result_wellbeing.statistic}, p-value = {ttest_result_wellbeing.pvalue}\n")

# Causal Analysis using Regression
X = df[['Digital_Usage_Hours_Per_Day', 'Addiction_Score', 'Anxiety_Level', 'Depression_Level', 'Stress_Level']]
y = df['Wellbeing_Score']
X = sm.add_constant(X)
causal_regression_model = sm.OLS(y, X).fit()

# Save causal analysis results
with open('digital_addiction_causal_regression_summary.txt', 'w') as f:
    f.write(causal_regression_model.summary().as_text())
