CL-MCSDS-CMU-10-04_DAS7000_student_performance_xai

Machine Learning Framework for Student Performance Prediction with Explainable AI (XAI)
DAS7000 – Data Analytics and Visualisation (PORT1)

Multiclass Student Performance Prediction with Explainable AI (SHAP)
This project develops a machine learning framework to predict a student’s final academic performance category using the UCI Student Performance (Portuguese) dataset.

The framework compares multiple models across two experimental stages and integrates Explainable AI (SHAP) to provide transparent and trustworthy insights into predictions.

1) Project Overview
Educational institutions require early identification of students who may be at academic risk.

This project formulates student performance prediction as a multiclass classification problem, providing richer insight than binary pass/fail prediction.

Prediction Target
The dataset includes three academic grades:
G1 – First period grade
G2 – Second period grade
G3 – Final grade

Final grade (G3) is converted into:
Low: 0–9
Medium: 10–14
High: 15–20

This allows identification of performance bands rather than a simple pass/fail outcome.

2) Two-Stage Experimental Design
Stage A – Early Model (Early Warning System)
Predicts final performance using:
Demographic features
Behavioural features
Family and engagement variables
Excludes G1 and G2 to simulate early academic intervention.

Stage B – Mid-Term Model (With Academic Signals)
Predicts final performance using:
All background features
G1 and G2 (mid-year academic history)
This stage tests performance once academic indicators are available.

3) Models Trained
For each stage, the following models were trained and compared:
Logistic Regression
Random Forest
XGBoost (Multiclass)

4) Preprocessing Pipeline
A full scikit-learn Pipeline was implemented:
Categorical features → OneHotEncoder(handle_unknown="ignore")
Numeric features:
StandardScaler (Logistic Regression only)
Passthrough (Tree-based models)

Data split:
Stratified 80/20 train-test split
Fixed random seed (RANDOM_STATE = 42)
This ensures reproducibility and consistent evaluation.

5) Evaluation Metrics
Models were evaluated using:
Accuracy
Macro F1-score (primary comparison metric)
Weighted F1-score
Multiclass ROC-AUC (One-vs-Rest Macro)
Confusion Matrix
ROC Curves
Why Macro F1?
Macro F1 treats all classes equally and is more appropriate when class distribution is imbalanced.

6) Final Model Performance
The best-performing model was:
Random Forest – Mid-Term Stage
Test Set Results (n = 130)
Accuracy: 0.8846
Macro F1-score: 0.8408
Weighted F1-score: 0.8793
ROC-AUC (OvR Macro): 0.9533

The confusion matrix shows:
Strong recall for the Medium class
High precision for the High class
Minor misclassification between Low and Medium categories
This demonstrates strong predictive performance with interpretable error patterns.

7) Explainable AI Integration (SHAP)
The best-performing model was analysed using SHAP.

SHAP provides:
Global Explanations
Feature importance ranking
SHAP summary plots
Local Explanations
Individual student-level explanations
Waterfall and bar plots
Tree-based models use TreeExplainer for accurate interpretation.

This improves transparency and supports educator trust in AI predictions.

8) Calibration Analysis
Calibration curves (One-vs-Rest) were plotted to evaluate probability reliability.
Probability columns were aligned to a fixed class order:
CLASS_ORDER = ["Low", "Medium", "High"]

This prevents probability misalignment when model.classes_ differs in ordering.

9) Model Persistence
The best-performing model was serialized using Python’s pickle library.
Saved model location:
models/best_model_Random Forest (Mid).pkl
The saved object contains the complete Pipeline:
Preprocessing steps
Trained model parameters
This ensures:
Reproducibility
Deployment readiness
Consistent preprocessing during inference
Loading the Model

import pickle

with open("models/best_model_Random Forest (Mid).pkl", "rb") as f:
    model = pickle.load(f)

After reloading, the model reproduced identical test performance metrics, confirming successful persistence.

10) Dataset
Source: UCI Machine Learning Repository – Student Performance Dataset
File used: student-por.csv (Portuguese dataset)
The dataset contains 649 students and 33 attributes including demographic, social, and academic variables.

11) How to Run
Option A – Local Execution
Clone the repository
Install dependencies:
pip install -r requirements.txt
Run the notebook in the notebooks/ directory
OR

Run main.py
Option B – Google Colab
Upload the notebook
Upload student-por.csv

Install dependencies:
!pip install xgboost shap
12) Requirements

Tested with:
pandas 2.2.2
numpy 2.0.2
scikit-learn 1.6.1
xgboost 3.2.0
shap 0.50.0
matplotlib

13) Repository Structure
├── main.py
├── requirements.txt
├── README.md
├── dataset/
│   ├── student-por.csv
│   ├── student-mat.csv
│   └── student.txt
├── models/
│   └── best_model_Random Forest (Mid).pkl
├── notebooks/
│   └── student performance prediction.ipynb
└── python/
    └── notebook_json.py
14) Author
Name: Fathima Aabidha Rifky
Cardiff Met ID: st20357374
ICBT ID: CL-MCSDS-CMU-10-04
Module: DAS7000 – Data Analytics and Visualisation