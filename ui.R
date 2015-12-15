library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Calculate Your Retirement Age"),

  sidebarPanel(
    h3("Please update the following inputs"),
    sliderInput('current', 'Your Current Age', min = 0, max = 100, value=25),
    sliderInput('expected', 'Your Expected Life',min=0,max=100,value= 80),
    sliderInput('inflation','Expected Inflation Rate',0.02,min=0,max=0.1),
    numericInput('currentyrsa','Your Current Annual Salary ($)',value=60000,min=0),# wip
    sliderInput('salaryincrease','Expected Salary Increase Rate',value=0.03,min=0,max=0.1),
    sliderInput('savingra','Saving Ratio (before tax)',0.2,min=0,max=1),
    sliderInput('ROA','Expected Return on Assets',value=0.04,min=0,max=0.1),
    numericInput('currentwealth','Current Net Wealth ($)',10000,min=0),#wip
    sliderInput('taxrate','Your Estimated Tax Rate',0.2,min=0,max=1),

    submitButton('Calculate')
  ),
  mainPanel(
   tabsetPanel(type = "tabs",
      tabPanel("Output", 
      h3('You can retire at age'),
      textOutput("answer"),
      h3('Your accumulated assets at retirement age is'),
      verbatimTextOutput("RTasset"),
      h3('Your total future living cost at retirement age is'),
      verbatimTextOutput("RTcost"),
      h3('Your current monthly living cost is'),
      verbatimTextOutput("mocost"),
      h4('If you want to change the monthly living cost, please change your saving ratio or tax rate inputs'),
      br(),
      br()),
      
#       h2('HELP'),
#       h4('This application is to calcualte the age you can retire and the values of accumulated asset and total future cost then.'),
#       h4('Please update all the inputs on the left panel and then click Calculate button. If you are not sure about the expected inflation rate or other assumptions, the default values are good starting points.'),
#       h4('The accumulated asset value increases and the total future cost decreases by time as the chart below. When the acculumated asset value is bigger than the future living cost, you can retire.'),
#       plotOutput('chart')
      tabPanel("Documentation",includeMarkdown("instruction.html"))

  )

))
)

