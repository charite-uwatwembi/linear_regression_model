from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import joblib
import numpy as np

app = FastAPI()



# Load the pre-trained model and encoder
try:
    model = joblib.load("profit_model.joblib")
    encoder = joblib.load("encoder.joblib")
except Exception as e:
    print(f"Error loading model or encoder: {e}")
    model = None
    encoder = None

class PredictionRequest(BaseModel):
    rnd_spend: float
    administration: float
    marketing_spend: float
    state: str

@app.post("/predict")
def predict(request: PredictionRequest):
    if model is None or encoder is None:
        raise HTTPException(status_code=500, detail="Model or encoder not loaded")

    try:
        # Prepare the input data by Extracts values from request and encodes the state feature
        input_data = [request.rnd_spend, request.administration, request.marketing_spend]
        
        
        if request.state not in encoder.classes_:
            raise HTTPException(status_code=400, detail="State not recognized")
        state_encoded = encoder.transform([request.state])[0]

        #  Combines all features into a single numpy array and reshapes it to fit the model input format.
        full_input_data = np.array(input_data + [state_encoded]).reshape(1, -1)

        # Perform the prediction and returns the result in JSON format.
        prediction = model.predict(full_input_data)
        
        return {"profit": prediction[0]}
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Prediction error: {e}")
