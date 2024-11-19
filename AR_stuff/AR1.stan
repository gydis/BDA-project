data {
  int<lower=0> N;
  vector[N] y;
}
parameters {
  real alpha;
  real beta;
  real<lower=0> sigma;
}
model {
  y[2:N] ~ normal(alpha + beta * y[1:(N - 1)], sigma);
}
generated quantities {
  array[N-1] real y_tilde = normal_rng(alpha + beta * y[1:(N - 1)], sigma);
}