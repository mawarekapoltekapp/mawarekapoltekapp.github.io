setwd("D:/METOPEL UAS/MAWAR METOPEL")
library(readxl)
library(tidyverse)
library(kableExtra)
read_excel("cengkeh.xlsx")
dat <- read_excel("cengkeh.xlsx")
kbl(dat) %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"))

# regresi
reg1<-lm(tembakau~cengkeh+kurs,data=dat)
summary(reg1)

plot(dat$tahun,dat$tembakau,xlab="Tahun",ylab="Nilai FOB Ekspor Tembakau")
plot(dat$tahun,dat$cengkeh,xlab="Tahun",ylab="Nilai FOB Ekspor Cengkeh")
plot(dat$tahun,dat$kurs,xlab="Tahun",ylab="Nilai Tukar USD/IDR")

dat$m<-resid(reg1)
plot(dat$tembakau,dat$m,xlab="Nilai Ekspor Tembakau",ylab="error")
abline(h=0) # membuat garis horizontal di y=0

dat$m<-resid(reg1)
plot(dat$cengkeh,dat$m,xlab="Nilai Ekspor Cengkeh",ylab="error")
abline(h=0) # membuat garis horizontal di y=0

dat$m<-resid(reg1)
plot(dat$kurs,dat$m,xlab="Nilai Tukar Mata Uang",ylab="error")
abline(h=0) # membuat garis horizontal di y=0

