data<-read.csv("C:/Users/ASUS/Desktop/revised.csv")
View(data)
data$D_BHOWN<-ifelse(data$BHOWN>=0.5,1,0)
View(data)
require(corrplot)
cor(data[,c(4:20,22)])%>%corrplot
library("Hmisc")
cor_2<-rcorr(as.matrix(data[,c(4:20,22)]))
cor_2

library(dplyr)
library(corrplot)
cor(data[,c(4:20,22)])%>%corrplot
library("Hmisc")
cor_2<-rcorr(as.matrix(data[,c(4:20,22)]))
cor_2
model<-lm(formula=TP_AN~DUAL+PIDEP+BSIZE+IO+BOWN+BHOWN+D_BHOWN+AUDI,data=data)
model<-lm(formula=TP_EN~DUAL+PIDEP+BSIZE+IO+BOWN+BHOWN+D_BHOWN+AUDI,data=data)
model1<-lm(formula=CAR~DUAL+PIDEP+BSIZE+IO+BOWN+BHOWN+D_BHOWN+AUDI,data=data)
model1<-lm(formula=TP_AN~DUAL+PIDEP+BSIZE+IO+BOWN+BHOWN+D_BHOWN+AUDI+MOM+VOL+EVOL+TPREV+lnMV+PE+PB,data=data)
library(AER)
tslsmodel<-ivreg(formula=TP_AN~DUAL+PIDEP+BSIZE+IO+BOWN+BHOWN+D_BHOWN+AUDI+MOM+VOL+EVOL+TPREV+lnMV+PE+PB,data=data)
data3<-lm(TP_AN~DUAL+PIDEP+BSIZE+IO+BOWN+BHOWN+D_BHOWN+AUDI+MOM+VOL+EVOL+TPREV+lnMV+PE+PB+FIO,data=revised)
data02<-revised[order(revised$TP_AN),]
mean(data02$DUAL[1:5778])
mean(data02$DUAL[11556:17334])
TPAN1<-revised[order(revised$TP_AN[11557:17334]),]'前1/3大的'
TPAN3<-revised[order(revised$TP_AN[1:5778]),]'後面的1/3'
t.test(TPAN1$DUAL,TPAN3$DUAL,paired=TRUE)'t-test如果是一對的,要打paired=TRUE'
mean(TPAN1$BSIZE)
mean(TPAN3$BSIZE)
summary(revised$TP_AN)
choose1<-subset(revised,TP_AN<-0.19435)
choose<-subset(revised,TP_AN>0.07722)
mean(choose1$BSIZE)'Q1的資料'
mean(choose$BSIZE)'Q3的資料'
t.test(choose1$PIDEP,choose$PIDEP,paired=TRUE)
TPAN1<-revised[order(revised$TP_AN,decreasing = T),]
mean(TPAN1$DUAL[1:5200])
mean(TPAN1$DUAL[12135:17334])
t.test(TPAN1$DUAL[1:5200],TPAN1$DUAL[12135:17334],paired=TRUE)
TPAN2<-revised[order(revised$TP_EN,decreasing = T),]
mean(TPAN2$DUAL[1:5200])
mean(TPAN2$DUAL[12135:17334])
t.test(TPAN2$DUAL[1:5200],TPAN2$DUAL[12135:17334],paired=TRUE)
TPAN2<-revised[order(revised$CAR,decreasing = T),]
mean(TPAN2$DUAL[1:5200])
mean(TPAN2$DUAL[12135:17334])
t.test(TPAN2$DUAL[1:5200],TPAN2$DUAL[12135:17334],paired=TRUE)
TPANP<-subset(revised,TP_AN>0)
model<-lm(formula=TP_AN~DUAL+PIDEP+BSIZE+IO+BOWN+BHOWN+D_BHOWN+AUDI,data=TPANP)
summary(model)
model1<-lm(formula=TP_AN~DUAL+PIDEP+BSIZE+IO+BOWN+BHOWN+D_BHOWN+AUDI+MOM+VOL+EVOL+TPREV+lnMV+PE+PB,data=TPANP)
summary(model1)
TPANN<-subset(revised,TP_AN<0)
TPENP<-subset(revised,TP_EN>0)
model<-lm(formula=TP_EN~DUAL+PIDEP+BSIZE+IO+BOWN+BHOWN+D_BHOWN+AUDI,data=TPENP)
model1<-lm(formula=TP_EN~DUAL+PIDEP+BSIZE+IO+BOWN+BHOWN+D_BHOWN+AUDI+MOM+VOL+EVOL+TPREV+lnMV+PE+PB,data=TPENP)
summary(model1)
TPENN<-subset(revised,TP_EN<0)
model<-lm(formula=TP_EN~DUAL+PIDEP+BSIZE+IO+BOWN+BHOWN+D_BHOWN+AUDI,data=TPENN)
model1<-lm(formula=TP_EN~DUAL+PIDEP+BSIZE+IO+BOWN+BHOWN+D_BHOWN+AUDI+MOM+VOL+EVOL+TPREV+lnMV+PE+PB,data=TPENN)
summary(model1)
CARP<-subset(revised,CAR>0)
model<-lm(formula=CAR~DUAL+PIDEP+BSIZE+IO+BOWN+BHOWN+D_BHOWN+AUDI,data=CARP)
model1<-lm(formula=CAR~DUAL+PIDEP+BSIZE+IO+BOWN+BHOWN+D_BHOWN+AUDI+MOM+VOL+EVOL+TPREV+lnMV+PE+PB,data=CARP)
summary(model1)
CARN<-subset(revised,CAR<0)
model<-lm(formula=CAR~DUAL+PIDEP+BSIZE+IO+BOWN+BHOWN+D_BHOWN+AUDI,data=CARN)
model1<-lm(formula=CAR~DUAL+PIDEP+BSIZE+IO+BOWN+BHOWN+D_BHOWN+AUDI+MOM+VOL+EVOL+TPREV+lnMV+PE+PB,data=CARN)
summary(model1)
model1<-lm(formula=TP_AN~DUAL+PIDEP+BSIZE+IO+BOWN+BHOWN+D_BHOWN+AUDI+MOM+VOL+EVOL+TPREV+lnMV+PE+PB+FIO,data=TPANP)
TPANN$FIO<-as.numeric(TPANN$FIO)
TPANP$FIO<-as.numeric(TPANP$FIO)
TPENN$FIO<-as.numeric(TPENN$FIO)
TPENP$FIO<-as.numeric(TPENP$FIO)
model1<-lm(formula=CAR~DUAL+PIDEP+BSIZE+IO+BOWN+BHOWN+D_BHOWN+AUDI+MOM+VOL+EVOL+TPREV+lnMV+PE+PB+FIO,data=TPANN)
summary(model1)
library(dplyr)
data$year2=case_when(
  data$year==2007~1,
  data$year==2008~2,
  data$year==2009~3,
  data$year==2010~4,
  data$year==2011~5,
  data$year==2012~6,
  data$year==2013~7,
  data$year==2014~8,
  data$year==2015~9,
  data$year==2016~10
)
install.packages("knitr")
data$absTPAN<-abs(data$TP_AN)
data$absTPEN<-abs(data$TP_EN)
sd(data$absTPAN)
data$PIDEPN<-data$PIDEP*(-1)
data$ION<-data$IO*(-1)
data$AUDIN<-data$AUDI(-1)
model1<-lm(formula=CAR~DUAL+PIDEP+BSIZE+IO+BOWN+BHOWN+D_BHOWN+AUDI+MOM+VOL+EVOL+TPREV+lnMV+PE+PB+year2,data=CARN)
model1<-lm(formula=absTPAN~DUAL+PIDEP+BSIZE+IO+BOWN+BHOWN+D_BHOWN+AUDI+MOM+VOL+EVOL+TPREV+lnMV+PE+PB+FIO+year2,data=data)
library(stargazer)
linear.1<-lm(formula=absTPAN~DUAL+PIDEP+BSIZE+IO+BOWN+BHOWN+AUDI,data=data)
linear.2<-lm(formula=absTPEN~DUAL+PIDEP+BSIZE+IO+BOWN+BHOWN+AUDI,data=data)
stargazer(linear.1,linear.2,type="text",out="models.txt",report=('vc*t'))
linear.1<-lm(formula=CAR~DUAL+PIDEP+BSIZE+IO+BOWN+BHOWN+AUDI,data=data)
linear.2<-lm(formula=CAR~DUAL+PIDEP+BSIZE+IO+BOWN+BHOWN+AUDI+MOM+VOL+EVOL+TPREV+lnMV+PE+PB+year2,data=data)
stargazer(linear.1,linear.2,type="text",out="models.txt",report=('vc*t'))
linear.1<-lm(formula=absTPAN~DUAL+PIDEP+BSIZE+IO+BOWN+BHOWN+AUDI+MOM+VOL+EVOL+TPREV+lnMV+PE+PB+FIO+year2,data=data)
iv1 = ivreg(absTPAN~DUAL+PIDEP+BSIZE+IO+BOWN+BHOWN+AUDI+MOM+VOL+EVOL+TPREV+lnMV+PE+PB+year2 | IO+FIO , data = data)