#Load API and access key; make sure to have installed "alphavantager" package
#May have to hit run a few times before it prints the correct output
library(alphavantager)
av_api_key("KPS1XQIF90AH8KWC")


#Specify stock ticker symbol(All caps) you want to look up as x, in quotes
#Examples: "TSLA"(Tesla), "SPCE"(Virgin Galactic), "AMZN"(Amazon), "CGC"(Canopy Growth Corp)
x <- "TSLA"

#Daily AROON technical indicator, with 7 data points(7 days)
ti_aroon <-  av_get(symbol = x,
                    av_fun      = "AROON",
                    interval    = "daily",
                    time_period = 7,
                    outputsize  = "full")

#Daily AD technical indicator, from previous trading day
ti_ad <-  av_get(symbol = x,
                 av_fun      = "AD",
                 interval    = "daily",
                 outputsize  = "full")

#Neutral = no strong indication of price movement; bullish = price trending upwards; bearish = trending downwards
if (mean(ti_aroon$aroon_up) > mean(ti_aroon$aroon_down) & mean(ti_ad$chaikin_a_d) > 0){
  print("Bullish")
} else if(mean(ti_aroon$aroon_up) < mean(ti_aroon$aroon_down) & mean(ti_ad$chaikin_a_d) < 0){
  print("Bearish")
} else{
  print("Neutral")
}

