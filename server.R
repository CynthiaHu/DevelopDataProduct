library(shiny)
library(ggplot2)


shinyServer(
  function(input, output) {

 output$answer <- renderText({calculateAge(input$expected,input$current,input$currentyrsa,input$savingra,input$currentwealth,input$inflation,input$salaryincrease,input$ROA,input$taxrate)})
 output$RTasset <- renderText({calculateRTasset(input$expected,input$current,input$currentyrsa,input$savingra,input$currentwealth,input$inflation,input$salaryincrease,input$ROA,input$taxrate)})
 output$RTcost <- renderText({calculateRTcost(input$expected,input$current,input$currentyrsa,input$savingra,input$currentwealth,input$inflation,input$salaryincrease,input$ROA,input$taxrate)})
 output$mocost <- renderText({input$currentyrsa*(1-input$taxrate-input$savingra)/12})


   calculateAge <- function(expected,current,currentyrsa,savingra,currentwealth,inflation,salaryincrease,ROA,taxrate){
     x <- expected-current+1
     age <- vector("numeric", length = x)
     salary <- vector("numeric", length = x)
     saving <- vector("numeric", length = x)
     AVsaving <- vector("numeric", length = x)
     cost <- vector("numeric", length = x)
     PVcost <- vector("numeric", length = x)
     RTage <- vector("numeric", length = x)
     
     age[1]<-current
     AVsaving[1] = currentyrsa*savingra+currentwealth
     cost[1] <- currentyrsa*(1-taxrate-savingra)
     PVcost[1]= cost[1]*(expected-age[1])
     RTage[1:x] <-expected
     
     for(t in 2:x) {
       age[t]=age[t-1]+1
       salary[t]=currentyrsa*(1+salaryincrease)^(t-1)
       saving[t]=salary[t]*savingra
       AVsaving[t]=AVsaving[t-1]*(1+ROA)+saving[t]
       cost[t]=cost[1]*(1+inflation)^(t-1)
       PVcost[t]=cost[t]*(expected-age[t])
       if (AVsaving[t]>=PVcost[t]) {
         RTage[t]=age[t]
       }
       age
       RTage
       answer <- (min(RTage))
       RTasset <- AVsaving[answer-current+1]
       RTcost<- PVcost[answer-current+1]
     }
     
     return(answer)
   }
   
   calculateRTasset <- function(expected,current,currentyrsa,savingra,currentwealth,inflation,salaryincrease,ROA,taxrate){
     x <- expected-current+1
     age <- vector("numeric", length = x)
     salary <- vector("numeric", length = x)
     saving <- vector("numeric", length = x)
     AVsaving <- vector("numeric", length = x)
     cost <- vector("numeric", length = x)
     PVcost <- vector("numeric", length = x)
     RTage <- vector("numeric", length = x)
     
     age[1]<-current
     AVsaving[1] = currentyrsa*savingra+currentwealth
     cost[1] <- currentyrsa*(1-taxrate-savingra)
     PVcost[1]= cost[1]*(expected-age[1])
     RTage[1:x] <-expected
     
     for(t in 2:x) {
       age[t]=age[t-1]+1
       salary[t]=currentyrsa*(1+salaryincrease)^(t-1)
       saving[t]=salary[t]*savingra
       AVsaving[t]=AVsaving[t-1]*(1+ROA)+saving[t]
       cost[t]=cost[1]*(1+inflation)^(t-1)
       PVcost[t]=cost[t]*(expected-age[t])
       if (AVsaving[t]>=PVcost[t]) {
         RTage[t]=age[t]
       }
       AVsaving
       RTage
       answer <- (min(RTage))
       RTasset <- AVsaving[answer-current+1]
       RTcost<- PVcost[answer-current+1]
     }
     
     return(RTasset)
   }
   
   calculateRTcost <- function(expected,current,currentyrsa,savingra,currentwealth,inflation,salaryincrease,ROA,taxrate){
     x <- expected-current+1
     age <- vector("numeric", length = x)
     salary <- vector("numeric", length = x)
     saving <- vector("numeric", length = x)
     AVsaving <- vector("numeric", length = x)
     cost <- vector("numeric", length = x)
     PVcost <- vector("numeric", length = x)
     RTage <- vector("numeric", length = x)
     
     age[1]<-current
     AVsaving[1] = currentyrsa*savingra+currentwealth
     cost[1] <- currentyrsa*(1-taxrate-savingra)
     PVcost[1]= cost[1]*(expected-age[1])
     RTage[1:x] <-expected
     
     for(t in 2:x) {
       age[t]=age[t-1]+1
       salary[t]=currentyrsa*(1+salaryincrease)^(t-1)
       saving[t]=salary[t]*savingra
       AVsaving[t]=AVsaving[t-1]*(1+ROA)+saving[t]
       cost[t]=cost[1]*(1+inflation)^(t-1)
       PVcost[t]=cost[t]*(expected-age[t])
       if (AVsaving[t]>=PVcost[t]) {
         RTage[t]=age[t]
       }
       age
       RTage
       answer <- (min(RTage))
       RTasset <- AVsaving[answer-current+1]
       RTcost<- PVcost[answer-current+1]
     }
     
     return(RTcost)
   }
   

  }
)



