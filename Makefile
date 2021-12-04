## report.html : Generate final analysis report.
# rule for making analysis and report  
report.html: data.csv Rmd/WLreport.Rmd figs/fig1.png figs/fig2.png
	cd Rmd; Rscript -e "rmarkdown::render('WLreport.Rmd', output_file = '../output/report.html')"

## rule for cleaning data
data.csv: R/dataclean.R data/rapi.csv data/namount.csv
	chmod +x R/dataclean.R && \
	Rscript R/dataclean.R

## rule for making figures
figs/%.png: R/make_%.R data.csv
	Rscript R/make_$*.R

# PHONY rule for all figures
# fig1.png: Generate the scatter plot of amount (kWh).
# fig2.png: Generate the scatter plot of proportion.
.PHNOY: figs
figs: fig1.png fig2.png

## clean up directory
clean:
	rm output/report.html data/data.csv figs/fig1.png figs/fig2.png