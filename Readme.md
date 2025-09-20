# Target E-commerce Performance Analysis in Brazil (2016-2018)

## 🎯 Introduction & Problem Statement

This project analyzes a dataset of 100,000 e-commerce orders placed on Target in Brazil between 2016 and 2018. The goal is to extract valuable insights into customer behavior, regional performance, and logistical efficiency to provide actionable recommendations for the business. The analysis covers order trends, customer distribution, economic impact, and payment preferences.

---

## 📊 Dataset

The dataset provides a comprehensive view of the transactions and is composed of 8 `.csv` files:

* `customers.csv`
* `geolocation.csv`
* `order_items.csv`
* `orders.csv`
* `payments.csv`
* `products.csv`
* `reviews.csv`
* `sellers.csv`

The full dataset can be found in the `/data` directory or downloaded from the original source [here](https://drive.google.com/drive/folders/1TGEc66YKbD443nslRi1bWgVd238gJCnb).

---

## 🛠️ Tools Used

* **Analysis:** SQL (using Google BigQuery)
* **Reporting:** PDF Document

---

## ✨ Key Insights & Strategic Recommendations

The analysis revealed four key areas for strategic improvement:

1.  **Resolve the Northern Logistics Crisis:** High freight costs and slow delivery times in the North are the biggest barrier to nationwide growth. **Recommendation:** Establish a northern distribution center and renegotiate with regional carriers.

2.  **Optimize Marketing and Sales Funnels:** Sales peak mid-year (May-Aug) and during afternoon hours (1-6 PM), with a heavy concentration of customers in the Southeast (SP, RJ, MG). **Recommendation:** Realign marketing campaigns to these peak times and launch loyalty programs in core southeastern states.

3.  **Enhance the Financial Ecosystem:** Customers show a strong preference for credit cards and installment-based payments. **Recommendation:** Promote "Buy Now, Pay Later" (BNPL) options and partner with credit card issuers for exclusive offers.

4.  **Improve Customer Experience with Data:** Delivery estimates for northern states are highly inaccurate, eroding customer trust. **Recommendation:** Overhaul the delivery estimation algorithm using historical data to provide more reliable and competitive timelines.

---

## 📂 Repository Structure

* **/data:** Contains the 8 raw `.csv` files used for the analysis.
* **/sql_queries:** Includes a single `.sql` file with all queries used to extract the insights.
* **/report:** Contains the final business case study in PDF format.
* **README.md:** An overview of the project.
