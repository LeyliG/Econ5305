# Ch.2.2

library(readxl)

FRED_series_GDP_SP500_complete_1 <- read_excel("~/personal docs/grad/SeattleU/classes/ECON5305/FRED_series_GDP_SP500_complete-1.xlsx")
View(FRED_series_GDP_SP500_complete_1)

# descriptive statistics and histogram:
summary(FRED_series_GDP_SP500_complete_1)
hist(FRED_series_GDP_SP500_complete_1$GDP_PCH)
hist(FRED_series_GDP_SP500_complete_1$SP500_PCH)

# plot the variables against each other:
ggplot( FRED_series_GDP_SP500_complete_1, aes(x = observation_date )) +
  #add one line for Export
  geom_line(aes(y = GDP_PCH , colour = "GDP_PCH") ) + 
  # add another line for Import
  geom_line(aes(y = SP500_PCH , colour = "SP500_PCH")) +
  theme_classic() + 
  scale_y_continuous(limits = c(-10,15)) + 
  scale_color_manual(name = '',
                       breaks = c( "GDP_PCH" , "SP500_PCH" ),
                       values = c( "GDP_PCH" =  'blue' ,
                                   "SP500_PCH" = 'maroon' )
                       ) + 
  ylab( "GDP growth rate / S&P 500 returns") +
  xlab("Observation Date")
