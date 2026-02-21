# DAS7000 Project Scaffold (PowerShell)
$ErrorActionPreference = "Stop"

$PROJECT = "DAS7000-student-performance-xai"

New-Item -ItemType Directory -Force $PROJECT | Out-Null
Set-Location $PROJECT

# Create folders
$folders = @(
  "data\raw","data\processed",
  "notebooks",
  "src",
  "reports\figures","reports\tables",
  "models\baseline","models\final"
)
foreach ($f in $folders) { New-Item -ItemType Directory -Force $f | Out-Null }

# .gitignore
@"
# Python
__pycache__/
*.py[cod]
*.egg-info/
dist/
build/

# Environments
.venv/
venv/
env/

# Jupyter
.ipynb_checkpoints/

# OS
.DS_Store
Thumbs.db

# Data/models (do not commit raw data by default)
data/raw/*
data/processed/*
models/*
!data/README_data.md

# Reports export (optional)
reports/figures/*.png
reports/figures/*.jpg
reports/figures/*.pdf

# Logs
*.log
"@ | Set-Content -Encoding UTF8 ".gitignore"

# README.md
@"
# DAS7000 PORT1 — Student Performance Prediction with Explainable AI

This repository contains a reproducible machine learning pipeline to predict student performance risk (e.g., pass/fail) and generate explainable visualisations of factors influencing predictions.

## Objectives
- Benchmark multiple ML models for student performance prediction (baseline + advanced).
- Integrate Explainable AI (XAI) methods for global and local explanations (e.g., SHAP, LIME, PDP/ICE).
- Provide trustworthy, educator-friendly visual analytics to support early intervention.

## Repository structure
- data/ — dataset links and processed outputs (raw data not committed)
- notebooks/ — step-by-step experimentation notebooks
- src/ — reusable Python modules (data, preprocessing, training, evaluation, XAI)
- reports/ — exported figures/tables for the written report

## How to run
1. Create a virtual environment
2. Install requirements: pip install -r requirements.txt
3. Run notebooks in order (01 → 06)

## Notes
Raw datasets are not committed to GitHub unless the dataset license explicitly permits redistribution.
See data/README_data.md for sources and download instructions.
"@ | Set-Content -Encoding UTF8 "README.md"

# data/README_data.md
@"
# Datasets

## Primary dataset
UCI Student Performance Dataset (Cortez & Silva)

Files (typical):
- student-mat.csv
- student-por.csv

Notes:
- CSV often uses semicolon separator (;)
- Target column: G3 (final grade, 0–20)

## Storage policy
Raw data is not committed to GitHub by default. Store it in data/raw/.
Document dataset source and license here.
"@ | Set-Content -Encoding UTF8 "data\README_data.md"

# requirements.txt
@"
pandas
numpy
scikit-learn
matplotlib
jupyter
xgboost
lightgbm
shap
lime
"@ | Set-Content -Encoding UTF8 "requirements.txt"

Write-Host "✅ Project scaffold created: $PROJECT"
Write-Host "Next:"
Write-Host "  cd $PROJECT"
Write-Host "  git init"
Write-Host "  git add ."
Write-Host "  git commit -m `"Initialize repo structure`""