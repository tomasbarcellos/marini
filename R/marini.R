#' @importFrom magrittr %>%
#' @export
#' @rdname pipe
magrittr::`%>%`

#' Gerar nuvem de palavras
#'
#' @param df Um \code{data.frame}
#'
#' @return Uma nuvem de palavras
#' @export
#'
#' @examples
#' busca_marini("Cuba") %>%
#'   nuvem()
nuvem <- function(df) {
  palavras <- df %>%
    tidytext::unnest_tokens(word, texto, token = "words") %>%
    dplyr::filter(!word %in% c(stopwords::stopwords("pt"), stopwords::stopwords("es")),
                  !stringr::str_detect(word, "\\d+")) %>%
    dplyr::count(word, sort = TRUE) %>%
    utils::head(500)

  wordcloud::wordcloud(palavras$word, palavras$n, scale = c(4, 0.1),
                       colors = RColorBrewer::brewer.pal(3, "Reds"),
                       random.color = FALSE, use.r.layout = TRUE)
}

#' Buscar nos textos do Marini
#'
#' @param termo Termo buscado no titulo
#'
#' @return Uma \link{[tibble]tibble}
#' @export
#'
#' @examples
#' busca_marini("Cuba")
busca_marini <- function(termo) {
  textos_marini %>%
    dplyr::filter(
      stringr::str_detect(
        stringr::str_to_lower(titulo), stringr::str_to_lower(termo)
      )
    )
}

