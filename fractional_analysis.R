# Titulo: analisis numerico, exploratorio y ajuste de modelos fraccionarios
# para la prevision de GPD futuros de China.

# Analisis exploratorio
library(dplyr)
library(tsibble)
library(ggplot2)

china <- read.csv("china data.csv", header = TRUE , 
                  sep = ",", stringsAsFactors=FALSE)

str(china)

china <- china[,-c(1,2, 4)]

str(china)

# Transformo todo a numerico
china[] <- lapply(china, function(x) as.numeric(as.character(x)))
china
sapply(china, class)

View(china)

# Inputations
library(imputeTS)
# pendiente


###########
plot(china$Time, china$Agricultural_land, type = "l", lwd = 2, col = "blue")

print(china$Land_area)

tsbl <- as_tsibble(china, index = Time)
str(tsbl)

# Graficos usando ggplot2

p1 <- ggplot(tsbl, aes(x = as.integer(Time), y = Land_area)) + 
  geom_line( col = "blue") +
  xlab("Años") + ylab("Land area")+
  ggtitle("Land area of China")

p1


p2 <- ggplot(tsbl, aes(x = Time, y = Agricultural_land)) + 
  geom_line( col = "blue") +
  xlab("Años") + ylab("GDP")+
  ggtitle("GDP of China")

p2


p3 <- ggplot(tsbl, aes(x = Time, y = Population)) + 
  geom_line( col = "blue") + 
  xlab("Años") + ylab("GDP") +
  ggtitle("Population of China")  

p3

p4 <- ggplot(tsbl, aes(x = Time, y = GDP)) + 
  geom_line( col = "blue") +
  xlab("Años") + ylab("GDP")+
  ggtitle("GDP of China")

p4


p5 <- ggplot(tsbl, aes(x = Time, y = CCF)) + 
  geom_line( col = "blue") +
  xlab("Años") + ylab("CCF")+
  ggtitle("GDP of China")

p5


# Ajuste de modelos fraccionarios



# Prediccion con modelos fraccionarios




# Prediccion con modelos ARFIMA
