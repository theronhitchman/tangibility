var('t')
filename = "viviani_curve.obj"
a = 15
thickness = 150
X = parametric_plot3d([a*(1-cos(t)), a*sin(t), 2*a*sin(t/2)], (t,0,4*pi),thickness=thickness)
o = open(filename,'w')
o.write(X.obj())
o.close()
