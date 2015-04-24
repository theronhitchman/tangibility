︠89138740-b4c7-44df-ac68-8ac2ddbd8f98is︠
%html
<h1>
    Let's print a torus!
</h1>
<p>
    This worksheet should create a file called <em>torus.obj</em> which you can pass to the Makerbot software for printing. I don't promise that it is a good model.
</p>
<p>
    Using <code>.obj</code> files is useful since some of Sage's plotting commands make quadrilateral meshes instead of trangular ones. <code>.stl</code> files really like triangles, instead. Both the Makerbot software and Meshlab take <code>.obj</code> as allowed inputs and will export <code>.stl</code> files if you prefer.
</p>
︡8e4fe5ec-e143-483d-b8fd-bbcb0f917dd0︡{"html":"<h1>\n    Let's print a torus!\n</h1>\n<p>\n    This worksheet should create a file called <em>torus.obj</em> which you can pass to the Makerbot software for printing. I don't promise that it is a good model.\n</p>\n<p>\n    Using <code>.obj</code> files is useful since some of Sage's plotting commands make quadrilateral meshes instead of trangular ones. <code>.stl</code> files really like triangles, instead. Both the Makerbot software and Meshlab take <code>.obj</code> as allowed inputs and will export <code>.stl</code> files if you prefer.\n</p>\n"}︡
︠131517d9-d66b-4b80-9062-b9e50bfe4d63︠
T = surfaces.Torus(r=4,R=10)   # this is a sage shorthand for making a torus with two radii given.
︡6b3c3b83-6b51-4f14-80c9-f18a27b58662︡
︠8dff6d91-648c-487e-b570-6117b7e37e4f︠
P = plot(T)   # We must instantiate the plot, but this really just makes a sage object we can call later...
︡f1b311b0-6dd7-4672-aa15-8e075e9e5f19︡
︠7862daa9-45a0-4c0f-8155-e6f08244a77a︠
show(P)  # ...and then we have to call the plot to force sage to actually do the computations of vertices and faces
︡6afb4271-7af4-45bb-95cd-c1cc5c20010a︡{"file":{"uuid":"5210426f-7283-4b91-88b2-dad9eb82d2f2","filename":"5210426f-7283-4b91-88b2-dad9eb82d2f2.sage3d"}}︡{"html":"<div align='center'></div>"}︡
︠1c2f97f7-90d0-4b7c-b09a-79b1e2b6d523︠
objdata = P.obj_repr(P.default_render_params())  # this is the way that someone built to pull the correct .obj format information into a list
︡47ec8849-de97-4416-9ee2-8638e7821002︡
︠9c27b6e0-c3d2-4472-8e44-e75c0e72a051s︠
o = open('torus.obj','w')         # let's make a file
for i in [2,4]:
    for thing in objdata[i]:      # for the relevant parts of the obj data list
        o.write(thing + '\n')     # write the data into the file
o.close()                         # clean up
︡197b0246-c73c-4088-8fa7-a3e7bf87c477︡
︠d2b48c20-764e-48da-835e-b3022e8ea208︠
%html
<h3>
    A comment:
</h3>
<p>
    It seems that the stuff using <code>P.obj_repr(P.default_render_params())</code> is designed to to make a list of text strings. This makes it easy
    to see what I want here.
</p>
<ol>
    <li>The first item has filename type information, and can be omitted.</li>
    <li>The second item has color and texture information, which we can omit.</li>
    <li>The third item in the list (index = 2) has vertex locations. We need those.</li>
    <li>The fourth and fifth items in the list have information defining faces.</li>
</ol>
<p>
    A tricky bit seems to be that for this model, the first list of faces has <em>inward facing</em>normals. I only discovered this when I poked around in the menus of
</p>









