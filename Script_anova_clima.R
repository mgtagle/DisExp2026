# MAGT
# 14/04/2026
# Datos climatológicos
# Cumbres NL, Villagran Tamps, Carranza Coahuila
library(lubridate)
clima <- read.csv("Climatologia.csv", header =T)
clima$Localidad <- as.factor(clima$Localidad)
clima$Fecha <- as.Date(clima$Fecha, format = "%d/%m/%Y")
# clima$Hora <- as.POSIXct(clima$Hora, format = "%H:%M:%S")

boxplot(clima$TEMP~ clima$Localidad,
        col= "indianred",
        ylab = "Temp (°C)",
        xlab = "Localidades",
        ylim =c(10,35),
        outcol = "indianred", #marcar outliers en rojo
        outpch = 19) # cambiar la forma a circulo relleno

tapply(clima$TEMP, clima$Localidad, mean)
