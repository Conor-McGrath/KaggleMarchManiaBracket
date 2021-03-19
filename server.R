library(shiny)

shinyServer(function(input, output){
    
    ordered_table <- reactive({
        req(input$csv)
        inFile <- input$csv
        df <- read.csv(inFile$datapath, header = input$header)
        data <- write.table(x = df, file = "data.csv", sep = ",", row.names = F)
        suppressWarnings(suppressMessages(devtools::install_github("dhutexas/collegehoops", dep = FALSE)))
        library(collegehoops)
        options(repr.plot.width = 14, repr.plot.height = 8)
        bracket = collegehoops::parse_bracket("data.csv", year = '2021')
        outcomes <- full_join(colleges, bracket, by=c("TeamID" = "winner"))
        library(plyr)
        outcomes <- rbind.fill(outcomes, colleges)
        outcomes <- outcomes %>%
            distinct()
        return(outcomes)
        })
    
    output$PI161 <- renderText(ordered_table()$Team[ordered_table()$Seed == "W11a"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$PI162 <- renderText(ordered_table()$Team[ordered_table()$Seed == "W11b"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)]) 
    output$PI163 <- renderText(ordered_table()$Team[ordered_table()$Seed == "W16a"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$PI164 <- renderText(ordered_table()$Team[ordered_table()$Seed == "W16b"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$PI111 <- renderText(ordered_table()$Team[ordered_table()$Seed == "X11a"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$PI112 <- renderText(ordered_table()$Team[ordered_table()$Seed == "X11b"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)]) 
    output$PI113 <- renderText(ordered_table()$Team[ordered_table()$Seed == "X16a"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)]) 
    output$PI114 <- renderText(ordered_table()$Team[ordered_table()$Seed == "X16b"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    
    output$E1 <- renderText(ordered_table()$Team[ordered_table()$Seed == "W01"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)]) 
    output$E2 <- renderText(ordered_table()$Team[ordered_table()$Seed == "W02"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$E3 <- renderText(ordered_table()$Team[ordered_table()$Seed == "W03"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$E4 <- renderText(ordered_table()$Team[ordered_table()$Seed == "W04"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$E5 <- renderText(ordered_table()$Team[ordered_table()$Seed == "W05"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$E6 <- renderText(ordered_table()$Team[ordered_table()$Seed == "W06"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$E7 <- renderText(ordered_table()$Team[ordered_table()$Seed == "W07"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$E8 <- renderText(ordered_table()$Team[ordered_table()$Seed == "W08"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$E9 <- renderText(ordered_table()$Team[ordered_table()$Seed == "W09"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$E10 <- renderText(ordered_table()$Team[ordered_table()$Seed == "W10"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$E11 <- renderText(ordered_table()$Team[ordered_table()$Seed == "W11"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$E12 <- renderText(ordered_table()$Team[ordered_table()$Seed == "W12"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$E13 <- renderText(ordered_table()$Team[ordered_table()$Seed == "W13"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$E14 <- renderText(ordered_table()$Team[ordered_table()$Seed == "W14"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$E15 <- renderText(ordered_table()$Team[ordered_table()$Seed == "W15"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$E16 <- renderText(ordered_table()$Team[ordered_table()$Seed == "W16"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    
    output$W1 <- renderText(ordered_table()$Team[ordered_table()$Seed == "X01"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)]) 
    output$W2 <- renderText(ordered_table()$Team[ordered_table()$Seed == "X02"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$W3 <- renderText(ordered_table()$Team[ordered_table()$Seed == "X03"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$W4 <- renderText(ordered_table()$Team[ordered_table()$Seed == "X04"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$W5 <- renderText(ordered_table()$Team[ordered_table()$Seed == "X05"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$W6 <- renderText(ordered_table()$Team[ordered_table()$Seed == "X06"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$W7 <- renderText(ordered_table()$Team[ordered_table()$Seed == "X07"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$W8 <- renderText(ordered_table()$Team[ordered_table()$Seed == "X08"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$W9 <- renderText(ordered_table()$Team[ordered_table()$Seed == "X09"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$W10 <- renderText(ordered_table()$Team[ordered_table()$Seed == "X10"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$W11 <- renderText(ordered_table()$Team[ordered_table()$Seed == "X11"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$W12 <- renderText(ordered_table()$Team[ordered_table()$Seed == "X12"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$W13 <- renderText(ordered_table()$Team[ordered_table()$Seed == "X13"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$W14 <- renderText(ordered_table()$Team[ordered_table()$Seed == "X14"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$W15 <- renderText(ordered_table()$Team[ordered_table()$Seed == "X15"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$W16 <- renderText(ordered_table()$Team[ordered_table()$Seed == "X16"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    
    output$MW1 <- renderText(ordered_table()$Team[ordered_table()$Seed == "Y01"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)]) 
    output$MW2 <- renderText(ordered_table()$Team[ordered_table()$Seed == "Y02"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$MW3 <- renderText(ordered_table()$Team[ordered_table()$Seed == "Y03"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$MW4 <- renderText(ordered_table()$Team[ordered_table()$Seed == "Y04"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$MW5 <- renderText(ordered_table()$Team[ordered_table()$Seed == "Y05"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$MW6 <- renderText(ordered_table()$Team[ordered_table()$Seed == "Y06"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$MW7 <- renderText(ordered_table()$Team[ordered_table()$Seed == "Y07"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$MW8 <- renderText(ordered_table()$Team[ordered_table()$Seed == "Y08"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$MW9 <- renderText(ordered_table()$Team[ordered_table()$Seed == "Y09"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$MW10 <- renderText(ordered_table()$Team[ordered_table()$Seed == "Y10"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$MW11 <- renderText(ordered_table()$Team[ordered_table()$Seed == "Y11"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$MW12 <- renderText(ordered_table()$Team[ordered_table()$Seed == "Y12"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$MW13 <- renderText(ordered_table()$Team[ordered_table()$Seed == "Y13"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$MW14 <- renderText(ordered_table()$Team[ordered_table()$Seed == "Y14"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$MW15 <- renderText(ordered_table()$Team[ordered_table()$Seed == "Y15"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$MW16 <- renderText(ordered_table()$Team[ordered_table()$Seed == "Y16"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    
    output$S1 <- renderText(ordered_table()$Team[ordered_table()$Seed == "Z01"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)]) 
    output$S2 <- renderText(ordered_table()$Team[ordered_table()$Seed == "Z02"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$S3 <- renderText(ordered_table()$Team[ordered_table()$Seed == "Z03"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$S4 <- renderText(ordered_table()$Team[ordered_table()$Seed == "Z04"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$S5 <- renderText(ordered_table()$Team[ordered_table()$Seed == "Z05"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$S6 <- renderText(ordered_table()$Team[ordered_table()$Seed == "Z06"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$S7 <- renderText(ordered_table()$Team[ordered_table()$Seed == "Z07"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$S8 <- renderText(ordered_table()$Team[ordered_table()$Seed == "Z08"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$S9 <- renderText(ordered_table()$Team[ordered_table()$Seed == "Z09"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$S10 <- renderText(ordered_table()$Team[ordered_table()$Seed == "Z10"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$S11 <- renderText(ordered_table()$Team[ordered_table()$Seed == "Z11"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$S12 <- renderText(ordered_table()$Team[ordered_table()$Seed == "Z12"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$S13 <- renderText(ordered_table()$Team[ordered_table()$Seed == "Z13"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$S14 <- renderText(ordered_table()$Team[ordered_table()$Seed == "Z14"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$S15 <- renderText(ordered_table()$Team[ordered_table()$Seed == "Z15"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    output$S16 <- renderText(ordered_table()$Team[ordered_table()$Seed == "Z16"&is.na(ordered_table()$slot)&is.na(ordered_table()$slot)])
    
    output$PI161img <- renderUI({
        tags$img(src=ordered_table()$images[ordered_table()$Seed == "W11a"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$PI162img <- renderUI({
        tags$img(src=ordered_table()$images[ordered_table()$Seed == "W11b"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$PI163img <- renderUI({
        tags$img(src=ordered_table()$images[ordered_table()$Seed == "W16a"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$PI164img <- renderUI({
        tags$img(src=ordered_table()$images[ordered_table()$Seed == "W16b"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$PI111img <- renderUI({
        tags$img(src=ordered_table()$images[ordered_table()$Seed == "X11a"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$PI112img <- renderUI({
        tags$img(src=ordered_table()$images[ordered_table()$Seed == "X11b"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$PI113img <- renderUI({
        tags$img(src=ordered_table()$images[ordered_table()$Seed == "X16a"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$PI114img <- renderUI({
        tags$img(src=ordered_table()$images[ordered_table()$Seed == "X16b"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$E1img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "W01"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$E2img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "W02"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$E3img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "W03"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$E4img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "W04"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$E5img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "W05"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$E6img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "W06"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$E7img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "W07"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$E8img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "W08"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$E9img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "W09"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$E10img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "W10"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$E11img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "W11"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$E12img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "W12"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$E13img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "W13"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$E14img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "W14"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$E15img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "W15"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$E16img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "W16"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    
    output$S1img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "Z01"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$S2img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "Z02"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$S3img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "Z03"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$S4img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "Z04"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$S5img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "Z05"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$S6img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "Z06"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$S7img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "Z07"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$S8img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "Z08"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$S9img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "Z09"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$S10img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "Z10"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$S11img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "Z11"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$S12img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "Z12"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$S13img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "Z13"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$S14img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "Z14"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$S15img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "Z15"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$S16img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "Z16"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    
    output$MW1img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "Y01"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$MW2img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "Y02"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$MW3img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "Y03"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$MW4img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "Y04"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$MW5img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "Y05"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$MW6img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "Y06"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$MW7img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "Y07"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$MW8img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "Y08"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$MW9img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "Y09"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$MW10img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "Y10"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$MW11img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "Y11"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$MW12img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "Y12"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$MW13img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "Y13"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$MW14img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "Y14"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$MW15img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "Y15"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$MW16img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "Y16"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    
    output$W1img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "X01"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$W2img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "X02"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$W3img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "X03"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$W4img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "X04"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$W5img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "X05"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$W6img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "X06"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$W7img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "X07"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$W8img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "X08"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$W9img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "X09"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$W10img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "X10"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$W11img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "X11"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$W12img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "X12"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$W13img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "X13"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$W14img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "X14"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$W15img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "X15"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    output$W16img <- renderUI({
        tags$img(src = ordered_table()$images[ordered_table()$Seed == "X16"&is.na(ordered_table()$slot)],
                 onerror="this.onerror=null; this.src='Default.jpg'",
                 alt="")
    })
    


# Final Four Slots
output$R6CH <- renderText(ordered_table()$Team[ordered_table()$slot == "R6CH" & !is.na(ordered_table()$slot)]) 
output$R5YZ <- renderText(ordered_table()$Team[ordered_table()$slot == "R5YZ" & !is.na(ordered_table()$slot)]) 
output$R5WX <- renderText(ordered_table()$Team[ordered_table()$slot == "R5WX"& !is.na(ordered_table()$slot)])
output$R4Z1 <- renderText(ordered_table()$Team[ordered_table()$slot == "R4Z1"& !is.na(ordered_table()$slot)])
output$R4Y1 <- renderText(ordered_table()$Team[ordered_table()$slot == "R4Y1"& !is.na(ordered_table()$slot)])
output$R4X1 <- renderText(ordered_table()$Team[ordered_table()$slot == "R4X1"& !is.na(ordered_table()$slot)])
output$R4W1 <- renderText(ordered_table()$Team[ordered_table()$slot == "R4W1"& !is.na(ordered_table()$slot)])


output$R5YZimg <- renderUI({
    tags$img(src = ordered_table()$images[ordered_table()$slot == "R5YZ"& !is.na(ordered_table()$slot)],
             onerror="this.onerror=null; this.src='Default.jpg'",
             alt="")
})
output$R5WXimg <- renderUI({
    tags$img(src = ordered_table()$images[ordered_table()$slot == "R5WX"& !is.na(ordered_table()$slot)],
             onerror="this.onerror=null; this.src='Default.jpg'",
             alt="")
})
output$R4Z1img <- renderUI({
    tags$img(src = ordered_table()$images[ordered_table()$slot == "R4Z1"& !is.na(ordered_table()$slot)],
             onerror="this.onerror=null; this.src='Default.jpg'",
             alt="")
})
output$R4Y1img <- renderUI({
    tags$img(src = ordered_table()$images[ordered_table()$slot == "R4Y1"& !is.na(ordered_table()$slot)],
             onerror="this.onerror=null; this.src='Default.jpg'",
             alt="")
})
output$R4X1img <- renderUI({
    tags$img(src = ordered_table()$images[ordered_table()$slot == "R4X1"& !is.na(ordered_table()$slot)],
             onerror="this.onerror=null; this.src='Default.jpg'",
             alt="")
})
output$R4W1img <- renderUI({
    tags$img(src = ordered_table()$images[ordered_table()$slot == "R4W1"& !is.na(ordered_table()$slot)],
             onerror="this.onerror=null; this.src='Default.jpg'",
             alt="")
})

output$R6CHimg <- renderUI({
    tags$img(src = ordered_table()$images[ordered_table()$slot == "R6CH"& !is.na(ordered_table()$slot)],
             onerror="this.onerror=null; this.src='Default.jpg'",
             alt="")
})


})
