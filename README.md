# Numerical Stability and Stiffness: An Analysis of Euler's Method in Linear Differential Equations

[Read the Paper Here](paper.pdf)
Analysis of numerical stability, stiffness, and convergence behavior of Euler's Method when applied to linear and nonlinear differential equations.

## Overview

This project investigates the strengths and limitations of Forward Euler integration across several differential equation families.

Topics explored include:

- Numerical stability
- Stiff differential equations
- Step-size restrictions
- Error propagation
- Logistic growth models
- Exponential growth and decay

## Exponential Growth and Decay

The first equation family considered is:

```text
x' = kx
```

whose analytical solution is:

```text
x(t) = x₀e^(kt)
```

The behavior depends strongly on the sign and magnitude of `k`.

### Stable Systems

For:

```text
k < 0
```

solutions decay toward:

```text
x = 0
```

### Unstable Systems

For:

```text
k > 0
```

solutions diverge exponentially.

## Logistic Growth

The second family examined is:

```text
dx/dt = kx(1 − x)
```

which introduces carrying-capacity effects and nonlinear dynamics.

Equilibrium points:

```text
x = 0
```

```text
x = 1
```

with stability depending on the sign of `k`.

## Euler Stability Analysis

Forward Euler gives:

```text
xₙ₊₁ = xₙ + h·f(tₙ, xₙ)
```

For the exponential system:

```text
xₙ₊₁ = (1 + hk)xₙ
```

The numerical solution remains stable only when:

```text
|1 + hk| < 1
```

for decaying systems.

## Key Findings

- Large negative values of `k` create stiff systems.
- Stability often requires extremely small step sizes.
- Numerical oscillations arise despite smooth analytical solutions.
- Divergence can occur purely from solver limitations.
- Logistic systems exhibit similar stability restrictions.

## Repository Structure

```text
.
├── README.md
├── paper.pdf
├── matlab/
│   ├── euler_solver.m
│   ├── exponential_growth.m
│   ├── logistic_growth.m
│   ├── stiffness_analysis.m
│   └── plotting.m
├── figures/
└── docs/
```

## Technologies

- MATLAB
- Numerical Analysis
- Differential Equations
- Stability Theory
- Scientific Computing

## Applications

- Population Modeling
- Engineering Simulation
- Numerical Solver Development
- Dynamical Systems Analysis

## Authors

**Rex Paster**  
Washington University in St. Louis

**Lucas Selvik**  
Washington University in St. Louis
