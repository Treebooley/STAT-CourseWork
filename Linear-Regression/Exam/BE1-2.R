
# Exercice 2

### Question 1


housing = read.table(file = "Linear-Regression\\Exam\\housing_new.txt", header = TRUE)
mod_h=lm(class ~ ., data=housing)
summary(mod_h)
plot(mod_h)




### Question 4


aic=step(mod_h,direction = "backward",k=12)


### Question 5


mod_h2=lm(class ~ NOX + DIS + PTRATIO + RM + LSTAT, data=housing)
summary(mod_h2)
plot(mod_h2)


### Question 6


mod_h3=lm(class ~ CRIM*ZN*INDUS*CHAS*NOX*RM*AGE*DIS*RAD*TAX*PTRATIO*LSTAT, data=housing)
summary(mod_h3)
plot(mod_h3)



aic2=step(mod_h3,direction = "backward",k=4083)
