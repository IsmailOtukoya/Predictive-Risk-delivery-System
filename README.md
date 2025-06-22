

# 🚀 Predictive Delivery Risk System

This project uses SQL-based feature extraction and a machine learning pipeline in Python to predict **delivery delays** in customer orders. We analyze order behavior, engineer meaningful features, and build a predictive model that can classify whether an order is likely to be delivered late.

---

## 📌 Key Objectives

- Understand trends in delivery performance and customer satisfaction
- Extract insights using SQL from a normalized ecommerce database
- Build a predictive model to classify whether an order is likely to be delayed
- Evaluate and deploy the model with real data from MySQL

---

## 📊 SQL Insights and Visualizations

The dataset is pulled from a relational MySQL database. Key queries and insights:

### 1. 📦 Actual vs Estimated Delivery Time by State
> We compared actual vs. estimated delivery durations per customer state.

**Insight:** Some states consistently experienced longer delays, hinting at possible logistics or seller-related issues.

### 2. 💳 Review Score by Payment Type & Delivery Speed
> Relationship between payment types and average customer satisfaction, broken down by delivery speed.

**Insight:** Customers using vouchers tend to give lower scores when delivery is slow.

### 3. 🛍️ Top Product Categories by Order Count & Delivery Time
> Focused on the most frequently ordered product categories and their average delivery durations.

**Insight:** Categories with the highest order volume didn’t always have the best delivery time performance.

### 4. 📈 Monthly Order Volume vs Review Score
> Explored the seasonality of order trends and how it correlates with customer review scores.

**Insight:** Order volume increases didn’t always result in higher review scores—delays and congestion may reduce satisfaction.

### 5. 📦 Seller Delivery Percentiles
> Assigned sellers to percentile buckets based on average delivery time.

**Insight:** A few sellers consistently perform better (top 10%) and can be used as benchmarks or priority partners.

---

## 🧠 Predictive Delivery Delay Model

We trained a **Random Forest Classifier** using SMOTE-balanced data and pipeline automation.

### 🔨 Feature Engineering Highlights

- `freight_ratio` = `freight_value / price` to estimate logistical weight/cost burden
- `is_weekend_purchase` = binary indicator for weekend purchases
- Dropped raw datetime fields after feature extraction

### ⚙️ Model Workflow

1. SQL used to extract cleaned and labeled dataset
2. Data split into train/test sets (80/20)
3. Pipeline created: feature engineering ➝ preprocessing ➝ balancing ➝ model training
4. Evaluated with thresholds: `0.25`, `0.30`, `0.35`

### 📈 Evaluation Result (Threshold = 0.30)

| Class         | Precision | Recall | F1-Score |
|---------------|-----------|--------|----------|
| On-Time (0)   | 0.95      | 0.90   | 0.92     |
| Late (1)      | 0.26      | 0.40   | 0.31     |
| **Accuracy**  |           |        | **0.86** |

> The model performs well at identifying late orders without excessive false positives.

### 🔐 Deployment & Prediction

- Model and threshold saved using `joblib`
- New data can be pulled from SQL and passed through the pipeline for live prediction
- Also supports single-row input and batch predictions

---

## 💡 Solutions for Flagged Late Deliveries

For orders predicted to be at risk of delay (`predicted_late = 1`), we propose:

1. **Customer Notification**: Early alert with compensation options
2. **Shipping Upgrade**: Expedite delivery automatically for flagged orders
3. **Rerouting**: Use ML outputs to route from nearest warehouse
4. **Seller Feedback**: Notify underperforming sellers based on percentile
5. **Inventory Optimization**: Stock delay-prone products nearer to target regions

---

## 📁 Project Structure

```
📦 Predictive-Delivery-Risk-System
│
├── 📜 average delivery time vs. estimated time by state.sql
├── 📜 Comparison review scores across different payment types and delivery speeds.sql
├── 📜 percentage of late deliveries and their impact on satisfaction.sql
├── 📜 delivery performance across top 5 product categories.sql
├── 📜 monthly trends of order volume and review scores.sql
├── 📜 seller delivery performance percentiles  to identify consistent top performers.sql
├── 📜 Predictive delivery risk system.sql
├── 📔 Delivery Performance & Customer Satisfaction Analysis.ipynb
├── 📦 delivery_risk_pipeline_main.joblib
├── 📦 delivery_risk_threshold.joblib
└── 📄 README.md
```

---

## ✍️ Author

Built by **[Ismail Otukoya]** as part of a hands-on SQL + Machine Learning project.

- 📧 Email: otukoyaismail@email.com
- 🧑‍💻 Portfolio: 
- 🐍 Tools: Python, MySQL, scikit-learn, Matplotlib, seaborn, pandas

---

## 📢 License

This project is licensed under the MIT License.



>>>>>>> cc663a01eaa8a44b22eb5ec59a85dbcf158d6fcf
