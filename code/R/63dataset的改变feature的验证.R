#####################
##特征筛选######
compositontransition=function(aminoseq1)
{
x=aminoseq1
xamino=strsplit(x,"")
xamino1=xamino[[1]]
aminocompositon=table(xamino1)/length(xamino1)
name=names(aminocompositon)
tdata=as.numeric(aminocompositon)
oname=c("A","C","D","E","F","G","H","I","K","L","M","N","P","Q","R","S","T","V","W","Y")
data=rep(0,20)
for(i in 1:length(name))
{j=str_which(oname,name[i])
 data[j]=tdata[i]
}
return(data)
}

hydoptransitondata=function(aminoseq1)
{
x=aminoseq1
#氨基酸序列被字母P,N,H代替
x1=gsub("G","Z",x)
x2=gsub("A","Z",x1)
x3=gsub("S","Z",x2)
x4=gsub("T","Z",x3)
x5=gsub("P","Z",x4)
x6=gsub("H","Z",x5)
x7=gsub("Y","Z",x6)

x8=gsub("R","P",x7)
x9=gsub("K","P",x8)
x10=gsub("E","P",x9)
x11=gsub("Q","P",x10)
x12=gsub("N","P",x11)
x13=gsub("D","P",x12)

x14=gsub("C","H",x13)
x15=gsub("V","H",x14)
x16=gsub("L","H",x15)
x17=gsub("I","H",x16)
x18=gsub("M","H",x17)
x19=gsub("F","H",x18)
x20=gsub("W","H",x19)
x211=gsub("Z","N",x20)

x212=strsplit(x211,"")
x21=x212[[1]]
tlength=length(x21)


#计算分布distribition
p1=grep("P",x21)#提取P的位置
plength=length(p1)#计算P的个数
if(plength!=0)
{
ap=floor(0.25*plength)
if(ap==0)ap=1
bp=floor(0.50*plength)
if(bp==0)bp=1
cp=floor(0.75*plength)
if(cp==0)cp=1
dp1=p1[c(1,ap,bp,cp,plength)]/tlength
}else dp1=c(0,0,0,0,0)

N1=grep("N",x21)
Nlength=length(N1)
if(Nlength!=0)
{
aN=floor(0.25*Nlength)
if(aN==0)aN=1
bN=floor(0.50*Nlength)
if(bN==0)bN=1
cN=floor(0.75*Nlength)
if(cN==0)cN=1
dN1=N1[c(1,aN,bN,cN,Nlength)]/tlength
}else dN1=c(0,0,0,0,0)

H1=grep("H",x21)
Hlength=length(H1)
if(Hlength!=0)
{
aH=floor(0.25*Hlength)
if(aH==0)aH=1
bH=floor(0.50*Hlength)
if(bH==0)bH=1
cH=floor(0.75*Hlength)
if(cH==0)cH=1
dH1=H1[c(1,aH,bH,cH,Hlength)]/tlength
}else dH1=c(0,0,0,0,0)
alld=c(dp1,dN1,dH1)
#计算组成composition
cp1=length(p1)/tlength
cN1=length(N1)/tlength
cH1=length(H1)/tlength
cdata=c(cp1,cN1,cH1)
cname=c("P","N","H")
allc=cdata
#计算转换数据transition
x22=gsub("P","-1",x21)
x23=gsub("N","0",x22)
x24=gsub("H","1",x23)
x25=as.numeric(x24)
x26=x25[-1]
x27=x25[-tlength]
tx=grep("TRUE",x26!=x27)
tx1=x25[tx]+x25[tx+1]
tpn=length(grep("-1",tx1))/tlength
tph=length(grep("0",tx1))/tlength
tnh=length(grep("1",tx1))/tlength
allt=c(tpn,tph,tnh)
data=c(allc,allt,alld)
return(data)
}

vandertransition=function(aminoseq1)
{
x=aminoseq1
#氨基酸序列被字母P,N,H代替
x1=gsub("G","P",x)
x2=gsub("A","P",x1)
x3=gsub("S","P",x2)
x4=gsub("C","P",x3)
x5=gsub("T","P",x4)
x6=gsub("P","P",x5)
x7=gsub("D","P",x6)

x8=gsub("N","N",x7)
x9=gsub("V","N",x8)
x10=gsub("E","N",x9)
x11=gsub("Q","N",x10)
x12=gsub("I","N",x11)
x13=gsub("L","N",x12)

x14=gsub("M","H",x13)
x15=gsub("H","H",x14)
x16=gsub("K","H",x15)
x17=gsub("F","H",x16)
x18=gsub("R","H",x17)
x19=gsub("Y","H",x18)
x20=gsub("W","H",x19)

#计算分布distribition
x212=strsplit(x20,"")
x21=x212[[1]]
tlength=length(x21)
p1=grep("P",x21)
plength=length(p1)
if(plength!=0)
{
ap=floor(0.25*plength)
if(ap==0)ap=1
bp=floor(0.50*plength)
if(bp==0)bp=1
cp=floor(0.75*plength)
if(cp==0)cp=1
dp1=p1[c(1,ap,bp,cp,plength)]/tlength
}else dp1=c(0,0,0,0,0)

N1=grep("N",x21)
Nlength=length(N1)
if(Nlength!=0)
{
aN=floor(0.25*Nlength)
if(aN==0)aN=1
bN=floor(0.50*Nlength)
if(bN==0)bN=1
cN=floor(0.75*Nlength)
if(cN==0)cN=1
dN1=N1[c(1,aN,bN,cN,Nlength)]/tlength
}else dN1=c(0,0,0,0,0)

H1=grep("H",x21)
Hlength=length(H1)
if(Hlength!=0){
aH=floor(0.25*Hlength)
if(aH==0)aH=1
bH=floor(0.50*Hlength)
if(bH==0)bH=1
cH=floor(0.75*Hlength)
if(cH==0)cH=1
dH1=H1[c(1,aH,bH,cH,Hlength)]/tlength
}else dH1=c(0,0,0,0,0)
alld=c(dp1,dN1,dH1)
#计算组成composition
cp1=length(p1)/tlength
cN1=length(N1)/tlength
cH1=length(H1)/tlength
cdata=c(cp1,cN1,cH1)
cname=c("P","N","H")
allc=cdata
#计算转换数据transition
x22=gsub("P","-1",x21)
x23=gsub("N","0",x22)
x24=gsub("H","1",x23)
x25=as.numeric(x24)
x26=x25[-1]
x27=x25[-tlength]
tx=grep("TRUE",x26!=x27)
tx1=x25[tx]+x25[tx+1]
tpn=length(grep("-1",tx1))/tlength
tph=length(grep("0",tx1))/tlength
tnh=length(grep("1",tx1))/tlength
allt=c(tpn,tph,tnh)
data=c(allc,allt,alld)
return(data)
}


polaritytransiton=function(aminoseq1)
{
x=aminoseq1
#氨基酸序列被字母P,N,H代替
x1=gsub("L","P",x)
x2=gsub("I","P",x1)
x3=gsub("F","P",x2)
x4=gsub("W","P",x3)
x5=gsub("C","P",x4)
x6=gsub("M","P",x5)
x7=gsub("Y","P",x6)
x8=gsub("V","P",x7)

x9=gsub("P","N",x8)
x10=gsub("A","N",x9)
x11=gsub("T","N",x10)
x12=gsub("G","N",x11)
x13=gsub("S","N",x12)

x14=gsub("H","H",x13)
x15=gsub("Q","H",x14)
x16=gsub("R","H",x15)
x17=gsub("K","H",x16)
x18=gsub("N","H",x17)
x19=gsub("E","H",x18)
x20=gsub("D","H",x19)

#计算分布distribition
x212=strsplit(x20,"")
x21=x212[[1]]
tlength=length(x21)
p1=grep("P",x21)
plength=length(p1)
if(plength!=0)
{
ap=floor(0.25*plength)
if(ap==0)ap=1
bp=floor(0.50*plength)
cp=floor(0.75*plength)
dp1=p1[c(1,ap,bp,cp,plength)]/tlength
}else dp1=c(0,0,0,0,0)

N1=grep("N",x21)
Nlength=length(N1)
if(Nlength!=0)
{
aN=floor(0.25*Nlength)
if(aN==0)aN=1
bN=floor(0.50*Nlength)
cN=floor(0.75*Nlength)
dN1=N1[c(1,aN,bN,cN,Nlength)]/tlength
}else dN1=c(0,0,0,0,0)

H1=grep("H",x21)
Hlength=length(H1)
if(Hlength!=0)
{
aH=floor(0.25*Hlength)
if(aH==0)aH=1
bH=floor(0.50*Hlength)
cH=floor(0.75*Hlength)
dH1=H1[c(1,aH,bH,cH,Hlength)]/tlength
}else dH1=c(0,0,0,0,0)
alld=c(dp1,dN1,dH1)
#计算组成composition
cp1=length(p1)/tlength
cN1=length(N1)/tlength
cH1=length(H1)/tlength
cdata=c(cp1,cN1,cH1)
cname=c("P","N","H")
allc=cdata
#计算转换数据transition
x22=gsub("P","-1",x21)
x23=gsub("N","0",x22)
x24=gsub("H","1",x23)
x25=as.numeric(x24)
x26=x25[-1]
x27=x25[-tlength]
tx=grep("TRUE",x26!=x27)
tx1=x25[tx]+x25[tx+1]
tpn=length(grep("-1",tx1))/tlength
tph=length(grep("0",tx1))/tlength
tnh=length(grep("1",tx1))/tlength
allt=c(tpn,tph,tnh)
data=c(allc,allt,alld)
return(data)
}


polarizabilitytransiton=function(aminoseq1)
{
x=aminoseq1
#氨基酸序列被字母P,N,H代替
x1=gsub("G","P",x)
x2=gsub("A","P",x1)
x3=gsub("S","P",x2)
x4=gsub("T","P",x3)
x5=gsub("D","P",x4)

x6=gsub("C","N",x5)
x7=gsub("P","N",x6)
x8=gsub("N","N",x7)
x9=gsub("V","N",x8)
x10=gsub("E","N",x9)
x11=gsub("Q","N",x10)
x12=gsub("I","N",x11)
x13=gsub("L","N",x12)

x14=gsub("K","H",x13)
x15=gsub("M","H",x14)
x16=gsub("H","H",x15)
x17=gsub("F","H",x16)
x18=gsub("R","H",x17)
x19=gsub("Y","H",x18)
x20=gsub("W","H",x19)


#计算分布distribition
x212=strsplit(x20,"")
x21=x212[[1]]
tlength=length(x21)
p1=grep("P",x21)
plength=length(p1)
if(plength!=0)
{
ap=floor(0.25*plength)
if(ap==0)ap=1
bp=floor(0.50*plength)
if(bp==0)bp=1
cp=floor(0.75*plength)
if(cp==0)cp=1
dp1=p1[c(1,ap,bp,cp,plength)]/tlength
}else dp1=c(0,0,0,0,0)

N1=grep("N",x21)
Nlength=length(N1)
if(Nlength!=0)
{
aN=floor(0.25*Nlength)
if(aN==0)aN=1
bN=floor(0.50*Nlength)
if(bN==0)bN=1
cN=floor(0.75*Nlength)
if(cN==0)cN=1
dN1=N1[c(1,aN,bN,cN,Nlength)]/tlength
}else dN1=c(0,0,0,0,0)

H1=grep("H",x21)
Hlength=length(H1)
if(Hlength!=0)
{
aH=floor(0.25*Hlength)
if(aH==0)aH=1
bH=floor(0.50*Hlength)
if(bH==0)bH=1
cH=floor(0.75*Hlength)
if(cH==0)cH=1
dH1=H1[c(1,aH,bH,cH,Hlength)]/tlength
}else dH1=c(0,0,0,0,0)
alld=c(dp1,dN1,dH1)
#计算组成composition
cp1=length(p1)/tlength
cN1=length(N1)/tlength
cH1=length(H1)/tlength
cdata=c(cp1,cN1,cH1)
cname=c("P","N","H")
allc=cdata
#计算转换数据transition
x22=gsub("P","-1",x21)
x23=gsub("N","0",x22)
x24=gsub("H","1",x23)
x25=as.numeric(x24)
x26=x25[-1]
x27=x25[-tlength]
tx=grep("TRUE",x26!=x27)
tx1=x25[tx]+x25[tx+1]
tpn=length(grep("-1",tx1))/tlength
tph=length(grep("0",tx1))/tlength
tnh=length(grep("1",tx1))/tlength
allt=c(tpn,tph,tnh)
data=c(allc,allt,alld)
return(data)
}

find=function(sequence){
k=sequence
str.one=str_split(k,"")[[1]]
kk=c(paste(str.one[-length(str.one)],str.one[-1],sep=""),str.one)
single=rep(0,420)
for(i in 1:420){
single[i]=length(grep(kk,pattern=dual.s[i]))
}
single=single/sum(single)
return(single)
}

library(ggplot2)       
library(RColorBrewer)
library(MASS)
library(dplyr)
library(stringr)
library(mixOmics)
library(caTools)
library(scorecard)
##读取数据
data=read.table("F:/zhulin/1datasz1/RNA/trainingdataset.csv",header=TRUE,sep=",")
s=c(5,45,46,57)
data=data[-s,]
feature.name=c(paste(c("x"),c(1:84),sep=""))
#################420个特征######
acid=c("A","C","D","E","F","G","H","I","K","L","M","N","P","Q","R","S","T","V","W","Y")
dacid=c("AA","CC","DD","EE","FF","GG","HH","II","KK","LL","MM","NN","PP","QQ","RR","SS","TT","VV","WW","YY")
amino.acid=combn(acid,2)
acid.1=paste(c("^"),acid,c("$"),sep="")
dacid.1=paste(c("^"),dacid,c("$"),sep="")
dual.s=c(paste(c("^"),amino.acid[2,],amino.acid[1,],c("$"),sep=""),paste(c("^"),amino.acid[1,],amino.acid[2,],c("$"),sep=""),dacid.1,acid.1)
dual.sing=c(paste(amino.acid[2,],amino.acid[1,],sep=""),paste(amino.acid[1,],amino.acid[2,],sep=""),dacid,acid)
###############
##########123个特征的位置和名字
featuredata=read.table("F:/zhulin/1datasz1/RNA/features.csv",header=TRUE,sep=",")
featurename=featuredata[,1][-1]
site=match(featurename,dual.sing)

test182=function(n,data)
{
n=1
nr=nrow(data)
trainindex=sample(1:nr,n*nr)
train=data[trainindex,]
test=data[-trainindex,]
train.aa=train$AA  
train.xname=train$Name                  
train.class2=log10(train$GU.Mid)
#############################
test.aa=test$AA  
test.xname=test$Name.1                    
test.class2=test$class2
################################
################################
#建立数据框
train.matrix=matrix(0,nrow=length(train.aa),ncol=84)
#调用转换代码
for(i in 1:length(train.aa))
{aminoseq1=train.aa[i]
train.matrix[i,c(1:21)]=hydoptransitondata(aminoseq1)
train.matrix[i,c(22:42)]=vandertransition(aminoseq1)
train.matrix[i,c(43:63)]=polaritytransiton(aminoseq1)
train.matrix[i,c(64:84)]=polarizabilitytransiton(aminoseq1)
}
#建立数据框
test.matrix=matrix(0,nrow=length(test.aa),ncol=84)
#调用转换代码
for(i in 1:length(test.aa))
{aminoseq1=train.aa[i]
test.matrix[i,c(1:21)]=hydoptransitondata(aminoseq1)
test.matrix[i,c(22:42)]=vandertransition(aminoseq1)
test.matrix[i,c(43:63)]=polaritytransiton(aminoseq1)
test.matrix[i,c(64:84)]=polarizabilitytransiton(aminoseq1)
}
rownames(train.matrix)=train.xname
rownames(test.matrix)=test.xname
colnames(test.matrix)=feature.name
colnames(train.matrix)=feature.name
#######去处全部为0的特征变量#########
train.position=nearZeroVar(train.matrix,freqCut=25,uniqueCut=18)$Position
train.matrix59=train.matrix[,-train.position]
test.matrix59=test.matrix[,-train.position]
##############sliding windows 计算频率############
############train 矩阵##########

train.420matrix=matrix(0,length(train.aa),420)
for(i in 1:length(train.aa))
{
train.420matrix[i,]=find(train.aa[i])
}
############test 矩阵##########

test.420matrix=matrix(0,length(test.aa),420)
for(i in 1:length(test.aa)){
test.420matrix[i,]=find(test.aa[i])
}
rownames(train.420matrix)=train.xname
rownames(test.420matrix)=test.xname
colnames(test.420matrix)=dual.sing
colnames(train.420matrix)=dual.sing
##直接使用123个特征
train.matrix123=train.420matrix[,site]
test.matrix123=test.420matrix[,site]
#######合并数据矩阵#########
train.63matrix182=cbind(train.matrix123,train.matrix59)
dim(train.63matrix182)
test.63matrix182=cbind(test.matrix123,test.matrix59)
##PLD-DA分析
#result=pca(train.63matrix182, ncomp = 10, center = TRUE, scale = TRUE)
#plot(result)
pls.train.182feature=plsr(train.class2~train.63matrix182,ncomp=10,scale=TRUE)
plot(pls.train.182feature,line=TRUE)
plot(R2(pls.train.182feature),legendpos = "topright")

plot(RMSEP(pls.train.182feature), legendpos = "topright")
x=RMSEP(pls.train.182feature)
rmse=as.numeric(x$val)
nrmse=as.numeric(x$val)/sd(train.class2)
plot(nrmse,type='l',main='NRMSE')
for(i in 1:10)
{
pearson[i]=cor(pls.train.182feature[["fitted.values"]][,,i],train.class2)
spearman[i]=cor(pls.train.182feature[["fitted.values"]][,,i],train.class2,method = "spearman")
}
pearson
spearman
#plotIndiv(spls.train.182feature,group=train.class2,col=c("blue","grey","red"),lty=2,ind.names=TRUE,ellipse=TRUE,legend=TRUE,X.label='Component 1',
#Y.label='Component 2',title='train-63-new-182features',plot.title = element_text(hjust = 0))
#perf.train.plsda<- perf(spls.train.182feature, validation = "Mfold", folds =3,progressBar = TRUE, auc = TRUE, nrepeat = 10)
#perf.train.plsda$error.rate
#perf.train.plsda$error.rate.class
#plot(perf.train.plsda)
#auc.plsda=auroc(spls.train.182feature, roc.comp=3)
test.predict=predict(spls.train.182feature,test.63matrix182,dist="max.dist")
prediction=test.predict$class$max.dist[,2]
confusion.mat=get.confusion_matrix(truth=test.class2,predict=prediction)
return(1-get.BER(confusion.mat))
}





