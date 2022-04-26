# README

This repository contains code for re-creating some of my posts from [my blog](https://davetang.org/muse/); the updated posts available here have improved content and code. The original posts from my blog were created using WordPress, where I had to copy and paste the code output manually. In this repo, each post is written as a R Markdown file (stored in the `analysis` directory) and [workflowr](https://github.com/workflowr/workflowr) is used to generate the output and [website](https://davetang.github.io/muse/).

Use `run_rstudio.sh` to run [RStudio Server inside a Docker container](https://davetang.org/muse/2021/04/24/running-rstudio-server-with-docker/) and use it to create new posts or modify existing posts. A R package directory will be created in the root directory of this repo to store installed packages so packages do not need to be re-installed each time.

After running `run_rstudio.sh`, use your favourite browser and log into an RStudio session by visiting <http://localhost:7777/> (port 7777 is set in `run_rstudio.sh` so please change it if there is a conflict). Navigate to this directory using the `Files` pane in your RStudio session and click on `muse.Rproj` to load the R project.

Now edit an existing R Markdown file or create a new one by copying another R Markdown file by using the Terminal within RStudio Server; click on `Tools`, then highlight `Terminal`, and then click on `New Terminal`. Once a new terminal is open, navigate to the analysis directory and use `cp` to make a copy of another R Markdown file. Alternatively, you can use the `wflow_open` function to create a new minimal R Markdown file.

The `.Rprofile` file contains my Git settings, so please change this if you are not me.

