# CL-MCSDS-CMU-10-04\_DAS7000\_student\_performance\_xai

Machine learning framework for student performance prediction with explainable AI and trustworthy visual analytics. DAS7000 PORT1

# Multiclass Student Performance Prediction with Explainable AI (SHAP)

This project predicts a student’s **final performance category** using the **UCI Student Performance (Portuguese)** dataset.  
It runs a **two-stage experiment** (Early vs Mid-term) and explains the best model using **SHAP**.

---

## 1) Project Overview

Educators often need early signals to identify students who may struggle before the end of the academic year.  
This notebook builds a machine learning framework to predict a student’s final performance band and explains the key factors behind predictions.

### Prediction Target (Multiclass)

The dataset includes three grades:

- **G1**: First period grade  
- **G2**: Second period grade  
- **G3**: Final grade  

We convert **G3** into a multiclass outcome:

- **Low**: 0–9  
- **Medium**: 10–14  
- **High**: 15–20  

---

## 2) Two-Stage Experiment

### Stage A: Early Model (Early Warning)

Predicts final category using **background + behavioural features only**.  
Excludes **G1** and **G2** to simulate early intervention.

### Stage B: Mid-Term Model (With Academic History)

Predicts final category using **background features + G1 + G2**.  
Includes academic signals to improve predictive power.

---

## 3) Models Trained

For each stage, the following models are trained and compared:

- Logistic Regression  
- Random Forest  
- XGBoost (multiclass)

### Preprocessing

- Categorical features: `OneHotEncoder(handle_unknown="ignore")`
- Numeric features:
  - `StandardScaler` (Logistic Regression only)
  - Passthrough (for tree-based models)

### Data Split

- Stratified **80/20 train-test split**
- Fixed random seed for reproducibility (`RANDOM_STATE = 42`)

---

## 4) Evaluation Metrics

Models are evaluated using:

- Accuracy  
- Macro F1 (primary comparison metric)  
- Weighted F1  
- Multiclass ROC-AUC (OvR macro)  
- Confusion Matrix  
- One-vs-Rest ROC curves  

### Why Macro F1?

Macro F1 treats all classes equally and is more appropriate than accuracy when classes are imbalanced.

---

## 5) Best Model + Explainability (SHAP)

The best-performing mid-term model (based on **Macro F1**) is selected for explainability.

SHAP provides:

- **Global explanations**: Which features matter most overall  
- **Local explanations**: Why a specific student was predicted as Low, Medium, or High  

For tree-based models like **Random Forest** and **XGBoost**, `TreeExplainer` is used for accurate model interpretation.

---

## 6) Calibration (Probability Reliability Check)

Calibration curves (one-vs-rest) are plotted for each class to evaluate how well predicted probabilities match actual outcomes.

Probability columns are explicitly aligned to a fixed order:

```python
CLASS_ORDER = ["Low", "Medium", "High"]

This prevents misalignment when model.classes_ is in a different order than expected.

7) Dataset
Source: UCI Machine Learning Repository — Student Performance dataset
File used: student-por.csv (Portuguese)

Note:
The dataset also includes student-mat.csv.
This project uses only student-por.csv to avoid overlap issues and ensure a clean experimental setup.

8) How to Run
Option A: Local (Recommended)
Clone the repository
Place student-por.csv in the same folder as the notebook (or update CSV_PATH)

Install dependencies:
pip install -r requirements.txt

Run the notebook.

Option B: Google Colab
Upload the notebook
Upload student-por.csv
Run:
!pip -q install xgboost shap

9) Requirements / Versions
Tested with:
pandas 2.2.2
numpy 2.0.2
scikit-learn 1.6.1
xgboost 3.2.0
shap 0.50.0

10) Files in This Repository
notebook.ipynb — Main analysis notebook (EDA, training, evaluation, SHAP, calibration)
student-por.csv — Dataset file (not included if restricted by submission rules)
README.md — Project documentation

11) Author
Name: Fathima Aabidha Rifky
Cardiff Met ID: st20357374
ICBT ID: CL-MCSDS-CMU-10-04