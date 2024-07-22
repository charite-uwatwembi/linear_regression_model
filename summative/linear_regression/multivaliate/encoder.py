import pandas as pd
from sklearn.preprocessing import LabelEncoder
import joblib

# Load your dataset
data = pd.read_csv("data/50_Startups.csv")

# Create and fit the LabelEncoder
encoder = LabelEncoder()
encoder.fit(data['State'])  # Fit on the 'State' column

# Save the encoder to a file
joblib.dump(encoder, "encoder.joblib")
