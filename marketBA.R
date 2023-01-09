# Market Basket Analysis is part of machine learning used for data mining. It is used by large retailers to uncover associations between items. 
# It works by looking for combinations of items that occur together frequently in transactions using association rules. 
# Association rule learning is a rule-based machine learning method for discovering interesting relations between variables in large databases. 
# Association rules are primarily used to find analytics and a prediction of customer behaviour


data=read.csv(file.choose(),header = T, colClasses = "factor")
head(data)
colnames(data)

install.packages("arules")
install.packages("arulesViz")
library(arules)
library(arulesViz)
summary(data)

rules1=apriori(data)
rules1
summary(rules1)
inspect(rules1[1:20])

rules2 <- apriori(data, 
                  parameter = list(supp=0.3, conf=0.3),
                  appearance = list(lhs=c("Mobile.TV.Rechaege=1","Payment.of.Bills=1",
                                          "Money.Transfer=1","Food.Order=1",
                                          "Groceries=1","Medicines=1","Hotel=1"),
                                    rhs=c("Fuel=1",
                                          "Public.Transport=1","Investment=1" )))

#modified algorithm
rules2
summary(rules2)
inspect(rules2)

r1 <- sort(rules2, by='lift', decreasing = TRUE)    #sort on the basis of lift
r1
summary(r1)
inspect(r1)

r2=is.redundant(r1)  #finding out the repeatation in the rules 
r2
summary(r2)


r3=r1[!r2]            #Remove redundancy
r3
inspect(r3[1:10])
summary(r3)

