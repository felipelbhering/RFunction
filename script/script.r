library(httr)
library(jsonlite)
library(rjson)
library(rsvg)
library(twitteR)
library(ggplot2)

p <- plot(iris)

credentials_file = "credentials.json"
credentials <- jsonlite::fromJSON(credentials_file)
ckey <- credentials$twitter$consumer_key
csecret <- credentials$twitter$consumer_secret
atoken <- credentials$twitter$access_token
asecret <- credentials$twitter$access_secret

setup_twitter_oauth(ckey, csecret, atoken, asecret)
if (Sys.getenv('WEBSITE_COMPUTE_MODE') == 'Dynamic') {
  # The graphics libraries on the consumption mode are not available
  # so you cannot generate a graph
  tweet(paste("Simplify"))  
} else {
  tweet(paste("Simplify"), mediaPath = plot_file_png)
}

#  ------------------------------------------------------------------------