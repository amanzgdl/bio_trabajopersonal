library(MLDataR)
tyr <- MLDataR::thyroid_disease
write.csv(tyr, file = "dataset_tiroides.csv")

sessionInfo() #poner al final de nuestros trabajos.

#order

head(tyr)

sort(tyr$patient_age)

tyr2 <- tyr[order(tyr$presc_anthyroid_meds),] #con sort solo ordena el vector pero 
#con esto se ordenan todas las variables
head(tyr2)

#quitar todos los missing de un dataset
tyr_completo <- tyr[complete.cases(tyr),]

#aggregate -> agrupar variables

#para ver edad media por geneero y dependiendo de si tienen tiroides o no 

#aggregate(valores, por qué queremos agrupar, estadístico a usar)
edad_tyr <- aggregate(tyr_completo$patient_age, list(tyr_completo$ThryroidClass, tyr_completo$patient_gender), mean)

#para cambiar los nombres de las columnas de edad_tyr usamos names y concatenamos los nombres
names(edad_tyr) <- c("Tiroides", "Genero", "Media")
edad_tyr
