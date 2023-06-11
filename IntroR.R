clase2 <- read.csv("Clase 2 estadistica_practicar.csv", header = TRUE, sep = ",")

setwd("~/1. Académico/5. Maestría_El Colegio de México/1. Maestría/2. Segundo semestre/1. Análisis demográfico II/R")

2+2
3+21
6+3456

#CONCATENAR UN VECTOR

c(2, 5, 7, 9, 1000, 453)
a <- c(1, 2, 3, 4, 5)
a

#Vector con caracteres
itzel <- c("chucho", "lalo", "pedro")
itzel


#Operaciones con vectores
b <- c(6, 7, 8, 9, 10)
c <-  c(11, 12, 13)

#Los vectores tienen que ser de la misma longitud para que nop arroje error
d <- a + b
#Multiplica elemento a elemento, siempre que tengan los vectores la misma longitud
e <-a * b
#divide elemento a elemento, siempre que los vectores tengan la misma longitud
f <- b / a
#Se pueden usar paréntesis para que se corran las funciones sin tener que correrlas después
(f <- b / a)

#Las matrices tienen dimensión, lo vestores tienen longitud
#Funcion matrix(valores, num renglones, num columnas)
matrix(NA, 4, 16)

matrix(cbind(c(1, 2, 3, 4), c(5, 6, 7, 8)), 4, 16)
#Si quiero que se ordenen los valores por renglones
matrix(cbind(c(1, 2, 3, 4), c(5, 6, 7, 8)), 4, 16, byrow = TRUE)
#Secuencias de 5 en 5
seq(0, 25, by = 5)
#repetir valores
rep(4, times = 35)
rep(a, times = 6) 
rep(a, each = 6)
#agregar matriz a un objeto
A <- matrix(c(1:10), 5, 2, byrow = TRUE)
#extraer elemento de la matriz, con número de renglón, columna
A[3,2]
#saber qué tipo de arreglo es un objeto
class(A)

(B <- as.data.frame(A))

class(B)

names(B) <- c("Perengano", "Sultano")

B$Perengano
B[, "Sultano"]
B[, 2]

(A <- matrix(c(1:10), 5, 2, byrow = T))
(C <- matrix(c(11:20), 5, 2, byrow = T))

D <- A / C
#BORRAR TODOS LOS ELEMENTOS DEL AMBIENTE
rm(list = ls())

#Abrir archivos csv
Nt <- read.csv("Nt.csv", header = TRUE, row.names = 1)
#Cambio de volumen poblacional entre 1950 y 1951, con número de renglón y columna
Nt[, 2] - Nt[,1]
#Cambio de volumen poblacional entre 1950 y 2010, con nombre de columna
Nt[, "X2010"] - Nt[, "X1950"]

dif <- matrix(NA, 8, 60)

#Sustituir todos los renglones de columna 1, 2, 3, de la matriz con NA por los valores de las diferencias en NT#
dif[,1] <- Nt[,2] - Nt[,1]
dif[,2] <- Nt[,3] - Nt[,2]
dif[,3] <- Nt[,4] - Nt[,3]

#Loop para sustutuir valores de una matriz#
#i es el valor de la columna#
for(i in 1:60){
  dif[,i] <- Nt[,i+1] - Nt[,i]
}

#Convertir una matriz a un dataframe#
dif <- as.data.frame(dif)
#pedir nombres de mis variables#
names(dif)

#renombrar los nombres de mis variables#
names(dif) <- c(1950:2009)
names(dif) <- seq(1950.5, )
#nombres a los renglones#
row.names(dif) <- row.names(Nt)

#Tasas de crecimiento#
log(Nt[(5*1)+1,1]/Nt[(5*1)+1,1])/5


#transponer matrices#
Nt <- t(Nt)


#Primer quinquenio 1950-1954; 2do: 1955-1959, 3ero: 1960-1964, etc...#

#log(Nt[5,] / Nt[1,])/5
log(Nt[5*1+0,] / Nt[5*0+1,])/5
#log(Nt[10,] / Nt[6,])/5
log(Nt[5*2+1,] / Nt[5*1+1,])/5
#log(Nt[15,] / Nt[11,])/5
log(Nt[5*3+2,] / Nt[5*2+2,])/5

#Tasas quinquenales#
rt <- as.data.frame(matrix(0, 12, 8))
rt[1,] <- 100*log(Nt[5,]/Nt[1,])/5 
for(i in 2:12){
  rt[i,] <- 100*log(Nt[5*i+(i-1),] / Nt[5*(i-1)+(i-1),])/5
}

