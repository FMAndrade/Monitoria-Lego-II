######################
# Manipulacao de dados
# Felipe Macedo ######
######################
######################

getwd()
setwd("C:\\Documents and Settings\\Abdon\\Meus documentos\\Felipe\\R_lego_III\\Monitoria")

remove(list=ls(all=TRUE))


require(foreign)
require(car)

b2 <- read.spss("base_escolas_2010.sav", to.data.frame=TRUE)
class(b2$PREMIADA_rev)

# Modificando o tipo da vari?vel

b2$CRE <-as.character(b2$CRE)
class(b2$CRE)

# Verificando uma linha espec?fica do banco

b1[25,]

# Verificando uma linha e coluna espec?fica

b1[1,4]

# Verificando uma amostra de dados

b1[1:10,]

# saber o n?mero de linhas e colunas que nosso banco possui

c(nrow(b1), ncol(b1))

# Criando uma Vari?vel

b2$iderio_2009_3cat<-b2$iderio_2009_3oano

# Excluindo uma vari?vel do banco

b2$CRE<-NULL

# Recodificando uma vari?vel num?rica em grupos

b2$iderio_2009_3cat<-recode(b2$iderio_2009_3cat,"0:3.9='Baixo';4.0:5.9='M?dio';
                            6.0:10='Alto'")


# Fun??o Apply

# Esta fun??o se aplica a todas as linhas da data.frame (uma por uma)
# Como nosso banco possui muitas vari?veis, vamos primeiro passar duas para
# outro banco de dados (c)

c <- data.frame(b2$iderio_2009_3oano, b2$idrio_2010_3oano)

c$sum <-apply(c,1,sum)


# Qual o erro na nossa nova base de dados?

# Vamos primeiro transformar todos os missing value em 0 e depois rodar
# a fun??o novamente

c$b2.iderio_2009_3oano<-recode(c$b2.iderio_2009_3oano, "NA='0'")
c$b2.idrio_2010_3oano<-recode(c$b2.idrio_2010_3oano, "NA='0'")

c$sum <-apply(c,1,sum)


# Voc?s perceberam que ? meio chato ficar digitando o nome das vari?veis,
# principalmente quando eles s?o grandes

# Vamos renomear essas vari?veis
# Evitem manter vari?veis com acentos e mai?sculas
# A chance de errar aumenta!

colnames(c)[1] <- "2009"
colnames(c)[2] <- "2010"
