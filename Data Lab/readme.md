# Principal Component Analysis (PCA) Project
  
**Project Type:** Data Analysis / Dimensionality Reduction  
**Tools:** Python, Pandas, NumPy, Scikit-Learn, Matplotlib, Seaborn, Jupyter Notebook  

## Project Overview

This project demonstrates the use of **Principal Component Analysis (PCA)** to reduce the dimensionality of a dataset while preserving as much variance as possible. PCA helps simplify complex datasets, improve visualization, and support downstream machine learning tasks.

The analysis was performed using **Python and Scikit-Learn** within a **Jupyter Notebook**, including data preprocessing, feature scaling, PCA transformation, and visualization of the results.

---

## Objectives

- Perform exploratory data analysis (EDA)
- Prepare and standardize the dataset for analysis
- Apply Principal Component Analysis (PCA)
- Analyze explained variance
- Visualize the principal components
- Interpret patterns in the dataset

---

## Technologies Used

- **Python**
- **Pandas** – data manipulation and preprocessing
- **NumPy** – numerical operations
- **Scikit-Learn** – PCA implementation
- **Matplotlib / Seaborn** – data visualization
- **Jupyter Notebook** – analysis environment

---

## Project Workflow

1. **Data Loading**
   - Import dataset and inspect its structure
2. **Data Cleaning**
   - Handle missing values
   - Prepare features for analysis
3. **Feature Scaling**
   - Standardize features using `StandardScaler`

4. **Apply PCA**
   - Use `sklearn.decomposition.PCA`
   - Reduce dimensionality of the dataset

5. **Variance Analysis**
   - Evaluate explained variance ratio
   - Determine optimal number of principal components

6. **Visualization**
   - Plot principal components
   - Visualize variance explained by components
---

## Key Insights

- PCA successfully reduced the number of variables while retaining most of the dataset’s variance.
- Dimensionality reduction improved interpretability and visualization of the dataset.
- Principal components revealed hidden patterns among the original variables.

# Drug Classification Using Decision Trees

## Overview
This project builds a **Decision Tree classification model** to predict the most suitable drug for patients based on medical attributes such as age, sex, blood pressure, cholesterol level, and sodium-to-potassium ratio.

## Objectives
- Perform basic data exploration and preprocessing
- Encode categorical variables for machine learning
- Train a **Decision Tree Classifier**
- Evaluate model performance
- Visualize the decision tree

## Dataset Features
- Age
- Sex
- Blood Pressure
- Cholesterol
- Na_to_K (Sodium-to-Potassium Ratio)

**Target:** Drug type (A, B, C, X, Y)

## Tools & Libraries
- Python
- Pandas
- NumPy
- Scikit-learn
- Matplotlib

## Result
The model successfully classifies the appropriate drug based on patient characteristics and demonstrates how decision trees can support data-driven healthcare decisions.


# Titanic survival prediction

This project builds a production-style binary classification pipeline to predict whether a Titanic passenger survived. It showcases an end-to-end machine learning workflow using scikit-learn  from exploratory analysis and feature engineering through hyperparameter tuning and model evaluation.

![Python](https://img.shields.io/badge/Python-3.8%2B-3776ab?logo=python&logoColor=white)
![scikit-learn](https://img.shields.io/badge/scikit--learn-1.x-f89939?logo=scikit-learn&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-22c55e)

## What's Inside

- `ColumnTransformer` pipeline with median/mode imputation, scaling, and one-hot encoding
- `GridSearchCV` + `StratifiedKFold` to tune both models while respecting class imbalance
- Classification reports, confusion matrices, and feature importance visualizations
- Side-by-side model comparison (~82% test accuracy for both)
  

Two classifiers are trained, tuned, and compared:
- **Random Forest** with feature importance analysis
- **Logistic Regression** with coefficient magnitude analysis

Key techniques demonstrated: stratified train/test splitting, `ColumnTransformer` preprocessing pipelines (median/mode imputation, standard scaling, one-hot encoding), `GridSearchCV` with `StratifiedKFold` cross-validation, and confusion matrix + classification report evaluation.
