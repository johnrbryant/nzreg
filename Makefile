

.PHONY: all
all: data/internal.mig.rda

data/internal.mig.rda : data-raw/internal.mig/internal.mig.R \
                        data-raw/internal.mig/migr_transitions_rc13_9613_rr3.csv
	Rscript $<


.PHONY: clean
clean:
	rm -rf data
	mkdir -p data
