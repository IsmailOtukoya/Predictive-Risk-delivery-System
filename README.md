# 🛒 Predicting Late Deliveries — Customer Order Analysis

This project analyzes customer orders to understand delivery patterns and uses a machine learning model to predict whether an order is likely to be **late**.

---

## 🔍 What We Did

- Connected to a MySQL database using Python.
- Queried and visualized delivery data using SQL + pandas.
- Engineered features like `freight ratio`, `weekend purchase`, and `delivery days`.
- Built a machine learning model (Random Forest) using pipelines and SMOTE to predict late deliveries.

---

## 📊 Insights from SQL Visualizations

1. **Delivery Time by State**  
   Compared actual vs estimated delivery times across different states.

2. **Review Score by Payment Type & Delivery Speed**  
   Explored how payment method + delivery speed affects customer reviews.

3. **Top Product Categories**  
   Analyzed average delivery time for the 5 most ordered product categories.

4. **Monthly Order Trends**  
   Tracked order volume and average review score over time.

5. **Seller Delivery Percentiles**  
   Ranked sellers based on their delivery performance.

---

## 🤖 Machine Learning Model

- Model: Random Forest (with SMOTE for class imbalance)
- Features: Time of purchase, shipping estimates, payment type, product category, etc.
- Accuracy: Up to **89%** at best threshold
- Best threshold: **0.30**

**Sample Prediction Result:**
> Predicted probability of being late: 0.66  
> **⚠️ Is the order at risk? Yes**

---

## 🛠 Use Cases

- Flag risky orders before they ship.
- Alert logistics teams to prioritize.
- Send proactive messages to customers.
- Identify slow sellers or categories.

---

## 📁 Project Files

- SQL files (tasks and prediction query)
- Jupyter notebook with code and charts
- Trained model (.joblib)
- README file

---

## ✨ Ideas for Future Work

- Add Streamlit dashboard for live predictions.
- Allow CSV upload or manual entry for single predictions.
- Integrate SMS/email alerts for risky deliveries.

---

## 👤 Author

**Name**: [Ismail Otukoya]  
**LinkedIn**: [https://www.linkedin.com/in/otukoya-i-89765521b/]  


