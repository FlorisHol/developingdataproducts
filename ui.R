#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.


pageWithSidebar(
  headerPanel('Cars K-means clustering'),
  sidebarPanel(
    selectInput('xcol', 'X Variable', names(cars)),
    selectInput('ycol', 'Y Variable', names(cars),
                selected=names(cars)[[2]]),
    numericInput('clusters', 'Cluster count', 3,
                 min = 1, max = 5)
  ),
  mainPanel(
    plotOutput('carsplot')
  )
)
