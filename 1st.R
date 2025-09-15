library(ada)
# --------------------------
# 1. INSTALL & LOAD PACKAGES
# --------------------------
# Install if not yet installed
# install.packages("arules")
# install.packages("arulesViz")
library(arules)
library(arulesViz)
# -----------------
---------
  # 2. LOAD SAMPLE DATA
  # --------------------------
# Use built-in "Groceries" dataset 
data("Groceries")
# View dataset summary 
summary(Groceries)
inspect(Groceries[1:5]) # look at first 5 transactions
# --------------------------
# 3. CREATE ASSOCIATION RULES
# --------------------------
# Generate rules using Apriori algorithm 
rules <- apriori(Groceries,
           parameter=list(support=0.01, confidence=0.5))
# View summary of rules 
summary(rules)
# Inspect first few rules 
inspect(rules[1:5])
# --------------------------
# 4. FILTER STRONGER RULES
# --------------------------
# Rules with higher lift (>1.2) 
strong_rules <- subset(rules, lift > 1.2)
inspect(strong_rules[1:5])
# --------------------------
# 5. VISUALIZATION
# --------------------------
# Plot rules by support, confidence, and lift

plot(rules, measure=c("support", "confidence"), shading="lift")
# Graph-based visualization
plot(strong_rules, method="graph", control=list(type="items")) 