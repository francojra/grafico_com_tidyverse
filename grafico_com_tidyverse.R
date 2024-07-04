
# Gráficos com tidyverse -------------------------------------------------------------------------------------------------------------------
# Autoria do script: Jeanne Franco ---------------------------------------------------------------------------------------------------------
# Data: 03/07/24 ---------------------------------------------------------------------------------------------------------------------------

# Carregar pacotes -------------------------------------------------------------------------------------------------------------------------

library(tidyverse)
library(dados)

# Carregar dados ---------------------------------------------------------------------------------------------------------------------------

data <- dados::dados_starwars
view(data)
glimpse(data)

# Análise exploratória dos dados -----------------------------------------------------------------------------------------------------------

## Função summary() - Média, mediana, quartis, máximos e mínimos

summary(data$altura)
summary(data$massa)

# Funções describe() e describeBy() -  Média, desvio, erro, mediana, skew, kurtosis, etc. --------------------------------------------------

describe(dados$N_Filhos)

describeBy(dados$Salario, group = dados$Genero)

describeBy(dados$Salario, group = dados$Genero:dados$Grau_de_Instruçao)

# Função group_by do pacote dplyr ----------------------------------------------------------------------------------------------------------

tabela <- dados %>%
  group_by(Genero, Grau_de_Instruçao) %>%
  summarise(Media = mean(Salario),
            DP = sd(Salario),
            Mediana =  median(Salario))
tabela
View(tabela)

