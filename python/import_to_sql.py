import pandas as pd
from sqlalchemy import create_engine

# -----------------------
# MySQL Connection
# -----------------------
username = "root"
password = "0903"      # Replace with your MySQL password
host = "localhost"
database = "bank_churn"

engine = create_engine(
    f"mysql+pymysql://{username}:{password}@{host}/{database}"
)

# Read CSV
df = pd.read_csv("data/raw/Bank_Churn.csv")

# Import to MySQL
df.to_sql(
    "bank_customers",
    con=engine,
    if_exists="replace",
    index=False
)

print("✅ Data imported successfully!")
print(df.shape)
print(df.columns)