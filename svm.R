train.data <- read.csv("train_featured.csv", encoding="cp949")
test.data <- read.csv("test_featured.csv", encoding="cp949")

train.data$hoax <- as.factor(train.data$hoax)
test.data$hoax <- as.factor(test.data$hoax)


library(e1071)

tune.svm <- tune.svm( hoax ~ feature1 + feature1.1 + feature2.1 + feature2.2 + feature3 + feature4 + feature5,
                      data = train.data, gamma = seq(0.1,0.2,0.01), cost = c(0.1, 1, 10) )
summary(tune.svm)
predicted <- predict( tune.svm$best.model, newdata=test.data, decision.value=TRUE )

( accuracy <- sum( ifelse(test.data$hoax == predicted, 1, 0) ) / nrow(test.data) )
( recall <- sum( test.data$hoax==1 & predicted==1 ) / sum( test.data$hoax==1 ) )
( misclassification.table <- table(test.data$hoax, predicted) )
