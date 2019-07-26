

bc <- read.csv("C://users/eduardo.martins/Downloads/breast-cancer.csv", header = F)

header <- c(
  "id",
  "diagnosis",
  "radius_mean",
  "texture_mean",
  "perimeter_mean",
  "area_mean",
  "smoothness_mean",
  "compactness_mean",
  "concavity_mean",
  "concave_points_mean",
  "symmetry_mean",
  "fractal_dimension_mean",
  "radius_se",
  "texture_se",
  "perimeter_se",
  "area_se",
  "smoothness_se",
  "compactness_se",
  "concavity_se",
  "concave_points_se",
  "symmetry_se",
  "fractal_dimension_se",
  "radius_worst",
  "texture_worst",
  "perimeter_worst",
  "area_worst",
  "smoothness_worst",
  "compactness_worst",
  "concavity_worst",
  "concave points_worst",
  "symmetry_worst",
  "fractal_dimension_worst"
)


names(bc) <- header

summary(bc)

mean.vars <- c(
  "radius_mean",
  "texture_mean",
  "perimeter_mean",
  "area_mean",
  "smoothness_mean",
  "compactness_mean",
  "concavity_mean",
  "concave_points_mean",
  "symmetry_mean",
  "fractal_dimension_mean"
)


matrix.cov = matrix(nrow=10, ncol=10)
dimnames(matrix.cov) <- list(mean.vars,mean.vars)

for(row in mean.vars){
  for(col in mean.vars){
    #print(row, col)
    matrix.cov[row, col] <- cov(bc[row], bc[col])
  }
}

mtr.cov = data.frame(matrix.cov)
mtr.cov[,11] = mean.vars



matrix.cov.scale = matrix(nrow=10, ncol=10)
dimnames(matrix.cov.scale) <- list(mean.vars,mean.vars)

bc.mean <- lapply(bc[mean.vars], scale)

for(row in mean.vars){
  for(col in mean.vars){
    #print(row, col)
    matrix.cov.scale[row, col] <- cov(bc[row], bc[col])
  }
}

mtx.cov.scale = data.frame(matrix.cov.scale)
mtx.cov.scale[,11] = mean.vars

