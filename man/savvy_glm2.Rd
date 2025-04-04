% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/savvy_glm2.R
\name{savvy_glm2}
\alias{savvy_glm2}
\title{Generalized Linear Models with Slab and Shrinkage Estimators}
\usage{
savvy_glm2(formula, family = gaussian, data, weights,
               model_class = c("St", "DSh", "SR", "GSR"), subset,
               na.action, start = NULL, etastart, mustart, offset,
               control = list(...), model = TRUE,
               method = "savvy_glm.fit2", x = FALSE, y = TRUE,
               contrasts = NULL, ...)
}
\arguments{
\item{formula}{An object of class "formula": a symbolic description of the model to be fitted. As for \code{\link{glm}}.}

\item{family}{A description of the error distribution and link function to be used in the model. As for \code{\link{glm}}.}

\item{data}{An optional data frame, list or environment containing the variables in the model. As for \code{\link{glm}}.}

\item{weights}{An optional vector of weights to be used in the fitting process. As for \code{\link{glm}}.}

\item{model_class}{A character vector specifying the shrinkage model(s) to be used in the underlying fitter \code{savvy_glm.fit2}.
Allowed values are \code{"St"}, \code{"DSh"}, \code{"SR"}, \code{"GSR"}, and \code{"Sh"}.
If a single value is provided, only that method is run.
If multiple values are provided (or if the default is used), the function evaluates the specified methods in parallel and returns the one with the lowest AIC.
When the user does not explicitly supply a value, the default is \code{c("St", "DSh", "SR", "GSR")}, and the additional method \code{"Sh"} is not considered.}

\item{subset}{An optional vector specifying a subset of observations to be used in the fitting process. As for \code{\link{glm}}.}

\item{na.action}{A function which indicates what should happen when the data contain NAs. As for \code{\link{glm}}.}

\item{start}{Starting values for the parameters in the linear predictor. As for \code{\link{glm}}.}

\item{etastart}{Starting values for the linear predictor. As for \code{\link{glm}}.}

\item{mustart}{Starting values for the vector of means. As for \code{\link{glm}}.}

\item{offset}{An optional vector specifying a priori known component to be included in the linear predictor during fitting. As for \code{\link{glm}}.}

\item{control}{A list of control parameters to pass to the iterative fitting process. As for \code{\link{glm}}.}

\item{model}{A logical value indicating whether the model frame should be included as a component of the returned value. As for \code{\link{glm}}.}

\item{method}{The method to be used in fitting the model. The default is \code{savvy_glm.fit2}. This method uses iteratively reweighted least squares (IRLS)
with custom optimization methods to ensure better convergence by evaluating different fitting methods and selecting the best one based on AIC.
As in \code{\link{glm}}, the alternative method "model.frame" returns the model frame and does no fitting.}

\item{x}{A logical value indicating whether the model matrix used in the fitting process should be returned as a component of the returned value. As for \code{\link{glm}}.}

\item{y}{A logical value indicating whether the response vector used in the fitting process should be returned as a component of the returned value. As for \code{\link{glm}}.}

\item{contrasts}{An optional list. See the contrasts.arg of \code{model.matrix.default}. As for \code{\link{glm}}.}

\item{...}{Additional arguments to be passed to the low level regression fitting functions. As for \code{\link{glm}}.

\code{savvy_glm2} extends the \code{glm2} function by using custom optimization methods to improve the convergence properties of the iteratively
reweighted least squares (IRLS) algorithm. The function evaluates four custom optimization methods: \code{St_ost}, \code{DSh_ost}, \code{SR_ost}, and \code{GSR_ost}.
The user can also include the additional method \code{Sh_ost} by explicitly specifying \code{"Sh"} in the \code{model_class} argument.
The fitting process starts with initial parameter values and iterates through the IRLS algorithm.
In each iteration, the coefficients are computed using the specified custom methods.
The final model is chosen as the one with the lowest AIC, ensuring that the model converges to the best possible solution given the data and specified family.}
}
\value{
The value returned by \code{savvy_glm2} has exactly the same structure as that returned by \code{glm}, except for:
\item{method}{the name of the fitter function used, which by default is \code{savvy_glm.fit2}.}
\item{chosen_fit}{the name of the chosen fitting method based on AIC.}
}
\description{
\code{savvy_glm2} is a modified version of \code{glm2} in the stats package, incorporating custom optimization methods.
This function aims to improve convergence properties by selecting the best fitting method based on the Akaike Information Criterion (AIC).
In addition, the user can choose to run a specific shrinkage method by providing a value to the \code{model_class} argument.
When a single value is provided, only that method is executed.
When multiple values are given (or when the default is used), the function evaluates the specified methods in parallel and returns the one with the lowest AIC.
}
\references{
The custom optimization methods used in this function are designed to improve the convergence properties of the GLM fitting process.
Marschner, I.C. (2011) glm2: Fitting generalized linear models with convergence problems. The R Journal, Vol. 3/2, pp.12-15.
\code{savvy_glm2} uses code from \code{glm2}, whose authors are listed in the help documentation for the \strong{stats} package.
}
\seealso{
\code{\link{glm}}, \code{\link{glm2}}, \code{\link{savvy_glm.fit2}}
}
\author{
Ziwei Chen and Vali Asimit\cr
Maintainer: Ziwei Chen <ziwei.chen.3@citystgeorges.ac.uk>
}
