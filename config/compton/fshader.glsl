uniform float opacity;
uniform bool invert_color;
uniform sampler2D tex;

uniform vec4 cmask;
uniform vec4 ctarget;

vec4 transCol(vec4 c, vec4 trcol, float tres, float op) {
	vec4 vd = abs(trcol - c);
	float diff = max(max(vd.r, vd.g), vd.b);
	// float diff = max(max(max(vd.r, vd.g), vd.b), vd.a);
	// float diff = vd.r*vd.r + vdiff.g*vd.g + vd.b*vd.b;
	if (diff < tres) {
        c = vec4(vec3(27.0, 27.0, 31.0)/255.0, op);
        // c.a = op;
    }
    return c;
}

void main() {
    float s = gl_TexCoord[0].s, t = gl_TexCoord[0].t;

    float alpha = -00. / 180. * 3.14;
    float ca = cos(alpha), sa = sin(alpha);
    
    s = s-.5; t = t - .5;
    s = s*ca + t*sa, t = -s*sa + t*ca;
    // s = s *1.3; t = t*1.3;
    s = s+.5; t = t + .5;

	vec4 c = texture2D(tex, vec2(s,t));
    
	float mx = max(max(max(cmask.r, cmask.g), cmask.b), cmask.a);
    if (mx > 0.0)
        c = transCol(c, vec4(cmask.rgb, 1.0), .001, cmask.a);
    // c = transCol(c, vec4(1.0,0,1.0, 1.0), .05, 0.0);
    // c = transCol(c, vec4(0,0,0, 1.0), .05, 0.0);
    // c = transCol(c, vec4(25./255., 24./255., 25./255., 1.0), .1, 0.7);

    
	if (invert_color)
		c = vec4(vec3(c.a, c.a, c.a) - vec3(c), c.a);
	c *= opacity;
    float r = 1. - (gl_TexCoord[0].x + gl_TexCoord[0].y)/2.;
	// gl_FragColor = vec4(c.xy, r, c.a);
	gl_FragColor = c;
	// gl_FragColor = mix(cmask, c, gl_TexCoord[0].y);

}
