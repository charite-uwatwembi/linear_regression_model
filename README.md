
# Linear Regression Model Summative

## Task 1:
## A. Linear Regression for predicting Tv sales(univariate)

based on TV marketing expenses. i investigated three different approaches to this problem. i used `NumPy` and `Scikit-Learn` linear regression models, as well as constructed and optimized the sum of squares cost function with gradient descent from scratch.

## B. Linear Regression for predicting startup businesses profits (multivariate)

 Develop a linear regression model to predict the profit of startups based on R&D spend, administration spend, marketing spend, and the state. The model will be trained on a provided dataset and evaluated on its predictive performance.
- **Instructions to run the notebook**:
  1. Ensure you have Python and Jupyter Notebook installed on your machine.
  2. Navigate to the `/notebook` directory.
  3. Open the Jupyter Notebook `linear_regression.ipynb`.
  4. Run all cells to train the model and observe the results.
- **Expected outcomes**: A trained linear regression model with an evaluation of its performance, such as the mean squared error and R² score.

## Task 2: Create an API
- **Description of the task**: Create a FastAPI-based web API that serves the trained linear regression model for predicting profits. The API will accept input data in JSON format and return the predicted profit.
- **Instructions to set up and run the API**:
  1. Ensure you have Python installed on your machine.
  2. Navigate to the `/api` directory.
  3. Install the required dependencies by running `pip install -r requirements.txt`.
  4. Start the API server by running `uvicorn main:app --reload`.
  5. The API will be available at `http://127.0.0.1:8000`.
- **Public API endpoint**: `http://127.0.0.1:8000/docs`
  - This endpoint provides an interactive Swagger UI to test the API.
- **Steps to test the API using Postman**:
  1. Open Postman and create a new POST request.
  2. Set the request URL to `http://127.0.0.1:8000/predict`.
  3. Set the request header `Content-Type` to `application/json`.
  4. In the request body, provide a JSON object with the keys `rnd_spend`, `administration`, `marketing_spend`, and `state`, e.g.:
     ```json
     {
       "rnd_spend": 100000,
       "administration": 200000,
       "marketing_spend": 300000,
       "state": "New York"
     }
     ```
  5. Send the request and observe the predicted profit in the response.

## Task 3: Flutter App
- **Description of the task**: Develop a Flutter mobile application that interacts with the API to provide a user interface for predicting startup profits. The app will collect input data from the user and display the predicted profit.
- **Instructions to set up and run the Flutter app**:
  1. Ensure you have Flutter installed on your machine.
  2. Navigate to the `/flutter_app` directory.
  3. Run `flutter pub get` to install the required dependencies.
  4. Connect an Android or iOS device, or start an emulator.
  5. Run the app using `flutter run`.
- **Screenshot**:
  ![App Screenshot](/summative/image.png)
- **Link to the demo video**: [Video Demo](https://drive.google.com/file/d/103q_NMf7YK99gBoK3ZTO_HGoXNxwXOQv/view?usp=sharing)

## Directory Structure
- `/notebook`: Contains the Jupyter Notebook for developing and evaluating the linear regression model.
- `/api`: Contains the FastAPI code for serving the linear regression model as a web API.
- `/flutter_app`: Contains the Flutter project for the mobile application.

