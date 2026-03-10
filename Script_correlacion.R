
# Spearman ----------------------------------------------------------------


resp <- data.frame(
  Tiempo = c(12, 15, 17, 18, 20, 21, 22, 26),
  Edad = c(13, 25, 20, 35, 45, 30, 60, 95)
)
resp

plot(resp$Tiempo, resp$Edad,
     col = "black",
     pch = 19,
     xlab = "Tiempo respuesta",
     ylab = "Edad")


# Crear nuevas columnas con los rangos (1 a 8)
resp$Rango_Tiempo <- rank(resp$Tiempo, ties.method = "first")
resp$Rango_Edad   <- rank(resp$Edad, ties.method = "first")

# Ver resultado
resp

plot(resp$Rango_Tiempo, resp$Rango_Edad,
     col = "firebrick", # Color de datos
     pch = 19, # cambia la forma del simbolo
     cex = 1.2, # Modifica el tamaño del simbolo
     xlab = "Rango variable tiempo", # Eje X
     ylab = "Rango edad" # Eje Y
)


cor.test(resp$Rango_Tiempo, resp$Rango_Edad, method = "spearman")


# Tau de kendall ----------------------------------------------------------

tau <- data.frame(
  A = c(1,2,3,4,5,6),
  B = c(3,1,4,2,6,5)
)
cor.test(tau$A, tau$B, method = "kendall")


plot(tau$A, tau$B,
     col = "firebrick", # Color de datos
     pch = 19, # cambia la forma del simbolo
     cex = 1.4, # Modifica el tamaño del simbolo
     xlab = "Evaluación Med. A", # Eje X
     ylab = "Evaluación Med. B" # Eje Y
)

# La evaluación de la salud de los pacientes por ambos Médicos
# de forma individual no es coincidente
# su coeficiente de correlación es medio (r =0.47)
# y no presenta significancia estadística (p-value = 0.2722).

set.seed(123)  # Para reproducibilidad

# Número de observaciones
n <- 20  

# Generar horas de estudio (entre 1 y 10)
Horas_estudio <- sample(1:10, n, replace = TRUE)

# Asignar probabilidad de aprobar en función de horas de estudio
# A más horas, más alta la probabilidad
Resultado <- sapply(Horas_estudio, function(horas) {
  ifelse(runif(1) < (horas / 10), "Aprobado", "Reprobado")
})

# Crear data frame
estudio <- data.frame(
  Estudiante = 1:n,
  Horas_estudio,
  Resultado
)


# Crear variable dicotómica: 1 = Aprobado, 0 = Reprobado
estudio$Res_bin <- ifelse(estudio$Resultado == "Aprobado", 1, 0)
head(estudio)


cor.test(estudio$Horas_estudio, estudio$Res_bin, method = "pearson")
 