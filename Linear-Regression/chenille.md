---
title: "R Notebook"
output:
  html_document:
    df_print: paged
---

This is an [R Markdown](http://rmarkdown.rstudio.com) Notebook. When you execute code within the notebook, the results appear beneath the code.

Try executing this chunk by clicking the *Run* button within the chunk or by placing your cursor inside it and pressing *Ctrl+Shift+Enter*.

```{r}
chenille = read.table(file = "chenilles.txt", header = TRUE)
head(chenille)
pairs(chenille)

```

```{r}

mod1 = lm(chenille$Y~., data = chenille)
summary(mod1)
par(mfrow=c(2,2))
plot(mod1)
```

```{r}
mod1 = lm(chenille$Y~.-X7-X8-X6-X3-X10-X9, data = chenille)
summary(mod1)
par(mfrow=c(2,2))
plot(mod1)
```

```{r}
aic=step(mod1,direction = "backward",k=2)
```

```{r}
bic=step(mod1,direction = "backward",k=log(nrow(chenille)))
coef(bic)
```

```{r}
mod2 = lm(chenille$Y~ poly(X1,1) +poly(X2,2)+poly(X4,1)+poly(X5,1), data = chenille)
summary(mod2)
par(mfrow=c(2,2))
plot(mod2)
```

```{r}
mod3 = lm(chenille$Y~ X1*X2*X4*X5-X1:X2-X1:X2:X5-X2-X1-X4-X2:X4-X1:X2:X4:X5-X2:X4:X5-X1:X4-X2:X5  , data = chenille)
summary(mod3)
par(mfrow=c(2,2))
plot(mod3)
```

```{r}
aic=step(lm(chenille$Y~ X1*X2*X4*X5  , data = chenille),direction = "backward",k=2)
```
