---
title: "R Notebook"
output: html_notebook
---

This is an [R Markdown](http://rmarkdown.rstudio.com) Notebook. When you execute code within the notebook, the results appear beneath the code.

Try executing this chunk by clicking the *Run* button within the chunk or by placing your cursor inside it and pressing *Ctrl+Shift+Enter*.

```{r}
DB = read.table(file = "immo.txt", header = TRUE)
mod=lm(prix ~ m2, data=DB)
plot(prix~m2, data = DB)
abline(mod$coefficients, col = 'red')
```

```{r}
summary(mod)
```

```{r}
nouvel_appart = data.frame(m2 = 90)
prediction = predict(mod, newdata = nouvel_appart)
plot(prix~m2, data = DB)
abline(mod$coefficients, col = 'red')
points(nouvel_appart$m2,prediction,col ="blue", pch = 19)
prediction_IP = data.frame(predict(mod, newdata = nouvel_appart, interval = 'prediction', level = 0.95))
points(nouvel_appart$m2,prediction_IP$lwr,col ="blue", pch = 22)
points(nouvel_appart$m2,prediction_IP$upr,col ="blue", pch = 22)
prediction_IP$lwr
prediction_IP$upr
prediction_IP$upr-prediction_IP$lwr
```

```{r}
summary(mod)
plot(mod)
```

```{r}
mod2=lm(prix ~ poly(m2,2), data=DB)
par(mfrow=c(2,2))
plot(mod2)
summary(mod2)
prediction_IP2 = data.frame(predict(mod2, newdata = nouvel_appart, interval = 'prediction', level = 0.95))
prediction_IP2$lwr
prediction_IP2$upr
prediction_IP2$upr-prediction_IP2$lwr

par(mfrow=c(1,1))
plot(prix ~ m2, data = DB)
lines(DB$m2, fitted(mod2), col = 'red')
```
