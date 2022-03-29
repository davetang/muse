# README

This repository contains code for re-creating some of my posts from [my blog](https://davetang.org/muse/). The original posts from my blog were created using WordPress, where I had to copy and paste the code output manually. In this repo, each post is written as a R Markdown file (stored in the `analysis` directory) and [workflowr](https://github.com/workflowr/workflowr) is used to generate the output and [website](https://davetang.github.io/muse/).

Use `run_rstudio.sh` to run RStudio Server inside a Docker container and use it to create new posts or modify existing posts. A R package directory will be created in this current directory to store installed packages.

Use your favourite browser and log into an RStudio session by visiting <http://localhost:7777/>; port 7777 was set in `run_rstudio.sh`. Navigate to this directory using the `Files` pane in your RStudio session and click on `muse.Rproj` to the R project.

Now edit an existing R Markdown file or create a new one.

