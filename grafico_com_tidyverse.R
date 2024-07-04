
# Gráficos com tidyverse -------------------------------------------------------------------------------------------------------------------
# Autoria do script: Jeanne Franco ---------------------------------------------------------------------------------------------------------
# Data: 03/07/24 ---------------------------------------------------------------------------------------------------------------------------

# Carregar pacotes -------------------------------------------------------------------------------------------------------------------------

library(tidyverse)
library(dados)
library(psych)

# Carregar dados ---------------------------------------------------------------------------------------------------------------------------

data <- dados::dados_starwars
view(data)
glimpse(data)

# Análise exploratória dos dados -----------------------------------------------------------------------------------------------------------

## Função summary() - Média, mediana, quartis, máximos e mínimos

summary(data$altura)
summary(data$massa)

## Funções describe() e describeBy() -  Média, desvio, erro, mediana, skew, kurtosis, etc. 

describe(data$altura)
describe(data$massa)

describeBy(data$altura, group = data$genero)
describeBy(data$altura, group = data$especie)

describeBy(data$massa, group = data$genero)
describeBy(data$massa, group = data$especie)

describeBy(data$altura, group = data$cor_do_cabelo)
describeBy(data$massa, group = data$nome)

## Função group_by do pacote dplyr 

tabela <- data %>%
  group_by(sexo_biologico) %>%
  drop_na() %>%
  summarise(Media = mean(massa),
            DP = sd(massa),
            Mediana =  median(massa),
            N = n(),
            EP = DP/sqrt(N))
tabela
View(tabela)

# Gráfico ----------------------------------------------------------------------------------------------------------------------------------

ggplot(tabela, aes(x = sexo_biologico, y = Media)) +
  geom_col() +
  geom_errorbar(aes(ymin = Media - EP, ymax = Media + EP),
                size = 0.8, width = 0.2) +
  labs(y = "Altura (cm)", x = "Sexo Biológico") +
  theme_bw()

