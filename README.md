# Mandible to Fibula Transformation: Step-by-Step Explanation

This document explains the mathematical and computational process for transforming mandible segments to the fibula in the context of virtual surgical planning.

---

## 1. Define Axes and Origins

For each bone (mandible and fibula), define:
- Three orthogonal axes (x, y, z)
- An origin (3D point)

**Example:**
- Mandible:  
  x1 = [1, 0, 0]  
  y1 = [0, 1, 0]  
  z1 = [0, 0, 1]  
  origin1 = [10, 20, 30]
- Fibula:  
  x2 = [0, 1, 0]  
  y2 = [1, 0, 0]  
  z2 = [0, 0, -1]  
  origin2 = [100, 200, 300]

---

## 2. Build 4x4 Transformation Matrices

For each frame, construct a 4x4 matrix:

    | x0 y0 z0 o0 |
    | x1 y1 z1 o1 |
    | x2 y2 z2 o2 |
    |  0  0  0  1 |

Where x, y, z are the axes and o is the origin.   

for mandible (m1):   
| 1  0  0  10 |
| 0  1  0  20 |
| 0  0  1  30 |
| 0  0  0   1 |.  

for fibula (m2):   
| 0  1  0 100 |
| 1  0  0 200 |
| 0  0 -1 300 |
| 0  0  0   1 |.  
---

## 3. Compute the Registration Transform

- Invert the mandible matrix (m1) to get world-to-mandible.
- Multiply the fibula matrix (m2) by the inverse of the mandible matrix:

    M_mandibleToFibula = M_fibula * inverse(M_mandible).   or.    
    M_mandibleToFibula = M2 * inverse(M1).  

This matrix encodes the rotation and translation needed to map points from the mandible frame to the fibula frame.

---

## 4. Apply the Transform to a Point

Given a point in mandible coordinates (e.g., [1, 2, 3, 1]), transform it:

    p_fibula = M_mandibleToFibula * p_mandible

This gives the coordinates of the point in the fibula frame.

---

## 5. In Slicer (Implementation)

- The code builds these matrices using the axes and origins from Slicer nodes.
- The transform is applied to the model node, mapping the geometry from mandible to fibula space.

---

## Summary
- Build 4x4 matrices for both frames.
- Compute the registration matrix as `M_fibula * inverse(M_mandible)`.
- Apply this matrix to points or models to map them from mandible to fibula.

---

For more details, see the code in `mandible_to_fibula_transform.py`.
