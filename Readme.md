*MohammadSina GhanbariPakdehi* Steady-State Heat Transfer Modeling the
Finned-Plate HEX

> **1.Introduction**

Heat Exchangers have a vital role in any industry. One of the popular
types of them is Finned-Plate Heat Exchangers. Finned plate heat
exchangers have several industrial applications due to their high heat
transfer rates and compact design. Some of these applications include:

> 1-HVAC Systems: Finned plate heat exchangers are commonly used in
> heating, ventilation, and air conditioning (HVAC) systems to transfer
> heat between fluids. They are particularly effective in air
> conditioning systems where the temperature difference between
> refrigerants and air is negligible. 2-Refrigeration: Finned plate heat
> exchangers are used in refrigeration systems to transfer heat between
> the refrigerant and the surrounding environment. They are commonly
> used in refrigeration systems for supermarkets, food processing
> plants, and other industrial applications.
>
> 3-Power Generation: Finned plate heat exchangers are used in power
> generation systems to transfer heat between fluids, such as cooling
> water and steam. They are commonly used in power plants, which help
> improve efficiency and reduce operating costs.
>
> 4-Chemical Processing: Finned plate heat exchangers are used in
> chemical processing plants to transfer heat between fluids. Their
> usage is in applications where the fluids have different viscosities,
> densities, or thermal conductivities.
>
> 5-Oil and Gas: Finned plate heat exchangers are used in the oil and
> gas industry to transfer heat between fluids. They are commonly used
> in gas processing plants, refineries, and other industrial
> applications.

In this study, we aim to show the temperature distribution in each
element of this H.Ex by 1D, 3D, Contour, Heatmap, and imagesc plot. Our
other goals are calculating the lost heat and finding an optimized
length for each fin to reduce the heat loss.

> **2.Problem Expression**

There is a finned-plate H.Ex with an initial temperature of 20 ℃ exposed
to air with a temperature of 15 ℃. Plate two has been rotated 45°
clockwise and connected to plate one by four fins. Plate one generates
heat at the rate of 2MW on its surface. Both plates have rectangular
shapes with dimensions 50 × 50 𝑐𝑚 for plate one and 40 × 40 𝑐𝑚 for plate
two. In addition, the top and bottom of plate one has been covered with
thermal insulation. The shape of the mentioned H.Ex. is shown in the
figure below:

![](vertopal_8077ca7cfef044349ba506bb8676cf9a/media/image1.png){width="2.3361111111111112in"
height="1.5583333333333333in"}

*Figure 1- Schematic of H.Ex. Geometry*

Each fin has a rectangular area with dimensions of 4√2 × 4√2 𝑐𝑚 and the
length of 100 𝑐𝑚. The thermal condition for each plate is shown in the
table below:

+-----------------------+-----------------------+-----------------------+
| Jun. 2020             | 1                     | > Sharif University   |
|                       |                       | > of Technology       |
+=======================+=======================+=======================+
+-----------------------+-----------------------+-----------------------+

*MohammadSina GhanbariPakdehi* Steady-State Heat Transfer Modeling the
Finned-Plate HEX

  --------------------------------------------------------------------------
  Plate / Side   Up             Down           Left           Right
  -------------- -------------- -------------- -------------- --------------
  1              Various        Various        140 ℃          160 ℃

  2              130 ℃          130 ℃          100 ℃          100 ℃
  --------------------------------------------------------------------------

The physical conditions of each plate and fin are shown in the table
below:

+-----------------+-----------------+-----------------+-----------------+
| Element         | > Thermal       | > 𝑘𝑔\           | > 𝐽\            |
|                 | > Conductivity  | > Density ( 𝑚3) | > Heat capacity |
|                 | > 𝑊\            |                 | > ( 𝑘𝑔.℃)       |
|                 | > coefficient ( |                 |                 |
|                 | > 𝑚.℃)          |                 |                 |
+=================+=================+=================+=================+
| Plate 1         | 302             | 8800            | 376             |
+-----------------+-----------------+-----------------+-----------------+
| Plate 2         | 500             | 10510           | 230             |
+-----------------+-----------------+-----------------+-----------------+
| Fin(s)          | 206             | 2707            | 896             |
+-----------------+-----------------+-----------------+-----------------+

> **2.1Assumptions**\
> To ease the calculation procedure, the several assumptions can be
> defined: 1)The system has reached to steady-state condition.
>
> 2)The physical properties of each element do not depend on the
> temperature.
>
> 3)The thickness of each plate is 1 𝑚.
>
> 4)The mesh grid dimension is 1 × 1 𝑐𝑚.
>
> 5)The Convection Coefficient is constant.
>
> 6)The plates have convection heat transfer in their front and
> backward, and in plate 1, there is a convection heat transfer in z
> dimension.
>
> 7)For achieving more accurate results, some correlations have been
> applied to convection heat transfer coefficient in the cases below:
>
> At the surface: ℎ′= ℎ At the sides: ℎ′= 0.5 ℎ At the corners: ℎ′= 0.75
> ℎ
>
> 8)The temperature distribution in fins is just in z coordination.
>
> 9)Although fins have contact with air in their all areas, just 1
> effective area is considered that is shown in the figure below:

![](vertopal_8077ca7cfef044349ba506bb8676cf9a/media/image2.png){width="1.8416666666666666in"
height="2.0694444444444446in"}

*Figure 2- Effective Convection heat transfer area of fin*

+-----------------------+-----------------------+-----------------------+
| Jun. 2020             | 2                     | > Sharif University   |
|                       |                       | > of Technology       |
+=======================+=======================+=======================+
+-----------------------+-----------------------+-----------------------+

*MohammadSina GhanbariPakdehi* Steady-State Heat Transfer Modeling the
Finned-Plate HEX

> **3.Theorem**\
> **3.1Find the temperature distribution of each element of H.Ex.**

At the beginning, the mesh and the precise location of each node must be
determined. The meshes of each plate are shown in the figures below:

![](vertopal_8077ca7cfef044349ba506bb8676cf9a/media/image3.png){width="3.0805555555555557in"
height="2.801388888888889in"}

*Figure 3- Mesh grid of Plate 1*

![](vertopal_8077ca7cfef044349ba506bb8676cf9a/media/image4.png){width="3.2569444444444446in"
height="2.999998906386702in"}*Figure 4- Mesh grid of plate 2*

The used method in this study is Iterative Gauss-Seidel for the system
of linear equations.

  ----------------------------------------------------------------------------
             (𝑞+ ∑𝑛                           𝑇𝑛                    
  ---------- ---------- ---------- ---------- ---------- ---------- ----------
                                              𝑅𝑚𝑛                   3-1

  𝑇𝑚 =                             1                                

                        𝑛          𝑅𝑚𝑛                              
  ----------------------------------------------------------------------------

Which q represents the rate of heat generation, T represents the
temperature of each node, and 𝑅𝑚𝑛 represents the thermal resistance.

+-----------------------+-----------------------+-----------------------+
| Jun. 2020             | 3                     | > Sharif University   |
|                       |                       | > of Technology       |
+=======================+=======================+=======================+
+-----------------------+-----------------------+-----------------------+

*MohammadSina GhanbariPakdehi* Steady-State Heat Transfer Modeling the
Finned-Plate HEX

> **3.1.1** **Temperature distribution for plate 1**\
> **3.1.1.1Temperature distribution for the top side**
>
> The schematic of each node is shown in the figure below:

![](vertopal_8077ca7cfef044349ba506bb8676cf9a/media/image5.png){width="2.9375in"
height="1.8819444444444444in"}

*Figure 5- Schematic of each node in the top side of plate 1*

The values of 𝑅𝑚𝑛 have been determined for each heat transfer mechanism:

+-----------------------+-----------------------+-----------------------+
| 1\                    |                       | > 3-2\                |
| Convection: 𝑅𝑚𝑛= (0.5 |                       | > 3-3                 |
| × 2) × ℎ × ∆𝑥2        |                       |                       |
+=======================+=======================+=======================+
| 1\                    | > 𝑘×∆𝑥\               |                       |
| Conduction: 𝑅𝑚𝑛=      | > ∆𝑦×1= 𝑘             |                       |
+-----------------------+-----------------------+-----------------------+

Thus, the final equation is:

  ---------------------------------------------------------------------------------------
                          𝑞+𝑘×(𝑇𝑚,𝑛−1+𝑇𝑚,𝑛+1+2∗𝑇𝑚+1,𝑛)+ℎ×∆𝑥2×𝑇∞   3-4
  ----------------------- --------------------------------------- -----------------------
  𝑇𝑚,𝑛 =                  3𝑘+ℎ∆𝑥2                                 

  ---------------------------------------------------------------------------------------

> **3.1.1.2Temperature distribution for the bottom side**
>
> The schematic of each node is shown in the figure below:

![](vertopal_8077ca7cfef044349ba506bb8676cf9a/media/image6.png){width="2.1958333333333333in"
height="2.1624989063867015in"}

*Figure 6- Schematic of each node in the bottom side of plate 1*

+-----------------------+-----------------------+-----------------------+
| Jun. 2020             | 4                     | > Sharif University   |
|                       |                       | > of Technology       |
+=======================+=======================+=======================+
+-----------------------+-----------------------+-----------------------+

*MohammadSina GhanbariPakdehi* Steady-State Heat Transfer Modeling the
Finned-Plate HEX

The values of 𝑅𝑚𝑛 have been determined for each heat transfer mechanism:

+-----------------------+-----------------------+-----------------------+
| 1\                    |                       | > 3-4\                |
| Convection: 𝑅𝑚𝑛= (0.5 |                       | > 3-5                 |
| × 2) × ℎ × ∆𝑥2        |                       |                       |
+=======================+=======================+=======================+
| 1\                    | > 𝑘×∆𝑥\               |                       |
| Conduction: 𝑅𝑚𝑛=      | > ∆𝑦×1= 𝑘             |                       |
+-----------------------+-----------------------+-----------------------+

Thus, the final equation is:

  ---------------------------------------------------------------------------------------
                          𝑞+𝑘×(𝑇𝑚,𝑛−1+𝑇𝑚,𝑛+1+2∗𝑇𝑚−1,𝑛)+ℎ×∆𝑥2×𝑇∞   3-6
  ----------------------- --------------------------------------- -----------------------
  𝑇𝑚,𝑛 =                  3𝑘+ℎ∆𝑥2                                 

  ---------------------------------------------------------------------------------------

> **3.1.1.3Temperature distribution for surface**

The schematic of each node is shown in the figure below:

![](vertopal_8077ca7cfef044349ba506bb8676cf9a/media/image7.png){width="1.8916655730533682in"
height="1.8611100174978128in"}

*Figure 7- Schematic of each node in the surface of plate 1*

The values of 𝑅𝑚𝑛 have been determined for each heat transfer mechanism:

+-----------------------+-----------------------+-----------------------+
| 1\                    |                       | > 3-7\                |
| Convection: 𝑅𝑚𝑛= ℎ ×  |                       | > 3-8                 |
| ∆𝑥2                   |                       |                       |
+=======================+=======================+=======================+
| 1\                    | > 𝑘×∆𝑥\               |                       |
| Conduction: 𝑅𝑚𝑛=      | > ∆𝑦×1= 𝑘             |                       |
+-----------------------+-----------------------+-----------------------+

Thus, the final equation is:

  ----------------------------------------------------------------------------------------------------
                    𝑞+𝑘×(𝑇𝑚,𝑛+1+𝑇𝑚+1,𝑛+𝑇𝑚,𝑛−1+𝑇𝑚−1,𝑛)+2×ℎ×∆𝑥2×𝑇∞                     3-9
  ----------------- ---------------------------------------------- ----------------- -----------------
  𝑇𝑚,𝑛 =            4∗𝑘+2×ℎ×∆𝑥2                                                      Sharif University
                                                                                     of Technology

  Jun. 2020                                                        5                 
  ----------------------------------------------------------------------------------------------------

*MohammadSina GhanbariPakdehi* Steady-State Heat Transfer Modeling the
Finned-Plate HEX

**3.1.1.4Temperature distribution for surface of fin area** The
schematic of each node is shown in the figure below:

![](vertopal_8077ca7cfef044349ba506bb8676cf9a/media/image8.png){width="2.3833333333333333in"
height="2.3958333333333335in"}

*Figure 8- Schematic of each node in the surface of the fin area in
plate 1*

The values of 𝑅𝑚𝑛 have been determined for each heat transfer mechanism:

+-----------------------+-----------------------+-----------------------+
| 1\                    |                       | > 3-10\               |
| Convection: 𝑅𝑚𝑛= ℎ ×  |                       | > 3-11\               |
| ∆𝑥2                   |                       | > 3-12                |
+=======================+=======================+=======================+
| 1\                    | > 𝑘×∆𝑥\               |                       |
| Conduction: 𝑅𝑚𝑛=      | > ∆𝑦×1= 𝑘             |                       |
+-----------------------+-----------------------+-----------------------+
| Conduction in fin:    |                       |                       |
| 𝑅𝑚,𝑛= 𝑘×0.001∆𝑦×∆𝑥=   |                       |                       |
| 0.1 × 𝑘               |                       |                       |
+-----------------------+-----------------------+-----------------------+

Thus, the final equation is:

  -------------------------------------------------------------------------------------------------------------
  =                       𝑞+(𝑇𝑚,𝑛+1×𝑘+𝑇𝑚+1,𝑛×𝑘+𝑇𝑚,𝑛−1×𝑘+𝑇𝑚−1,𝑛×𝑘+𝑇𝑏𝑖×0.1×𝑘𝑓)+ℎ×∆𝑥2×𝑇∞   3-13
  ----------------------- ------------------------------------------------------------- -----------------------
  𝑚,𝑛 =                   4×𝑘+0.1×𝑘𝑓+ℎ×∆𝑥2                                              

  -------------------------------------------------------------------------------------------------------------

**3.1.1.5Temperature distribution for the corners of fin area** The
schematic of each node is shown in the figure below:

+-----------------------+-----------------------+-----------------------+
| Jun. 2020             | 6                     | > Sharif University   |
|                       |                       | > of Technology       |
+=======================+=======================+=======================+
+-----------------------+-----------------------+-----------------------+

*MohammadSina GhanbariPakdehi* Steady-State Heat Transfer Modeling the
Finned-Plate HEX

![](vertopal_8077ca7cfef044349ba506bb8676cf9a/media/image9.png){width="2.426388888888889in"
height="2.3125in"}

*Figure 9 - Schematic of each node in the corners of the fin area in
plate 1* The values of 𝑅𝑚𝑛 have been determined for each heat transfer
mechanism:

+-----------------------+-----------------------+-----------------------+
| 1\                    |                       | > 3-14\               |
| Convection: 𝑅𝑚𝑛= (1 + |                       | > 3-15\               |
| 0.75) × ℎ × ∆𝑥2       |                       | > 3-16                |
+=======================+=======================+=======================+
| 1\                    | > 𝑘×∆𝑥\               |                       |
| Conduction: 𝑅𝑚𝑛=      | > ∆𝑦×1= 𝑘             |                       |
+-----------------------+-----------------------+-----------------------+
| Conduction in fin:    |                       |                       |
| 𝑅𝑚,𝑛= 0.25 ×          |                       |                       |
| 𝑘×0.001∆𝑦×∆𝑥 = k ×    |                       |                       |
| 0.1 × 0.25            |                       |                       |
+-----------------------+-----------------------+-----------------------+

Thus, the final equation is:

  ---------------------------------------------------------------------------------------------------------------------------
                          𝑞+(𝑇𝑚,𝑛+1×𝑘+𝑇𝑚+1,𝑛×𝑘+𝑇𝑚,𝑛−1×𝑘+𝑇𝑚−1,𝑛×𝑘+𝑇𝑏𝑖×0.1×0.25×𝑘𝑓)+(1+0.75)×ℎ×∆𝑥2×𝑇∞   3-17
  ----------------------- --------------------------------------------------------------------------- -----------------------
  𝑇𝑚,𝑛 =                  4×𝑘+0.1×0.25×𝑘𝑓+(1+0.75)×ℎ×∆𝑥2                                              

  ---------------------------------------------------------------------------------------------------------------------------

**3.1.1.6Temperature distribution for the sides of fin area** The
schematic of each node is shown in the figure below:

![](vertopal_8077ca7cfef044349ba506bb8676cf9a/media/image10.png){width="1.8999989063867018in"
height="2.6291655730533683in"}

*Figure 10- Schematic of each node in the sides of the fin area in plate
1* The values of 𝑅𝑚𝑛 have been determined for each heat transfer
mechanism:

+-----------------------+-----------------------+-----------------------+
| Jun. 2020             | 7                     | > Sharif University   |
|                       |                       | > of Technology       |
+=======================+=======================+=======================+
+-----------------------+-----------------------+-----------------------+

*MohammadSina GhanbariPakdehi* Steady-State Heat Transfer Modeling the
Finned-Plate HEX

+-----------------------+-----------------------+-----------------------+
| 1\                    |                       | > 3-18\               |
| Convection: 𝑅𝑚𝑛= (1 + |                       | > 3-19\               |
| 0.5) × ℎ × ∆𝑥2        |                       | > 3-20                |
+=======================+=======================+=======================+
| 1\                    | > 𝑘×∆𝑥\               |                       |
| Conduction: 𝑅𝑚𝑛=      | > ∆𝑦×1= 𝑘             |                       |
+-----------------------+-----------------------+-----------------------+
| Conduction in fin:    |                       |                       |
| 𝑅𝑚,𝑛= 0.25 ×          |                       |                       |
| 𝑘×0.001∆𝑦×∆𝑥 = k ×    |                       |                       |
| 0.1 × 0.5             |                       |                       |
+-----------------------+-----------------------+-----------------------+

Thus, the final equation is:

+-----------------------+-----------------------+-----------------------+
| =                     | 𝑞+(𝑇𝑚,𝑛+              | 3-21                  |
|                       | 1×𝑘+𝑇𝑚+1,𝑛×𝑘+𝑇𝑚,𝑛−1×𝑘 |                       |
|                       | +𝑇𝑚−1,𝑛×𝑘+𝑇𝑏𝑖×0.1×0.5 |                       |
|                       | ×𝑘𝑓)+(1+0.5)×ℎ×∆𝑥2×𝑇∞ |                       |
+=======================+=======================+=======================+
| 𝑚,𝑛 =                 | 4×𝑘+0.1×              |                       |
|                       | 0.25×𝑘𝑓+(1+0.5)×ℎ×∆𝑥2 |                       |
+-----------------------+-----------------------+-----------------------+
| > **3.1.2**           |                       |                       |
| > **Temperature       |                       |                       |
| > distribution for    |                       |                       |
| > plate 2**           |                       |                       |
| >                     |                       |                       |
| >                     |                       |                       |
|  **3.1.2.1Temperature |                       |                       |
| > distribution for    |                       |                       |
| > surface**           |                       |                       |
+-----------------------+-----------------------+-----------------------+

The schematic of each node is shown in the figure below:

![](vertopal_8077ca7cfef044349ba506bb8676cf9a/media/image7.png){width="1.8916655730533682in"
height="1.8611111111111112in"}

*Figure 11- Schematic of each node in the surface of plate 1*

The values of 𝑅𝑚𝑛 have been determined for each heat transfer mechanism:

+-----------------------+-----------------------+-----------------------+
| 1\                    |                       | > 3-22\               |
| Convection: 𝑅𝑚𝑛= 2 ×  |                       | > 3-23                |
| ℎ × ∆𝑥2               |                       |                       |
+=======================+=======================+=======================+
| 1\                    | > 𝑘×∆𝑥\               |                       |
| Conduction: 𝑅𝑚𝑛=      | > ∆𝑦×1= 𝑘             |                       |
+-----------------------+-----------------------+-----------------------+

Thus, the final equation is:

  ----------------------------------------------------------------------------------------------
  =                       𝑞+𝑘×(𝑇𝑚,𝑛+1+𝑇𝑚+1,𝑛+𝑇𝑚,𝑛−1+𝑇𝑚−1,𝑛)+2×ℎ×∆𝑥2×𝑇∞   3-24
  ----------------------- ---------------------------------------------- -----------------------
  𝑚,𝑛 =                   4×𝑘+2×ℎ×∆𝑥2                                    

  ----------------------------------------------------------------------------------------------

**3.1.2.2Temperature distribution for the surface of fin area** The
schematic of each node is shown in the figure below:

+-----------------------+-----------------------+-----------------------+
| Jun. 2020             | 8                     | > Sharif University   |
|                       |                       | > of Technology       |
+=======================+=======================+=======================+
+-----------------------+-----------------------+-----------------------+

*MohammadSina GhanbariPakdehi* Steady-State Heat Transfer Modeling the
Finned-Plate HEX

![](vertopal_8077ca7cfef044349ba506bb8676cf9a/media/image11.png){width="1.9347222222222222in"
height="2.0347222222222223in"}

*Figure 12- Schematic of each node in the surface of the fin area in
plate 2*

The values of 𝑅𝑚𝑛 have been determined for each heat transfer mechanism:

+-----------------------+-----------------------+-----------------------+
| 1\                    |                       | > 3-25\               |
| Convection: 𝑅𝑚𝑛= ℎ ×  |                       | > 3-26\               |
| ∆𝑥2                   |                       | > 3-27                |
+=======================+=======================+=======================+
| 1\                    | > 𝑘×∆𝑥\               |                       |
| Conduction: 𝑅𝑚𝑛=      | > ∆𝑦×1= 𝑘             |                       |
+-----------------------+-----------------------+-----------------------+
| Conduction in fin:    |                       |                       |
| 𝑅𝑚,𝑛= 0.25 ×          |                       |                       |
| 𝑘×0.001∆𝑦×∆𝑥 = k ×    |                       |                       |
| 0.2                   |                       |                       |
+-----------------------+-----------------------+-----------------------+

Thus, the final equation is:

  -----------------------------------------------------------------------------------------------------------
                          (𝑇𝑚,𝑛+1×𝑘+𝑇𝑚+1,𝑛×𝑘+𝑇𝑚,𝑛−1×𝑘+𝑇𝑚−1,𝑛×𝑘+𝑇𝑏𝑖×0.2×𝑘𝑓)+ℎ×∆𝑥2×𝑇∞   3-28
  ----------------------- ----------------------------------------------------------- -----------------------
  𝑇𝑚,𝑛 =                  4×𝑘+0.1×𝑘𝑓+ℎ×∆𝑥2                                            

  -----------------------------------------------------------------------------------------------------------

> **3.1.2.3Temperature distribution for the corners of fin area**

The schematic of each node is shown in the figure below:

![](vertopal_8077ca7cfef044349ba506bb8676cf9a/media/image12.png){width="2.616665573053368in"
height="1.9013877952755907in"}

> *Figure 13- Schematic of each node in the corners of the fin area in
> plate 2*

The values of 𝑅𝑚𝑛 have been determined for each heat transfer mechanism:

+-----------------+-----------------+-----------------+-----------------+
| 1\              |                 | 9               | 3-29            |
| Convection:     |                 |                 |                 |
| 𝑅𝑚𝑛= (1 + 0.75) |                 |                 |                 |
| × ℎ × ∆𝑥2       |                 |                 |                 |
+=================+=================+=================+=================+
| 1\              | > 𝑘×∆𝑥\         |                 | 3-30            |
| Conduction:     | > ∆𝑦×1= 𝑘       |                 |                 |
| 𝑅𝑚𝑛=            |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| Jun. 2020       |                 |                 | > Sharif        |
|                 |                 |                 | > University of |
|                 |                 |                 | > Technology    |
+-----------------+-----------------+-----------------+-----------------+

*MohammadSina GhanbariPakdehi* Steady-State Heat Transfer Modeling the
Finned-Plate HEX

Conduction in fin: 𝑅𝑚,𝑛= 0.25 × 𝑘×0.001∆𝑦×∆𝑥 = k × 0.2 × 0.25 3-31

Thus, the final equation is:

+-----------------------+-----------------------+-----------------------+
| =                     | (𝑇𝑚−1,𝑛+1×𝑘+𝑇𝑚−1,     | > 3-32                |
|                       | 𝑛−1×𝑘+𝑇𝑚+1,𝑛−1×𝑘+𝑇𝑚+1 |                       |
|                       | ,𝑛+1×𝑘+𝑇𝑏𝑖×0.2×0.25×𝑘 |                       |
|                       | 𝑓)+(1+0.75)×ℎ×∆𝑥′2∗𝑇∞ |                       |
+=======================+=======================+=======================+
| 𝑚,𝑛 =                 | 4×𝑘+0.2×0.            |                       |
|                       | 25×𝑘𝑓+(1+0.75)×ℎ×∆𝑥′2 |                       |
+-----------------------+-----------------------+-----------------------+

> **3.1.2.4Temperature distribution for the sides of fin area**

The schematic of each node is shown in the figure below:

![](vertopal_8077ca7cfef044349ba506bb8676cf9a/media/image13.png){width="2.095833333333333in"
height="2.015277777777778in"}

*Figure 14- Schematic of each node in the sides of the fin area in plate
2*

The values of 𝑅𝑚𝑛 have been determined for each heat transfer mechanism:

+-----------------------+-----------------------+-----------------------+
| 1\                    |                       | > 3-32\               |
| Convection: 𝑅𝑚𝑛= (1 + |                       | > 3-33\               |
| 0.5) × ℎ × ∆𝑥2        |                       | > 3-34                |
+=======================+=======================+=======================+
| 1\                    | > 𝑘×∆𝑥\               |                       |
| Conduction: 𝑅𝑚𝑛=      | > ∆𝑦×1= 𝑘             |                       |
+-----------------------+-----------------------+-----------------------+
| Conduction in fin:    |                       |                       |
| 𝑅𝑚,𝑛= 0.25 ×          |                       |                       |
| 𝑘×0.001∆𝑦×∆𝑥 = k ×    |                       |                       |
| 0.2 × 0.5             |                       |                       |
+-----------------------+-----------------------+-----------------------+

Thus, the final equation is:

  --------------------------------------------------------------------------------------------------------------------------------
                          (𝑇𝑚−1,𝑛+1×𝑘+𝑇𝑚−1,𝑛−1×𝑘+𝑇𝑚+1,𝑛−1×𝑘+𝑇𝑚+1,𝑛+1×𝑘+𝑇𝑏𝑖×0.2×0.5×𝑘𝑓)+(1+0.5)×ℎ×∆𝑥′2∗𝑇∞   3-35
  ----------------------- -------------------------------------------------------------------------------- -----------------------
  𝑇𝑚,𝑛 =                  4×𝑘+0.2×0.5×𝑘𝑓+(1+0.5)×ℎ×∆𝑥′2                                                    

  --------------------------------------------------------------------------------------------------------------------------------

> **3.1.3Temperature distribution for each fin**

According to assumptions, there are 3 cases for calculating the
temperature of each node:

> 1)Base that connected to the Plate 1 & 2:

To reach a unit temperature, calculate the average of the Base
Temperature matrix elements.

+-------------+-------------+-------------+-------------+-------------+
| =           | ∑𝑚          | > ∑𝑛        | 𝑇𝑖,𝑗        | 3-36        |
|             |             |             |             |             |
|             | 𝑖=1         | 𝑗=1         |             |             |
+=============+=============+=============+=============+=============+
| =           | 𝑚×𝑛         |             |             |             |
+-------------+-------------+-------------+-------------+-------------+

> 2)Whole of the fin:

+-----------------------+-----------------------+-----------------------+
| Jun. 2020             | 10                    | > Sharif University   |
|                       |                       | > of Technology       |
+=======================+=======================+=======================+
+-----------------------+-----------------------+-----------------------+

*MohammadSina GhanbariPakdehi* Steady-State Heat Transfer Modeling the
Finned-Plate HEX

The schematic of each node is shown in the figure below:

> ![](vertopal_8077ca7cfef044349ba506bb8676cf9a/media/image14.png){width="3.433333333333333in"
> height="2.047222222222222in"}

*Figure 15- Schematic of each node in every fin*

The values of 𝑅𝑚𝑛 have been determined for each heat transfer mechanism:

+-----------------+-----------------+-----------------+-----------------+
| 1\              |                 |                 | > 3-37\         |
| Convection:     |                 |                 | > 3-38          |
| 𝑅𝑚𝑛= 4 × ℎ × 𝑊  |                 |                 |                 |
| × ∆𝑥            |                 |                 |                 |
+=================+=================+=================+=================+
| <table>         | 𝑊2∗𝑘𝑓           | > = 0.32 𝑘      |                 |
| <colgroup>      |                 |                 |                 |
| <col            |                 |                 |                 |
| style=          |                 |                 |                 |
| "width: 50%" /> |                 |                 |                 |
| <col            |                 |                 |                 |
| style=          |                 |                 |                 |
| "width: 50%" /> |                 |                 |                 |
| </colgroup>     |                 |                 |                 |
| <thead>         |                 |                 |                 |
| <tr             |                 |                 |                 |
| class="header"> |                 |                 |                 |
| <th>C           |                 |                 |                 |
| onduction:</th> |                 |                 |                 |
| <               |                 |                 |                 |
| th><blockquote> |                 |                 |                 |
| <p>1</p>        |                 |                 |                 |
| </b             |                 |                 |                 |
| lockquote></th> |                 |                 |                 |
| </tr>           |                 |                 |                 |
| </thead>        |                 |                 |                 |
| <tbody>         |                 |                 |                 |
| </tbody>        |                 |                 |                 |
| </table>        |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| 𝑅𝑚𝑛=            | ∆𝑥              | 𝑓               |                 |
+-----------------+-----------------+-----------------+-----------------+

Thus, the final equation is:

  ------------------------------------------------------------------------------------
                          0.32𝑘𝑓×(𝑇𝑚,𝑛−1+𝑇𝑚,𝑛+1)+4×ℎ×𝑊×∆𝑥×𝑇∞   3-39
  ----------------------- ------------------------------------ -----------------------
  𝑇𝑚,𝑛 =                  2×0.32𝑘𝑓+4×ℎ×∆𝑥×𝑊                    

  ------------------------------------------------------------------------------------

**3.2Find the heat loss between H.Ex. and air**\
In regards to assumptions, the heat transfer coefficient is considered a
constant value, so the lost heat can be calculated using Newton's law of
cooling:

𝑄 = ℎ. 𝐴. (𝑇 − 𝑇∞) 3-40 Therefore, the heat loss for each node can be
obtained from eq. , and the total heat loss can be resulted from
summation of the heat loss vector elements.

**3.3Optimize the fin length to reduce heat loss**\
In this case, assume that the convection heat transfer coefficient
varies with the length of fin. In another speech, the convection heat
transfer coefficient of each node differs from another node in a
particular fin.

The convective heat transfer coefficient obeys from the following
polynomial:

ℎ(𝐿) \[ 𝑚2.℃\] = −2 × 10−9𝐿6 + 5 × 10−7𝐿5 − 6 × 10−5𝐿4 + 0.0031𝐿3 −
0.0401 𝐿2 − 1.0438𝐿 + 26.947 3-41 The temperature distribution in each
fin can be obtained from eq. . Thus, the heat loss of each node can be
calculated from Newton's colling law. The optimized fin length can be
calculated after the summation of the heat loss vectors.

+-----------------------+-----------------------+-----------------------+
| Jun. 2020             | 11                    | > Sharif University   |
|                       |                       | > of Technology       |
+=======================+=======================+=======================+
+-----------------------+-----------------------+-----------------------+

*MohammadSina GhanbariPakdehi* Steady-State Heat Transfer Modeling the
Finned-Plate HEX

> **4.Results**\
> **4.1The temperature distribution of each H.Ex. element**\
> The 3D plot of Temperature distribution for plate 1 is shown in the
> figure below:
>
> ![](vertopal_8077ca7cfef044349ba506bb8676cf9a/media/image15.png){width="6.486111111111111in"
> height="3.1180555555555554in"}
>
> *Figure 16- The temperature distribution of plate 1*\
> The 3D plot of Temperature distribution for plate 2 is shown in the
> figure below:
>
> ![](vertopal_8077ca7cfef044349ba506bb8676cf9a/media/image16.png){width="6.486111111111111in"
> height="3.1180555555555554in"}

*Figure 17- The temperature distribution of plate 2*

+-----------------------+-----------------------+-----------------------+
| Jun. 2020             | 12                    | > Sharif University   |
|                       |                       | > of Technology       |
+=======================+=======================+=======================+
+-----------------------+-----------------------+-----------------------+

*MohammadSina GhanbariPakdehi* Steady-State Heat Transfer Modeling the
Finned-Plate HEX

> The curves have a smooth shape and foveae, because of the existence of
> fins. Fig.17 has a sharp shape, because the temperature of all sides
> is bounded. The depth of the foveae of fig.17 is less than fig.16,
> because there is a heat generation term for plate 1 and the
> temperature of all sides of plate 2 is bounded.
>
> The 1D plot of Temperature distribution for fins is shown in the
> figure below:
>
> ![](vertopal_8077ca7cfef044349ba506bb8676cf9a/media/image17.png){width="6.5in"
> height="3.1347222222222224in"}

*Figure 18- The temperature distribution of fins*

> The general form of all curves is almost the same, but there is
> difference in initial and final node temperature. The difference
> between temperature matrix of fin base caused this occurrence.
>
> Other types of plots are available in the attached MATLAB code.
>
> **4.2The heat loss between H.Ex. and air**

Three cases have been studied. For each case, computer wants a generated
heat flux value from user. The generated heat rate will be obtained from
the equation below:

𝑄 = 𝑞 \[ 𝑚2\] . 𝐴 = 𝑞 × 106 × 0.5 × 0.5 × 0.001 4.1

The results of study for three cases are shown in the table below:

+-----------------+-----------------+-----------------+-----------------+
| Case            | <table>         | Heat loss \[𝑊\] | > 𝑄\            |
|                 | <colgroup>      |                 | > 𝑄𝑙𝑜𝑠𝑠         |
|                 | <col            |                 |                 |
|                 | style=          |                 |                 |
|                 | "width: 50%" /> |                 |                 |
|                 | <col            |                 |                 |
|                 | style=          |                 |                 |
|                 | "width: 50%" /> |                 |                 |
|                 | </colgroup>     |                 |                 |
|                 | <thead>         |                 |                 |
|                 | <tr             |                 |                 |
|                 | class="header"> |                 |                 |
|                 | <               |                 |                 |
|                 | th><blockquote> |                 |                 |
|                 | <p>Generated    |                 |                 |
|                 | heat [</p>      |                 |                 |
|                 | </b             |                 |                 |
|                 | lockquote></th> |                 |                 |
|                 | <               |                 |                 |
|                 | th><blockquote> |                 |                 |
|                 | <p>𝑊<br />      |                 |                 |
|                 | 𝑚2]</p>         |                 |                 |
|                 | </b             |                 |                 |
|                 | lockquote></th> |                 |                 |
|                 | </tr>           |                 |                 |
|                 | </thead>        |                 |                 |
|                 | <tbody>         |                 |                 |
|                 | </tbody>        |                 |                 |
|                 | </table>        |                 |                 |
+=================+=================+=================+=================+
| No. 1           | 2               | 393.8674        | 1.269           |
+-----------------+-----------------+-----------------+-----------------+
| No. 2           | 10              | 394.7034        | 6.334           |
+-----------------+-----------------+-----------------+-----------------+
| No. 3           | 20              | 395.7483        | 12.634          |
+-----------------+-----------------+-----------------+-----------------+

𝑄\
The 𝑄𝑙𝑜𝑠𝑠 versus generated heat plot is shown in the figure below:

+-----------------------+-----------------------+-----------------------+
| Jun. 2020             | 13                    | > Sharif University   |
|                       |                       | > of Technology       |
+-----------------------+-----------------------+-----------------------+

![](vertopal_8077ca7cfef044349ba506bb8676cf9a/media/image18.png){width="5.013888888888889in"
height="2.75in"}

*MohammadSina GhanbariPakdehi* Steady-State Heat Transfer Modeling the
Finned-Plate HEX

+-----------------------------------------------------------------------+
| +-------+-------+-------+-------+-------+-------+-------+-------+     |
| | Q/    | 14    |       |       |       |       |       |       |     |
| | Qloss |       | ----- |       |       |       |       |       |     |
| |       | 12    | ----- |       |       |       |       |       |     |
| |       |       | ----- |       |       |       |       |       |     |
| |       | 10    | ----- |       |       |       |       |       |     |
| |       |       | ----- |       |       |       |       |       |     |
| |       | 8     | ----- |       |       |       |       |       |     |
| |       |       |       |       |       |       |       |       |     |
| |       | 6     |    Q/ |       |       |       |       |       |     |
| |       |       | Qloss |       |       |       |       |       |     |
| |       | 4     |  = 0. |       |       |       |       |       |     |
| |       |       | 6313Q |       |       |       |       |       |     |
| |       | 2     |  +    |       |       |       |       |       |     |
| |       |       |       |       |       |       |       |       |     |
| |       | 0     |       |       |       |       |       |       |     |
| |       |       |       |       |       |       |       |       |     |
| |       |       |    0. |       |       |       |       |       |     |
| |       |       | 0115  |       |       |       |       |       |     |
| |       |       |       |       |       |       |       |       |     |
| |       |       |       |       |       |       |       |       |     |
| |       |       | -- -- |       |       |       |       |       |     |
| |       |       |  ---- |       |       |       |       |       |     |
| |       |       | ----- |       |       |       |       |       |     |
| |       |       |  ---- |       |       |       |       |       |     |
| |       |       | ----- |       |       |       |       |       |     |
| |       |       | -- -- |       |       |       |       |       |     |
| |       |       |       |       |       |       |       |       |     |
| |       |       |       |       |       |       |       |       |     |
| |       |       | ----- |       |       |       |       |       |     |
| |       |       | ----- |       |       |       |       |       |     |
| |       |       | ----- |       |       |       |       |       |     |
| |       |       | ----- |       |       |       |       |       |     |
| |       |       | ----- |       |       |       |       |       |     |
| |       |       | ----- |       |       |       |       |       |     |
| +=======+=======+=======+=======+=======+=======+=======+=======+     |
| |       | > 0.0 |       | 5.0   | 1.0   | 1.5   | 2.0   | 2.5   |     |
| |       | 0E+00 |       | 0E+06 | 0E+07 | 0E+07 | 0E+07 | 0E+07 |     |
| +-------+-------+-------+-------+-------+-------+-------+-------+     |
|                                                                       |
| Q \[W/m\^2\]                                                          |
+=======================================================================+
+-----------------------------------------------------------------------+

*Figure 19 - Q/Qloss versus Q plot*

As expected, there is a linear correlation between these parameters. The
assumptions and simplifications

caused this occurrence.

+-----------------------+-----------------------+-----------------------+
| Jun. 2020             | 14                    | > Sharif University   |
|                       |                       | > of Technology       |
+=======================+=======================+=======================+
+-----------------------+-----------------------+-----------------------+

*MohammadSina GhanbariPakdehi* Steady-State Heat Transfer Modeling the
Finned-Plate HEX

**5.References**\
\[1\]: D. Q. Kern, A. D. Kraus. (1972). *Extended surface heat
transfer.*

\[2\]: Holman, J. P. (2010). *Heat Transfer.* Jefferson City, MO:
MCGraw-Hill College.

\[3\]: Özışık, M. N. (1979). *Heat transfer.* McGraw-Hill College.

\[4\]: R. R. Harper, W. B. Brown. (1923). *Mathematical equations for
heat conduction in the fins of air-* *cooled engines.*

+-----------------------+-----------------------+-----------------------+
| Jun. 2020             | 15                    | > Sharif University   |
|                       |                       | > of Technology       |
+=======================+=======================+=======================+
+-----------------------+-----------------------+-----------------------+
