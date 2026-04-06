# india-census-sql-analysis
"A comprehensive SQL-based analysis of the 2011 Indian Census data, focusing on state-level literacy rates, sex ratios, and population growth trends using advanced aggregation and ranking techniques."

Project Overview (STAR Method)
S - Situation The goal was to perform a comprehensive data analysis on the 2011 Indian Census Data to extract meaningful demographic insights. This information is critical for government planning, resource allocation, and identifying regional disparities in growth and literacy.

T - Task My objective was to import raw data from Excel into Microsoft SQL Server and write complex SQL queries to calculate key metrics such as average growth rates, sex ratios, and literacy rates across different states and districts.

A - Action I performed the following technical steps using advanced SQL techniques:

Data Integration: Imported two primary datasets (Dataset 1: Growth/Sex Ratio/Literacy; Dataset 2: Area/Population) into SQL Server.

Aggregate Analysis: Used GROUP BY, SUM, and AVG functions to determine state-level demographics.

Filtering & Ranking: Implemented HAVING clauses to identify states exceeding specific literacy thresholds (e.g., >90%) and used TOP functions to rank the highest and lowest performing regions.

Advanced Scripting: Utilized Temporary Tables and Union Operators to combine top and bottom performers into a single unified report for better visualization.

Pattern Matching: Employed LIKE operators and wildcard characters to filter states based on specific naming patterns.

R - Result The project successfully generated a detailed demographic profile of India. I identified the top 3 states with the highest growth rates and the bottom 3 states for sex ratios, providing a data-driven foundation for potential policy recommendations or further dashboard visualization in Power BI.
