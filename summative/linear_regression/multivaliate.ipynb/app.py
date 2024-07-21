from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import joblib
import numpy as np
from fastapi.middleware.cors import CORSMiddleware
from sklearn.preprocessing import LabelEncoder

# Load the trained model
model = joblib.load("life_expectancy_model.joblib")

# Initialize FastAPI
app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


# Define the input data schema
class RequestData(BaseModel):
    Country: str
    Year: int
    Status: str
    Adult_Mortality: int
    infant_deaths: int
    Alcohol: float
    percentage_expenditure: float
    Hepatitis_B: int
    Measles: int
    BMI: float
    under_five_deaths: int
    Polio: int
    Total_expenditure: float
    Diphtheria: int
    HIV_AIDS: float
    GDP: float
    Population: int
    thinness_1_19_years: float
    thinness_5_9_years: float
    Income_composition_of_resources: float
    Schooling: float


# Pre-encoded mapping for Country and Status
country_mapping = {
    "Afghanistan": 0,
    "Albania": 1,
    "Algeria": 2,
    "Angola": 3,
    "Argentina": 4,
    "Armenia": 5,
    "Australia": 6,
    "Austria": 7,
    "Azerbaijan": 8,
    "Bangladesh": 9,
    "Belarus": 10,
    "Belgium": 11,
    "Belize": 12,
    "Benin": 13,
    "Bhutan": 14,
    "Bosnia and Herzegovina": 15,
    "Botswana": 16,
    "Brazil": 17,
    "Bulgaria": 18,
    "Burkina Faso": 19,
    "Burundi": 20,
    "Cabo Verde": 21,
    "Cambodia": 22,
    "Cameroon": 23,
    "Canada": 24,
    "Central African Republic": 25,
    "Chad": 26,
    "Chile": 27,
    "China": 28,
    "Colombia": 29,
    "Comoros": 30,
    "Costa Rica": 31,
    "Croatia": 32,
    "Cyprus": 33,
    "Djibouti": 34,
    "Dominican Republic": 35,
    "Ecuador": 36,
    "El Salvador": 37,
    "Equatorial Guinea": 38,
    "Eritrea": 39,
    "Estonia": 40,
    "Ethiopia": 41,
    "Fiji": 42,
    "France": 43,
    "Gabon": 44,
    "Georgia": 45,
    "Germany": 46,
    "Ghana": 47,
    "Greece": 48,
    "Guatemala": 49,
    "Guinea": 50,
    "Guinea-Bissau": 51,
    "Guyana": 52,
    "Haiti": 53,
    "Honduras": 54,
    "India": 55,
    "Indonesia": 56,
    "Iraq": 57,
    "Ireland": 58,
    "Israel": 59,
    "Italy": 60,
    "Jamaica": 61,
    "Jordan": 62,
    "Kazakhstan": 63,
    "Kenya": 64,
    "Kiribati": 65,
    "Latvia": 66,
    "Lebanon": 67,
    "Lesotho": 68,
    "Liberia": 69,
    "Lithuania": 70,
    "Luxembourg": 71,
    "Madagascar": 72,
    "Malawi": 73,
    "Malaysia": 74,
    "Maldives": 75,
    "Mali": 76,
    "Malta": 77,
    "Mauritania": 78,
    "Mauritius": 79,
    "Mexico": 80,
    "Mongolia": 81,
    "Montenegro": 82,
    "Morocco": 83,
    "Mozambique": 84,
    "Myanmar": 85,
    "Namibia": 86,
    "Nepal": 87,
    "Netherlands": 88,
    "Nicaragua": 89,
    "Niger": 90,
    "Nigeria": 91,
    "Pakistan": 92,
    "Panama": 93,
    "Papua New Guinea": 94,
    "Paraguay": 95,
    "Peru": 96,
    "Philippines": 97,
    "Poland": 98,
    "Portugal": 99,
    "Romania": 100,
    "Russian Federation": 101,
    "Rwanda": 102,
    "Samoa": 103,
    "Sao Tome and Principe": 104,
    "Senegal": 105,
    "Serbia": 106,
    "Seychelles": 107,
    "Sierra Leone": 108,
    "Solomon Islands": 109,
    "South Africa": 110,
    "Spain": 111,
    "Sri Lanka": 112,
    "Suriname": 113,
    "Swaziland": 114,
    "Sweden": 115,
    "Syrian Arab Republic": 116,
    "Tajikistan": 117,
    "Thailand": 118,
    "Timor-Leste": 119,
    "Togo": 120,
    "Tonga": 121,
    "Trinidad and Tobago": 122,
    "Tunisia": 123,
    "Turkey": 124,
    "Turkmenistan": 125,
    "Uganda": 126,
    "Ukraine": 127,
    "Uruguay": 128,
    "Uzbekistan": 129,
    "Vanuatu": 130,
    "Zambia": 131,
    "Zimbabwe": 132,
}
status_mapping = {"Developed": 0, "Developing": 1}


# Function to convert request data to model input values
def convertRequestToModelValue(data):
    data["Country"] = country_mapping.get(data["Country"], -1)
    data["Status"] = status_mapping.get(data["Status"], -1)
    return [
        data["Country"],
        data["Year"],
        data["Status"],
        data["Adult_Mortality"],
        data["infant_deaths"],
        data["Alcohol"],
        data["percentage_expenditure"],
        data["Hepatitis_B"],
        data["Measles"],
        data["BMI"],
        data["under_five_deaths"],
        data["Polio"],
        data["Total_expenditure"],
        data["Diphtheria"],
        data["HIV_AIDS"],
        data["GDP"],
        data["Population"],
        data["thinness_1_19_years"],
        data["thinness_5_9_years"],
        data["Income_composition_of_resources"],
        data["Schooling"],
    ]


@app.get("/")
def read_root():
    return {"message": "Welcome to the Life Expectancy Prediction API"}


@app.post("/predict")
def predict(data: RequestData):
    try:
        # Convert input data to the required format for the model
        input_data = [convertRequestToModelValue(data.dict())]

        # Make prediction
        prediction = model.predict(input_data)
        return {"prediction": round(prediction[0], 1)}
        # return {'prediction': 'prediction'}
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))
