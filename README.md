# Predictive-Risk-delivery-System
# 📦 Delivery Performance & Customer Satisfaction Analysis

This project explores customer satisfaction and delivery performance using real-world e-commerce data. It combines **SQL analytics**, **data visualization**, and a **machine learning pipeline** to identify key insights and predict late deliveries for operational optimization.

---

## 📊 Project Goals

- Analyze delivery delays and customer review trends across time, payment methods, and locations.
- Identify seller performance benchmarks and product category impacts.
- Build a **predictive model** for late deliveries using logistic classification.
- Enable **real-time delivery risk prediction** using SQL input and trained ML pipeline.

---

## 🛠️ Technologies Used

- **Python** (Pandas, NumPy, Matplotlib, Seaborn, Scikit-learn, Imbalanced-learn)
- **SQL** (MySQL database with JOINs, CTEs, aggregations)
- **Jupyter Notebook** for visual analytics
- **Joblib** for model serialization
- **SMOTE** for handling class imbalance
- **MySQL Connector (SQLAlchemy + PyMySQL)**

---

## 🔍 Key SQL Insights & Visualizations

### 📍 1. **Average Delivery Time by State**
- Compared actual vs. estimated delivery times.
- Found significant overestimations in certain regions.

### 💳 2. **Review Scores by Payment Type & Delivery Speed**
- Faster deliveries correlated with higher review scores regardless of payment method.

### 🛒 3. **Delivery Time by Product Category**
- Top 5 categories by order volume showed delivery time clustering between 11–13 days.

### 📈 4. **Monthly Trends**
- Order volume rose sharply from late 2016 into 2018.
- Review scores remained stable between 4.2–4.5.

### 🧮 5. **Seller Delivery Percentiles**
- Wide variation in seller performance visualized with a percentile histogram.

---

## 🤖 Machine Learning Model: Late Delivery Predictor

A **Random Forest Classifier** was trained to predict whether an order will be delivered late.

### Features Used:
- Estimated delivery days, purchase hour/day
- Price, freight value, freight-to-price ratio
- Payment type, product category, customer state
- Engineered features like weekend purchase

### Model Pipeline:
- Custom `FeatureEngineer` class
- One-hot encoding for categoricals
- Standard scaling for numericals
- SMOTE for class imbalance
- Evaluation at multiple thresholds: 0.25, 0.30, 0.35

### Best Threshold (0.30):
- Accuracy: **86%**
- Precision (Late): **26%**
- Recall (Late): **40%**

---

## ⚙️ Deployment Simulation

- Trained model saved using `joblib`.
- Real-time prediction using single input or batch SQL queries.
- Outputs include:
  - `predicted_late` flag
  - `late_probability` score

```python
# Sample output
order_id                      predicted_late  late_probability
c79bdf061e22288609201ec60deb42fb      0              0.13
6c98fa39891b33399785aeac3d7ee926      1              0.39



---

## 🚚 Solutions for Flagged Late Deliveries

For orders predicted to be at risk of delay (`predicted_late = 1`), the following actions can be taken:

### 1. 🔁 **Proactive Customer Notification**
- Notify customers early about potential delays.
- Offer discounts or incentives for delayed deliveries (e.g., store credit).

### 2. 🧭 **Reroute to Faster Fulfillment Centers**
- Use predicted risk to dynamically reroute the order to a warehouse or seller closer to the customer.

### 3. ⏱️ **Upgrade Shipping Method**
- Flagged orders can be prioritized with express shipping or third-party logistics (3PL) partners.

### 4. 🛍️ **Seller Performance Monitoring**
- Alert low-performing sellers (those in higher delivery percentiles) and recommend operational improvements or mentorship.

### 5. 📦 **Smart Inventory Allocation**
- Use prediction insights to maintain stock of frequently delayed products closer to high-risk delivery zones.

### 6. 🤝 **Customer Service Integration**
- Feed high-risk orders into customer support dashboards for faster escalation if issues arise.

---


