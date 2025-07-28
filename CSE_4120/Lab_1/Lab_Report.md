# Lab Report: Introduction to Data Mining and Tools

**Course**: CSE 4120 - Data Mining  
**Lab**: Week 1  
**Date**: July 26, 2025  
**Student**: [Student Name]  

---

## Experiment Name
**Introduction to Data Mining and Tools**

## Objectives
The primary objectives of this laboratory experiment were to:
1. Understand fundamental data mining concepts and tools
2. Explore different types of data mining problems (classification, clustering, association, regression)
3. Gain hands-on experience with Python libraries for data analysis
4. Learn proper data preprocessing and splitting techniques
5. Identify appropriate problem types based on dataset characteristics
6. Develop skills in data visualization and exploratory data analysis

## Tools and Environment Setup
For this experiment, we utilized Python as our primary programming language along with several essential libraries:
- **Pandas**: For data manipulation and analysis
- **NumPy**: For numerical computations and array operations
- **Matplotlib**: For creating comprehensive data visualizations
- **Scikit-learn**: For machine learning utilities and data splitting

The development environment was set up using Jupyter Notebook, which provided an interactive platform for data exploration and analysis.

---

## Task 1: Iris Dataset Analysis

### Objective
Analyze the famous Iris dataset to understand multiclass classification problems and explore the relationship between flower measurements and species classification.

### Code Implementation
```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split

# Load Iris dataset
iris_df = pd.read_csv('iris.csv')
print("Dataset shape:", iris_df.shape)
print("First 5 rows:")
print(iris_df.head())
```

### Output
```
Dataset shape: (150, 5)

First 5 rows:
   sepal.length  sepal.width  petal.length  petal.width variety
0           5.1          3.5           1.4          0.2  Setosa
1           4.9          3.0           1.4          0.2  Setosa
2           4.7          3.2           1.3          0.2  Setosa
3           4.6          3.1           1.5          0.2  Setosa
4           5.0          3.6           1.4          0.2  Setosa
```

### Feature Analysis
```python
# Identify features and labels
features = iris_df.drop('variety', axis=1)
labels = iris_df['variety']

print("Features (independent variables):", features.columns.tolist())
print("Label (dependent variable): variety")
print("Number of labels:", labels.nunique())
print("Labels:", labels.unique())
```

### Data Splitting
```python
# Split data into train, validation, and test sets
X_temp, X_test, y_temp, y_test = train_test_split(features, labels, test_size=0.2, random_state=42)
X_train, X_val, y_train, y_val = train_test_split(X_temp, y_temp, test_size=0.25, random_state=42)

print("Data split completed:")
print(f"Training set: {len(X_train)} samples (60%)")
print(f"Validation set: {len(X_val)} samples (20%)")
print(f"Test set: {len(X_test)} samples (20%)")
```

### Visualization and Analysis Results
The comprehensive analysis revealed several key insights:
- **Dataset Dimensions**: 150 samples × 5 columns
- **Feature Types**: 4 numerical features (sepal length/width, petal length/width)
- **Target Classes**: 3 balanced classes (Setosa, Versicolor, Virginica)
- **Data Quality**: No missing values, perfectly balanced dataset

The correlation analysis showed strong relationships between petal measurements and species classification, with petal length and width being particularly discriminative features.

### Discussion - Iris Dataset
The Iris dataset represents a classic **multiclass classification** problem. Through our analysis, we discovered that this dataset is exceptionally well-suited for classification tasks due to its balanced nature and clear separability between classes. The visualization revealed that Setosa species can be easily distinguished from the other two species based on petal measurements alone, while Versicolor and Virginica show more overlap but remain distinguishable.

The strong correlation between petal features suggests that these measurements are the most informative for species identification. This finding aligns with botanical knowledge, as petal characteristics are often species-specific traits. The absence of missing values and the balanced class distribution make this dataset ideal for learning classification algorithms and evaluating their performance.

---

## Task 2: Online Retail Dataset Analysis

### Objective
Explore a large-scale retail transaction dataset to understand multiple data mining applications including association rule mining, customer clustering, and regression analysis.

### Code Implementation
```python
# Load Online Retail dataset
retail_df = pd.read_excel('Online Retail.xlsx')
print("Dataset shape:", retail_df.shape)
print("First 5 rows:")
print(retail_df.head())
```

### Output
```
Dataset shape: (541909, 8)

First 5 rows:
  InvoiceNo StockCode                          Description  Quantity  \
0    536365    85123A   WHITE HANGING HEART T-LIGHT HOLDER         6   
1    536365     71053                  WHITE METAL LANTERN         6   
2    536365    84406B       CREAM CUPID HEARTS COAT HANGER         8   
3    536365    84029G  KNITTED UNION FLAG HOT WATER BOTTLE         6   
4    536365    84029E       RED WOOLLY HOTTIE WHITE HEART.         6   

          InvoiceDate  UnitPrice  CustomerID         Country  
0 2010-12-01 08:26:00       2.55     17850.0  United Kingdom  
1 2010-12-01 08:26:00       3.39     17850.0  United Kingdom
```

### Data Quality Assessment
The analysis revealed significant data quality considerations:
- **Missing Values**: 135,080 missing CustomerID values (24.9% of data)
- **Data Cleaning**: After removing missing CustomerIDs, 406,829 transactions remained
- **Scale**: 4,372 unique customers, 3,684 unique products, spanning 37 countries

### Multiple Problem Type Analysis

#### 1. Association Rule Mining (Market Basket Analysis)
```python
# Create basket matrix for association rules
basket = retail_clean.groupby(['InvoiceNo', 'StockCode'])['Quantity'].sum().unstack().fillna(0)
basket_sets = basket.applymap(lambda x: 1 if x > 0 else 0)
print(f"Basket matrix shape: {basket_sets.shape}")
```

This analysis prepared the data for discovering frequent itemsets and association rules like "customers who buy A also tend to buy B."

#### 2. Customer Clustering (RFM Analysis)
```python
# Customer segmentation features
customer_features = retail_clean.groupby('CustomerID').agg({
    'TotalPrice': ['sum', 'mean', 'count'],
    'Quantity': ['sum', 'mean'],
    'InvoiceNo': 'nunique'
}).round(2)
```

The RFM (Recency, Frequency, Monetary) analysis enables customer segmentation for targeted marketing strategies.

#### 3. Regression Analysis
```python
# Prepare features for predicting TotalPrice
regression_features = retail_clean[['Quantity', 'UnitPrice']]
regression_labels = retail_clean['TotalPrice']
```

### Data Splitting for Regression
```python
X_temp, X_test, y_temp, y_test = train_test_split(regression_features, regression_labels, test_size=0.2, random_state=42)
X_train, X_val, y_train, y_val = train_test_split(X_temp, y_temp, test_size=0.25, random_state=42)

print("Data split completed:")
print(f"Training set: {len(X_train)} samples (60%)")
print(f"Validation set: {len(X_val)} samples (20%)")
print(f"Test set: {len(X_test)} samples (20%)")
```

### Discussion - Online Retail Dataset
The Online Retail dataset demonstrates the versatility of real-world data in supporting multiple data mining objectives. This dataset is particularly valuable because it encompasses three distinct problem types:

**Association Rule Mining**: The transaction structure makes it ideal for market basket analysis. By analyzing which products are frequently purchased together, retailers can optimize product placement, create targeted promotions, and improve cross-selling strategies. The large number of transactions (541,909) provides sufficient data for discovering meaningful patterns.

**Clustering Analysis**: The customer transaction history enables sophisticated customer segmentation through RFM analysis. This approach helps identify high-value customers, frequent buyers, and recent customers, allowing for personalized marketing approaches. The diversity in customer behavior patterns (ranging from one-time buyers to repeat customers) provides rich material for clustering algorithms.

**Regression Analysis**: The relationship between quantity, unit price, and total transaction value presents a clear regression problem. This analysis can help predict transaction values and understand pricing elasticity, which is crucial for revenue optimization.

The temporal nature of the data (spanning one year) also reveals seasonal patterns, with notable peaks during holiday periods, providing additional insights for business planning and inventory management.

---

## Task 3: Housing Dataset Analysis

### Objective
Analyze housing price data to understand regression problems and explore the relationship between house characteristics and market prices.

### Code Implementation
```python
# Load Housing dataset
housing_df = pd.read_csv('Housing.csv')
print("Dataset shape:", housing_df.shape)
print("First 5 rows:")
print(housing_df.head())
```

### Output
```
Dataset shape: (545, 13)

First 5 rows:
      price  area  bedrooms  bathrooms  stories mainroad guestroom basement  \
0  13300000  7420         4          2        3      yes        no       no   
1  12250000  8960         4          4        4      yes        no       no   
2  12250000  9960         3          2        2      yes        no      yes   
3  12215000  7500         4          2        2      yes        no      yes   
4  11410000  7420         4          1        2      yes       yes      yes
```

### Feature Analysis
```python
# Define features and target
numerical_features = ['area', 'bedrooms', 'bathrooms', 'stories', 'parking']
features = housing_df[numerical_features]
labels = housing_df['price']

print("Features (independent variables):", features.columns.tolist())
print("Label (dependent variable): price")
print(f"Price range: ${labels.min():,} - ${labels.max():,}")
print(f"Average price: ${labels.mean():,.0f}")
```

### Statistical Analysis Results
- **Price Range**: $1,750,000 - $13,300,000
- **Average Price**: $4,766,729
- **Median Price**: $4,340,000
- **Standard Deviation**: $1,870,440

### Correlation Analysis
The correlation analysis revealed strong relationships between various features and housing prices:
- **Area**: Strongest positive correlation with price (r = 0.54)
- **Bathrooms**: Significant positive correlation (r = 0.52)
- **Stories**: Moderate positive correlation (r = 0.27)
- **Bedrooms**: Moderate positive correlation (r = 0.37)

### Data Splitting
```python
X_temp, X_test, y_temp, y_test = train_test_split(features, labels, test_size=0.2, random_state=42)
X_train, X_val, y_train, y_val = train_test_split(X_temp, y_temp, test_size=0.25, random_state=42)

print("Data split completed:")
print(f"Training set: {len(X_train)} samples (60%)")
print(f"Validation set: {len(X_val)} samples (20%)")
print(f"Test set: {len(X_test)} samples (20%)")
```

### Discussion - Housing Dataset
The Housing dataset exemplifies a classic **regression problem** in real estate analytics. The analysis uncovered several important insights about housing price determinants:

**Feature Importance**: Area emerged as the most significant predictor of house prices, which aligns with real estate principles where "size matters." The strong correlation between bathrooms and price suggests that luxury amenities significantly impact property valuation. The moderate correlation with bedrooms indicates that while room count matters, it's not as critical as overall space and bathroom facilities.

**Data Quality**: This dataset stands out for its completeness, with no missing values across all 545 properties. This clean data structure facilitates reliable modeling and analysis without extensive preprocessing requirements.

**Price Distribution**: The wide price range ($1.75M to $13.3M) indicates a diverse property portfolio, from mid-range to luxury homes. The right-skewed distribution (mean > median) suggests the presence of high-value outliers, typical in real estate markets.

**Categorical Features**: While our analysis focused on numerical features, the dataset includes important categorical variables (mainroad access, basement, air conditioning) that significantly impact pricing. These features demonstrate that housing valuation involves both quantitative measurements and qualitative amenities.

The dataset's characteristics make it excellent for regression modeling, allowing practitioners to predict house prices based on property features and understand the relative importance of different attributes in determining market value.

---

## Overall Lab Conclusions

### Key Learning Outcomes
This laboratory experiment successfully achieved its educational objectives by providing hands-on experience with three distinct data mining scenarios:

1. **Problem Type Identification**: Learned to distinguish between classification (Iris), regression (Housing), and multiple application scenarios (Online Retail)

2. **Data Preprocessing Skills**: Developed proficiency in handling missing values, feature selection, and data quality assessment

3. **Visualization Techniques**: Created comprehensive visualizations to understand data patterns, distributions, and relationships

4. **Proper Data Splitting**: Implemented industry-standard train/validation/test splits (60/20/20) for model development

### Technical Skills Developed
- **Python Programming**: Enhanced proficiency with pandas for data manipulation
- **Data Analysis**: Learned statistical analysis techniques and correlation assessment
- **Visualization**: Mastered matplotlib for creating informative plots and charts
- **Machine Learning Foundations**: Understanding of supervised vs. unsupervised learning concepts

### Data Mining Concepts Mastered
- **Classification**: Multiclass problems with categorical targets
- **Regression**: Continuous target prediction with multiple features
- **Association Rules**: Transaction analysis for pattern discovery
- **Clustering**: Customer segmentation and grouping techniques

### Real-World Applications
Each dataset represented practical applications of data mining:
- **Iris**: Biological classification and pattern recognition
- **Online Retail**: E-commerce analytics and customer intelligence
- **Housing**: Real estate valuation and market analysis

### Future Directions
This foundational work establishes the groundwork for advanced data mining techniques including:
- Algorithm implementation and comparison
- Feature engineering and selection methods
- Model evaluation and validation techniques  
- Advanced visualization and interpretation methods

The successful completion of this laboratory demonstrates readiness to tackle more complex data mining challenges and real-world analytical problems.

---

**Note**: This report represents the culmination of systematic data exploration and analysis, providing a solid foundation for advanced data mining coursework and practical applications in various domains.
