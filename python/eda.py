import pandas as pd
import matplotlib.pyplot as plt

# Load dataset
df = pd.read_csv("data/raw/Bank_Churn.csv")

print(df.head())
print(df.info())
print(df.describe())

churn = df["Exited"].value_counts()
plt.figure(figsize=(6,5))
plt.pie(churn,labels=["Stayed","Churned"],autopct="%1.1f%%",startangle=90)
plt.title("Customer Churn Distribution")
plt.show()

#churn by country
country = df.groupby("Geography")["Exited"].mean()*100
plt.figure(figsize=(7,5))
plt.bar(country.index, country.values)
plt.title("Churn Rate by Country")
plt.xlabel("Country")
plt.ylabel("Churn Rate (%)")
plt.show()

#churn by gender
gender = (df.groupby("Gender")["Exited"].mean()*100)

plt.figure(figsize=(6,5))
plt.bar(gender.index, gender.values)
plt.title("Churn Rate by Gender")
plt.ylabel("Churn Rate (%)")
plt.xlabel("Gender")
plt.show()


#churn by activemember
active = ( df.groupby("IsActiveMember")["Exited"].mean()*100)
plt.figure(figsize=(6,5))
plt.bar(["Inactive","Active"],active.values)
plt.title("Churn by Active Member")
plt.show()

#age distribution
plt.figure(figsize=(8,5))
plt.hist(df["Age"], bins=40)
plt.title("Age Distribution")
plt.xlabel("Age")
plt.ylabel("Customers")
plt.show()

#balance distribution
plt.figure(figsize=(8,5))
plt.hist(df["Balance"], bins=20)
plt.title("Balance Distribution")
plt.xlabel("Balance")
plt.ylabel("Customers")
plt.show()

#credit card distribution
plt.figure(figsize=(8,5))
plt.hist(df["CreditScore"], bins=20)
plt.title("Credit Score Distribution")
plt.xlabel("Credit Score")
plt.ylabel("Customers")
plt.show()


corr = df.corr(numeric_only=True)
plt.figure(figsize=(10,8))
plt.imshow(corr)
plt.colorbar()
plt.xticks(range(len(corr.columns)), corr.columns, rotation=90)
plt.yticks(range(len(corr.columns)), corr.columns)
plt.title("Correlation Heatmap")
plt.show()