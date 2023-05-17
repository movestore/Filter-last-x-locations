library('move')
library('foreach')

## The parameter "data" is reserved for the data object passed on from the previous app

## to display messages to the user in the log file of the App in MoveApps one can use the function from the logger.R file: 
# logger.fatal(), logger.error(), logger.warn(), logger.info(), logger.debug(), logger.trace()

rFunction = function(data, nlocs=1) {

  if (nlocs < 1)
  {
    logger.info("You have selected an inappropriate number of last locations. Go back and select at least 1. Returning NULL.")
    result <- NULL
  } else
  {
    data.split <- move::split(data)
    
    res_list <- foreach(datai = data.split) %do% {
      leni <- length(datai)
      
      if (leni<nlocs)
      {
        logger.info(paste("For the track", namesIndiv(datai),"only",leni,"locations are availabe, which is less than your selected number (",nlocs,"). We will provide all locations of this track to your resulting data set." ))
        datai[1:leni]
      } else
      {
        logger.info(paste("For the track",namesIndiv(datai),"the last", nlocs,"locations from the available",leni,"locations will be selected."))
        datai[(leni-nlocs+1):leni]
      }
    }
    names(res_list) <- names(data.split)
    
    result <- moveStack(res_list,forceTz="UTC") 
  }
  
  return(result)
}
