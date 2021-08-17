# USING-MATRIX-FORM-FOR-PROPAGATION-OF-ERRORS
# 3 D Laser scanners:-<br />
[PROPAGATION OF ERRORS](https://github.com/Daham-Mustaf/USING-MATRIX-FORM-FOR-PROPAGATION-OF-ERRORS/blob/main/Error_Propagation/Erro_Propagation.m):-<br />
Laser scanners or Lidar sensors are collecting a large number of points in 3D space, which can be applied from the air or ground. Generally, the acquired point clouds are of high positioning accuracy, which can reach a survey grade millimeter accuracy. Further, point clouds can be extremely dense of more than 1 point per centimeter.<br />
The propagation of errors is useful to estimate one component of the relative accuracy of the sensor errors by transforming the measured range and angles to 3D coordinates Xi, Yi, Zi as follows:<br />
Xi =R*cos(A)*cos(V);<br />
Yi =R*sin(A)*cos(V);<br />
Zi =R*sin(V);<br />
where<br />
R is the measured range distance from the sensor to the object point. <br />
Az is the measured azimuth angle of the laser beam.<br />
V is the measured vertical angle of the laser beam measured from the horizontal plane. X1, Y1, and Z1 are the coordinates of the Lidar.<br />
included in the model, then the estimated errors of the scanned point represent the relative accuracy (noise in the point cloud).<br />
An error propagation can be applied to using Jacobian matrix J to estimate the errors of the scanned points in a point cloud as follows:<br />
Sigma_ll:- the variance-covariance matrix of the observed range and angles of the point cloudP<br />
Sigma_Xb_Yb:- the variance-covariance matrix of the derived coordinates of the point cloud.<br />

Then the standard deviations of the scanned point coordinates are the squared roots of the main<br />
diagonal elements as follows:<br />
sigma[(0,0), (1,1), (2,2)].

