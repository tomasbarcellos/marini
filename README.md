
<!-- README.md is generated from README.Rmd. Please edit that file -->

# marini

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

## Installation

``` r
remotes::install_github("tomasbarcellos/marini)
```

## Example

Para conhecer os textos com o termo “subimperislimo” no título podemos
usar:

``` r
library(marini)
library(dplyr)
#> Warning: package 'dplyr' was built under R version 3.5.2
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
"subimperialismo" %>% 
  busca_marini() %>% 
  nuvem()
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> puede could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> economía could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> países could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> dependientes could not be fit on page. It will not be plotted.
```

<img src="man/figures/README-subimperialismo-1.png" width="100%" />

Por exemplo as fontes mais comuns são:

``` r
library(stringr)
#> Warning: package 'stringr' was built under R version 3.5.2
textos_marini %>% 
  mutate(fonte = str_remove(fonte, "[,\\.].+")) %>% 
  count(fonte, sort = TRUE)
#> # A tibble: 54 x 2
#>    fonte                                    n
#>    <chr>                                <int>
#>  1 Archivo de Ruy Mauro Marini            136
#>  2 El reformismo y la contrarrevolución    28
#>  3 El Sol de México                        26
#>  4 Correo de la Resistencia                20
#>  5 Excélsior                               16
#>  6 Ruy Mauro Marini                        12
#>  7 Punto Final Internacional                7
#>  8 Cuadernos Políticos n                    6
#>  9 El Universal                             4
#> 10 Subdesarrollo y Revolución               4
#> # … with 44 more rows
```

Se quisermos conhecer o conteúdo dos artigos do Sol do México:

``` r
textos_marini %>% 
  mutate(fonte = str_remove(fonte, "[,\\.].+")) %>% 
  filter(fonte == "El Sol de México") %>% 
  nuvem()
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> militares could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> internacional could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> carter could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> represión could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> chile could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> problema could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> congreso could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> fuerzas could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> latinoamericano could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> recientemente could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> países could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> movimiento could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> política could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> campo could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> puede could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> norteamericanas could not be fit on page. It will not be plotted.
```

<img src="man/figures/README-sol de mexico-1.png" width="100%" />

O exemplo abaixo apresenta os textos que contém o termo rascismo e uma
núvem de palavras de seus conteúdos.

``` r
racismo <- textos_marini %>% 
  filter(str_detect(texto, "racismo")) 

racismo
#> # A tibble: 5 x 5
#>      id titulo           fonte                    ano texto                
#>   <int> <chr>            <chr>                  <dbl> <chr>                
#> 1   109 El camino legal… El reformismo y la co…  1976 "Una de las dificult…
#> 2    71 Brasil: da dita… "Archivo de Ruy Mauro…  1990 "No curso da década …
#> 3    86 Las raíces del … Archivo de Ruy Mauro …  1994 "El pensamiento soci…
#> 4   109 El camino legal… El reformismo y la co…  1976 "Una de las dificult…
#> 5   131 La influencia d… Excélsior, México, 11…  1976 La importancia de Áf…
nuvem(racismo)
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> américa could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> país could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> governo could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> legal could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> brasileiro could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> considerar could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> brasileña could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> forças could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> presidente could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> influencia could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> democrático could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> nuevos could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> ello could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> división could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> principales could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> precisamente could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> regime could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> teórica could not be fit on page. It will not be plotted.
#> Warning in wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, :
#> cualquier could not be fit on page. It will not be plotted.
```

<img src="man/figures/README-rascismo-1.png" width="100%" />
