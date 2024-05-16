# R_Data_Analytics Project

Data Cleaning Transformation and Statistical Analytics for Parent Child Behaviour Reseach Project 

## Objective

* Based on the datasets provided , using the data points from multiple datasets to form a single dataset ( here namely   Complete_Data_Modified.csv ) by performing data cleaning and data transformation . Using the data file generated , gain necessary statistical insights for further use by domain experts .

## Scope 

* Data Cleaning and transformation performed as per the needed instructions present in the files "Big Five Inventory (BFI)" , "Emotional Intelligence Appraisal - scoring" , "PANAS C- Scoring" , "Parental Authority Questionnaire (PAQ) - original" , "Child Behavior Checklist for Ages 6-18 (CBCL)"  .


* Generate the following insights [ On Complete_Data_Modified ]:

0. Reliability testing using Cronbach (Already Done )
1. Correlation analysis using   Correlation matrix
2. Yates's chi-squared test
3. Histogram 
4. Normality Tests
   A. Kolmogrov-Smirnov
   B. Shapiro-Wilk
5. Mediation analysis  
6. Regression analysis 
    A. Test Cases based on linear regression 
    B. Test Cases based on non-linear regression
7. Bootstrapping & K-fold Cross Validation
8. Factor analysis  (Performed on Spss software )
    A. Exploratory Factor Analysis
    B. Confirmatory Factor Analysis

## Plan
### Plan of Action :
* Pefrom initial data cleaning to generate the one complete dataset from (multiple) survey response files based on instructions provided.
* Genrate initial EDA for better understanding of the data 
* Generate the required statistical insights as listed in "Scope"

## Data Acquisition & Understanding
* Multiple datasets ( in .csv format ) was provided containing survey responses of participants [These datasets contain personal information and as such cannot be shared ]

* The original or raw datasets that was provided is then modified and transformed based on the instructions of the following files 
  -Big Five Inventory (BFI)
  -Emotional Intelligence Appraisal - scoring
  -PANAS C- Scoring
  -Parental Authority Questionnaire (PAQ) - original
  -Child Behavior Checklist for Ages 6-18 (CBCL)

* "Complete_Data_Modified.csv" - The final dataset  produced after data cleaning and transformation as per instructions provided 


## Tasks and Results :: 

### Data Cleaning 

* **Code Files**
   1. CSV3.R
   2. CSV3_2.R
   3. CSV3_3.R
   4. CSV3_4.R
   5. Final.R
   6. Final_Data_Clean.R
 <br /> 
[Note :: The above R script files provided perform various data processing and analysis tasks on a dataset related to parenting, children's behavior, and psychological assessments. Each file reads data from a CSV file, processes it according to specific criteria, and generates a new CSV file with the processed data.]
      
### Data Exploration

* **Code File** - Correlation_Matrix - JupyterLab.pdf [Purpose- Contains Correlation Matirxs of the variables and the histograms that they generate ( works on 'Complete_Data_Modified.csv' ) ]
* **Code File** - Histogram - JupyterLab.pdf  [Purpose- Contains Graphical representations of the variables and the histograms that they generate ( works on 'Complete_Data_Modified.csv' ) ]
* **Code File** - Chi-Sq Test- JupyterLab.pdf [Purpose- The code performs Yates's Chi-Squared test to examine the independence of two categorical variables . Chi-Squared tests are part of EDA when analyzing the relationship between categorical variables ( works on 'Complete_Data_Modified.csv' ) ]
* **Code File** - Normality_Test- JupyterLab.pdf [Purpose- The code performs normality tests on various columns of a dataset using two statistical tests: Shapiro-Wilk and Kolmogorov-Smirnov ,  helping to understand the underlying distribution of data, which is crucial before performing further statistical analyses. ( works on 'Complete_Data_Modified.csv' )]
* **Code File** - Reliability_Test_Cronbach- JupyterLab.pdf [Purpose- This code is designed to perform reliability analysis using Cronbach's alpha on a dataset. Cronbach's alpha is a measure of internal consistency, indicating how closely related a set of items are as a group. ( works on 'Complete_Data_Modified.csv' ) ]


### Analytical Procedures

* Mediation Analysis - **Code File** - Mediation_Analysis - JupyterLab.pdf [works on performing mediation analysis using the "bda" library. It loops through combinations of independent, dependent, and mediator variables to perform the Sobel test , Aroian test , Goodman test and display the results.]
  

* Regression Analysis
  1. **Code File** - Regression_Linear (6) - JupyterLab.pdf 
  2. **Code File** - Regression_Linear (6)_1- JupyterLab.pdf 
  3. **Code File** - Regression_Linear (6)_2 - JupyterLab.pdf  <br />  
[Note :: All files provide detailed GLM model summaries and star ratings for the significance of the regression coefficients. Regression_Linear (6) - JupyterLab.pdf fits Poisson GLM models. Other two files , fits binomial GLM models. ( works on 'Complete_Data_Modified.csv' ) ]  <br />  
  4. **Code File** - Regression_Linear (6)_3- JupyterLab.pdf [Uses linear regression (lm function) to model the relationship between variables. It loops through combinations of independent, dependent, and mediator variables to fit multiple linear regression models.( works on 'Complete_Data_Modified.csv' )]
  5. **Code File** - Regression_Non_Linear (6)_4 - JupyterLab.pdf [Uses nonlinear regression (nls function) to model the relationship between variables. It fits a single nonlinear model with predefined initial parameters and displays the results.( works on 'Complete_Data_Modified.csv' )]
  
  

### Notes
* Bootstrapping code has not been attached as of now 
* Factor analysis (EFA and CFA was performed on a software , SPSS , to better suit the needs of the domain expert )
