# Data

Save raw data files here.

## Gene expression data

Use [gget archs4](https://pachterlab.github.io/gget/archs4.html) to get gene
expression data from ARCHS4.

```console
for g in SLC5A1 CYP2C18 ADH1C SLC13A2 \
  TSPAN8 GSTA1 MOGAT2 SLC44A3 \
  S100A14 HMGCS2 FUT3 TSPAN1 \
  SOWAHB CBLC RNF186; do
  gget archs4 -w tissue ${g} --csv > archs4/${g}.csv
done
```
