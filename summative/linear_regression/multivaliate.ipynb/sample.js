
//   "Adult_Mortality": 271,
async function getData() {
  const response = await fetch("http://127.0.0.1:8000/predict", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      Country: "Afghanistan",
      Year: 2014,
      Status: "Developing",
      Adult_Mortality: 271,
      infant_deaths: 64,
      Alcohol: 0.01,
      percentage_expenditure: 73.52358168,
      Hepatitis_B: 62,
      Measles: 492,
      BMI: 18.6,
      under_five_deaths: 86,
      Polio: 58,
      Total_expenditure: 8.18,
      Diphtheria: 62,
      HIV_AIDS: 0.1,
      GDP: 612.696514,
      Population: 327582,
      thinness_1_19_years: 17.5,
      thinness_5_9_years: 17.5,
      Income_composition_of_resources: 0.476,
      Schooling: 10,
    }),
  });
  const data = await response.json();
  console.log(data);
}

getData();
  
//  Country: str;
//  Year: int;
//  Status: str;
//  Life_expectancy: float;
//  Adult_Mortality: int;
//  infant_deaths: int;
//  Alcohol: float;
//  percentage_expenditure: float;
//  Hepatitis_B: int;
//  Measles: int;
//  BMI: float;
//  under_five_deaths: int;
//  Polio: int;
//  Total_expenditure: float;
//  Diphtheria: int;
//  HIV_AIDS: float;
//  GDP: float;
//  Population: int;
//  thinness_1_19_years: float;
//  thinness_5_9_years: float;
//  Income_composition_of_resources: float;
//  Schooling: float;