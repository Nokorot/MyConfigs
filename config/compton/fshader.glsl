uniform float opacity;
uniform bool invert_color;
uniform sampler2D tex;

void main() {
    float s = gl_TexCoord[0].s, t = gl_TexCoord[0].t;


    float alpha = -00. / 180. * 3.14;
    float ca = cos(alpha), sa = sin(alpha);
    
    s = s-.5; t = t - .5;
    s = s*ca + t*sa, t = -s*sa + t*ca;
    // s = s *1.3; t = t*1.3;
    s = s+.5; t = t + .5;


	vec4 c = texture2D(tex, vec2(s,t));
	{
		// Change vec4(1.0, 1.0, 1.0, 1.0) to your desired color
		vec4 vdiff = abs(vec4(1.0, 0.0, 1.0, 1.0) - c);
		float diff = max(max(max(vdiff.r, vdiff.g), vdiff.b), vdiff.a);
		// float diff = vdiff.r*vdiff.r + vdiff.g*vdiff.g + vdiff.b*vdiff.b;
		// Change 0.8 to your desired opacity
		if (diff < 0.001)
			c *= 0.01;
	}
	if (invert_color)
		c = vec4(vec3(c.a, c.a, c.a) - vec3(c), c.a);
	c *= opacity;
    float r = 1. - (gl_TexCoord[0].x + gl_TexCoord[0].y)/2.;
	// gl_FragColor = vec4(c.xy, r, c.a);
	gl_FragColor = c;
}
