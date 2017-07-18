

.PHONY: all
all: data/births.rda \
     data/deaths.rda \
     data/external.mig.rda \
     data/internal.mig.rda \
     data/population.rda


data/births.rda : data-raw/births/births.R \
                  data-raw/births/rc13_bths9716_rr3.csv
	Rscript $<

data/deaths.rda : data-raw/deaths/deaths.R \
                  data-raw/deaths/rc13_dths9716_rr3.csv
	Rscript $<

data/external.mig.rda : data-raw/external.mig/external.mig.R \
                        data-raw/external.mig/rc13_pltmig_9716.zip
	Rscript $<

data/internal.mig.rda : data-raw/internal.mig/internal.mig.R \
                        data-raw/internal.mig/migr_transitions_rc13_9613_rr3.csv
	Rscript $<

data/population.rda : data-raw/population/population.R \
                      data-raw/population/rc13_pop9616_rnd.csv
	Rscript $<


.PHONY: clean
clean:
	rm -rf data
	mkdir -p data
