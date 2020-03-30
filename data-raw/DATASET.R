indice_marini <- estruturar_indice()

# 1. Criar DF com texto nome do texto, data do texto, e texto
textos_marini <- indice_marini %>%
  dplyr::filter(formato == "html") %>%
  dplyr::pull(link) %>%
  purrr::map_df(estruturar_texto)

usethis::use_data(indice_marini, textos_marini, )
