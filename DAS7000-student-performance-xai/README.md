# DAS7000 PORT1 â€” Student Performance Prediction with Explainable AI

This repository contains a reproducible machine learning pipeline to predict student performance risk (e.g., pass/fail) and generate explainable visualisations of factors influencing predictions.

## Objectives
- Benchmark multiple ML models for student performance prediction (baseline + advanced).
- Integrate Explainable AI (XAI) methods for global and local explanations (e.g., SHAP, LIME, PDP/ICE).
- Provide trustworthy, educator-friendly visual analytics to support early intervention.

## Repository structure
- data/ â€” dataset links and processed outputs (raw data not committed)
- notebooks/ â€” step-by-step experimentation notebooks
- src/ â€” reusable Python modules (data, preprocessing, training, evaluation, XAI)
- reports/ â€” exported figures/tables for the written report

## How to run
1. Create a virtual environment
2. Install requirements: pip install -r requirements.txt
3. Run notebooks in order (01 â†’ 06)

## Notes
Raw datasets are not committed to GitHub unless the dataset license explicitly permits redistribution.
See data/README_data.md for sources and download instructions.
