FROM rocker/tidyverse

# install R packages
# put as close to top of script as possible to make best 
# use of caching and speed up builds
RUN Rscript -e "install.packages('ggplot2')"

# make a project directory in the container
# we will mount our local project directory to this directory
RUN mkdir /project

# copy contents of local folder to project folder in container
COPY ./ /project/

# make R scripts executable
RUN chmod +x /project/R/*.R

# set an environment variable
ENV fig1="fig1"
ENV fig2="fig2"


# make container entry point bash
CMD /bin/bash