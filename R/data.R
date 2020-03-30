#' Criar links completos
#' @param final link relativo
#' @examples
#' escritos("015_indice_general_marini.html")
escritos <- function(final) {
  paste0("http://www.marini-escritos.unam.mx/", final)
}

#' Extrair ID do texto usado no portal
#' @param link link do texto no portal
#' @examples
#' escritos("015_indice_general_marini.html") %>%
#'   pegar_id()
pegar_id <- function(link) {
  link %>%
    stringr::str_extract("(?<=pdf/)\\d{3}|\\d{3}") %>%
    as.integer()
}

#' Criar tibble com todos textos do portal
#' @examples
#' # Deve ser usada apenas internamente
estruturar_indice <- function() {
  pagina_indice <- escritos("015_indice_general_marini.html") %>%
    xml2::read_html()

  links <- pagina_indice %>%
    rvest::html_node("article") %>%
    rvest::html_nodes("a") %>%
    rvest::html_attr("href")

  tibble::tibble(
    link = links
  ) %>%
    dplyr::mutate(id = pegar_id(link),
                  formato = stringr::str_extract(link, "(?<=\\.)[a-z]{1,5}$"),
                  link = escritos(link)) %>%
    dplyr::select(id, formato, link) %>%
    dplyr::filter(id != 16) # próprio índice
}

#' Estruturar dados de texto do portal
#' @param link Link de um texto no
#' @export
#' @return Uma \code{\link[tibble]{tibble}} com dados do texto que
#'   se encontra no \code{link}.
estruturar_texto <- function(link) {
  id <- pegar_id(link)

  resp <- httr::RETRY("GET", link, times = 10)

  artigo <- resp %>%
    httr::content() %>%
    rvest::html_node("article")

  titulo <- artigo %>%
    rvest::html_node(".titulo") %>%
    rvest::html_text()

  fonte <- artigo %>%
    rvest::html_nodes(".fuente") %>%
    rvest::html_text() %>%
    paste(collapse = "") %>%
    stringr::str_remove("Fuente:") %>%
    stringr::str_squish()

  ano <- fonte %>%
    stringr::str_extract("19\\d{2}") %>%
    as.numeric()

  texto <- artigo %>%
    rvest::html_node("#texto") %>%
    rvest::html_text() %>%
    stringr::str_squish()

  tibble::tibble(
    id = id,
    titulo = titulo,
    fonte = fonte,
    ano = ano,
    texto = texto
  )
}

# # 2. Criar função para exrtarir citações e criar rede
#
# # memoria_pt <-
#
