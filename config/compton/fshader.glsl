uniform float opacity;
uniform bool invert_color;
uniform sampler2D tex;

uniform vec4 cmask;
uniform float time;
// uniform vec4 ctarget;

vec4 transCol(vec4 c, vec4 trcol, float tres, float op) {
	vec4 vd = abs(trcol - c);
	float diff = max(max(vd.r, vd.g), vd.b);
	if (diff < tres) {
        c = vec4(vec3(0.0, 0.0, 0.0), op);
        // c.a = op;
  }
  return c;
}

vec2 rot_cords( vec2 xy ) {
  float s = xy.x, t = xy.y;

  float rr = (s-.5)*(s-.5) + (t-.5)*(t-.5);
  float alpha = -0.*( (rr-.5)*(rr-.5) ) / 180. * 3.14;
  float ca = cos(alpha), sa = sin(alpha);
  
  s = s-.5; t = t - .5;
  s = s*ca + t*sa, t = -s*sa + t*ca;
  // s = s *1.3; t = t*1.3;
  s = s+.5; t = t + .5;

  return vec2(s,t);
}


void main() {
    vec2 xy = vec2(gl_TexCoord[0].s, gl_TexCoord[0].t);
    
	  vec4 c = texture2D(tex, xy);

	  if (invert_color)
	  	c = vec4(vec3(c.a, c.a, c.a) - vec3(c), c.a);
	  c.a *= opacity;

    c = transCol(c, vec4(1.,0.,1.,1.), .02, .5);

    // c = vec4(vec3(0.0, 0.0, 0.0)/255.0, 0.01);
	  gl_FragColor = c;
}
