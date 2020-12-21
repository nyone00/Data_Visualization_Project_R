
library(ggplot2)
library(ggthemes)
library(data.table)

pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")



df <- fread('Economist_Assignment_Data.csv',drop=1)

head(df)


pl <- ggplot(df,aes(x=CPI,y=HDI)) + geom_point(aes(color=factor(Region)),size=4,shape=1)
pl2 <- pl + geom_smooth(aes(group=1),method = "lm",formula = y ~ log(x),se = FALSE,color='red')
plot(pl2)

pl3 <- pl2 + geom_text(aes(label = Country), color = "gray20", 
                       data = subset(df, Country %in% pointsToLabel),check_overlap = TRUE)

pl4 <- pl3 + theme_bw(base_size = 11) + scale_x_continuous(name = 'Corruption Perceptions Index, 2011 (10 = least corrupt)',
            limits = c(0.9,10.5),breaks = 1:10) + scale_y_continuous(name = 'Human  Development Index,2011(1=Best)',limits=c(0.3,0.85),breaks=1:10)

print(pl4+theme_economist_white())
