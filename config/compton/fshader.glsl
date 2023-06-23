uniform float opacity;
uniform bool invert_color;
uniform sampler2D tex;

uniform vec4 cmask;
uniform float time;
// uniform vec4 ctarget;

// uniform brightness;

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

vec3 rgb2hsl(vec3 c) { 
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0); 
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g)); 
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r)); 
    
    float d = q.x - min(q.w, q.y); 
    float e = 1.0e-10; 
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x); 
} 

vec3 hsl2rgb(vec3 c) { 
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0); 
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www); 
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
} 

vec3 rgb2hsv(vec3 c)
{
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

vec3 hsv2rgb(vec3 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

void main() {
    vec2 xy = vec2(gl_TexCoord[0].s, gl_TexCoord[0].t);
    
	  vec4 c = texture2D(tex, xy);

	  if (invert_color)
	  	c = vec4(vec3(c.a, c.a, c.a) - vec3(c), c.a);
	  c.a *= opacity;

    c = transCol(c, vec4(1.,0.,1.,1.), .02, .5);

    // c = c * (1. + sqrt( (c.r+c.g+c.b)/3. ));

    vec3 hsl = rgb2hsl(c.rgb);
    hsl.z = pow(hsl.z, BRIGHTNES_CURVE);
    
    c.rgb = hsl2rgb(hsl);
    
    float M = max(cmask.r,max(cmask.g, max(cmask.b,cmask.a)));
    if (M > 0.0)
        c.r = 0.0;

    // c = vec4(vec3(0.0, 0.0, 0.0)/255.0, 0.01);
	  gl_FragColor = c;

}
