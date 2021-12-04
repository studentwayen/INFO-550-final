HELLO from LEI
-------------------------
This program runs under `R` version 4.0.5 (2021-03-31).

This program can run with `RStudio Version 1.4.1106.`

And terminal in macOS Big Sur version 11.4 as well.

-----------------------------------
For my project, I will analyze two data from World Bank open sources. 

Reading two data, one is the amount of the country Electricity production from renewable sources named "namount.csv". And the other one is the proportion (% in total) of country Electricity production from renewable sources named "rapi.csv".

Clone the project to your local repository (Or you can just download it directly):
```
git clone https://github.com/studentwayen/INFO-550-final.git
```
-----------------------------------
How to download the docker image?

Using the following code in your terminal to download the docker image from my DockerHub.
```
docker pull studentwayen/my_proj
```
How to build and retrieve the report?

After downloading, you should have a file name INFO-550-final-main. If the file name is different from this, it does not matter. You can just go to the directory of that file (whatever the name is).

Using the following code in your terminal to run my image.
```
## go to the directory of that file
## (may not this file name, but it does not matter)
cd (your path)/INFO-550-final-main

## create a local file for mounting the output
## ~ is your root directory
## you can use pwd to check your directory.
mkdir ~/docker_output

## run following code to get into image
docker run -v ~/docker_output:/project/output -it my_proj 

## go to project file in docker
cd project

## use make to generate a report
## you can see the report in the local docker_output file
make report.html

```

In makefile:
```
## making analysis and report## 
make report.html

## cleaning data
make data.csv

## making figures
make figs/fig1.png
make figs/fig2.png

## clean up
make clean
```

