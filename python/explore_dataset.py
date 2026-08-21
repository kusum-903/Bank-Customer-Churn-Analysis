import pandas as pd

df = pd.read_csv("data/raw/Bank_Churn.csv")

print("="*60)
print("Shape")
print(df.shape)

print("\nColumns")
print(df.columns.tolist())

print("\nData Types")
print(df.dtypes)

print("\nMissing Values")
print(df.isnull().sum())

print("\nDuplicate Rows")
print(df.duplicated().sum())

print("\nFirst 5 Rows")
print(df.head())