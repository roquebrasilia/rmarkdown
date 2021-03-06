\name{render}
\alias{render}
\title{Render R Markdown}
\usage{
render(input, output_format = NULL, output_file = NULL, output_dir = NULL,
       output_options = NULL, runtime = c("auto", "static", "shiny"),
       clean = TRUE, envir = parent.frame(), quiet = FALSE,
       encoding = getOption("encoding"))
}
\arguments{
  \item{input}{Input file (R script, Rmd, or plain markdown).}

  \item{output_format}{R Markdown output format to convert to. Pass
  \code{"all"} to render all formats defined within the file. Pass
  the name of a format (e.g. \code{"html_document"}) to render a single
  format or pass a vector of format names to render multiple formats.
  Alternatively you can pass an output format object;
  e.g. \code{html_document()}. If \code{NULL} is passed then the
  output format is the first one defined in the YAML metadata of the
  input file (defaulting to HTML if none is specified).}

  \item{output_options}{List of output options that can override the options
  specified in metadata (e.g. could be used to force \code{self_contained} or
  \code{mathjax = "local"}). Note that this is only valid when the output
  format is read from metadata (i.e. not a custom format object passed to
  \code{output_format}).}

  \item{output_file}{Output file. If \code{NULL} then a default based on
  the name of the input file is chosen.}

  \item{output_dir}{Output directory. An alternate directory to write
  the output file to (defaults to the directory of the input file).}

  \item{runtime}{The runtime target for rendering. \code{static} produces output
  intended for static files; \code{shiny} produces output suitable for use in a
  Shiny document (see \code{\link{run}}). The default, \code{auto},
  allows the \code{runtime} target specified in the YAML metadata to take
  precedence, and renders for a \code{static} runtime target otherwise.}

  \item{clean}{\code{TRUE} to clean intermediate files created
  during rendering.}

  \item{envir}{The environment in which the code chunks are
  to be evaluated during knitting (can use
  \code{\link{new.env}()} to guarantee an empty new
  environment).}

  \item{quiet}{\code{TRUE} to supress printing of the
  pandoc command line.}

  \item{encoding}{The encoding of the input file; see
  \code{\link{file}}.}
}
\value{
The compiled document is written into the output file, and
the path of the output file is returned.
}
\description{
Render the input file to the specified output format using
pandoc. If the input requires knitting then
\code{\link[knitr:knit]{knit}} is called prior to pandoc.
}
\details{

For additional details on rendering R scripts see
\link[=compile_notebook]{Compiling R scripts to a notebook}.

If no \code{output_format} parmaeter is specified then the output
format is read from the YAML front-matter of the input
file. For example, the following YAML would yield a PDF
document:

\preformatted{
output: pdf_document
}

Additional format options can also be specified in metadata. For example:

\preformatted{
output:
  pdf_document:
    toc: true
    highlight: zenburn
}

Multiple formats can be specified in metadata. If no \code{output_format}
is passed to \code{render} then the first one defined will be used:

\preformatted{
output:
  pdf_document:
    toc: true
    highlight: zenburn
  html_document:
    toc: true
    theme: united
}

Formats specified in metadata can be any one of the built in formats
(e.g. \code{\link{html_document}},
\code{\link{pdf_document}}) or a format defined in another
package (e.g. \code{pkg::custom_format}).

If there is no format defined in the YAML then
\code{\link{html_document}} will be used.
}
\section{R Markdown}{
  R Markdown supports all of the base pandoc markdown
  features as well as some optional features for
  compatibility with GitHub Flavored Markdown (which
  previous versions of R Markdown were based on). See
  \code{\link{rmarkdown_format}} for details.

}
\seealso{
\link[knitr:knit]{knit}, \link{output_format},
\href{http://johnmacfarlane.net/pandoc}{pandoc}
}
\examples{
\dontrun{

library(rmarkdown)

# render the default (first) format defined in the file
render("input.Rmd")

# render all formats defined in the file
render("input.Rmd", "all")

# render a single format
render("input.Rmd", "html_document")

# render multiple formats
render("input.Rmd", c("html_document", "pdf_document"))
}
}

