  <!-- ====================================================================== -->
  <!-- IMPLEMENTATION -->
  <!-- ====================================================================== -->

  <!-- PRIVATE REGEXP FUNCTIONS -->

  <!-- sequence -->
  <function name="p:seq" as="xs:string">
    <param name="symbols" as="xs:string*"/>
    <value-of select="concat('(', string-join($symbols, ''), ')')"/>
  </function>

  <function name="p:or" as="xs:string">
    <param name="symbols" as="xs:string*"/>
    <value-of select="concat('(', string-join($symbols, '|'), ')')"/>
  </function>

  <function name="p:zero-or-one" as="xs:string">
    <param name="symbol" as="xs:string"/>
    <value-of select="concat('(', $symbol, ')?')"/>
  </function>

  <function name="p:zero-to-n" as="xs:string">
    <param name="symbol" as="xs:string"/>
    <value-of select="concat('(', $symbol, ')*')"/>
  </function>

  <function name="p:one-to-n" as="xs:string">
    <param name="symbol" as="xs:string"/>
    <value-of select="concat('(', $symbol, ')+')"/>
  </function>

  <!-- literal -->
  <function name="p:lit" as="xs:string*">
    <param name="literals" as="xs:string*"/>
    <sequence select="for $literal in $literals return
                      replace(
                        replace(
                          replace($literal, '\-', '\\-'),
                          '\?', '\\?'),
                        '\+', '\\+')"/>
  </function>

  <!-- RFC 3986 symbols -->

  <function name="r:ALPHA" as="xs:string">
    <value-of select="'[a-zA-Z]'"/>
  </function>

  <function name="r:DIGIT" as="xs:string">
    <value-of select="'[0-9]'"/>
  </function>

  <function name="r:HEXDIG" as="xs:string">
    <value-of select="p:or(( r:DIGIT(), p:lit(('A', 'B', 'C', 'D', 'E', 'F'))))"/>
  </function>
  
  <function name="r:hier-part" as="xs:string">
    <value-of select="p:or(( p:seq(( '//', r:authority(), r:path-abempty() )),
                             r:path-absolute(),
                             r:path-rootless(),
                             r:path-empty() ))"/>
  </function>

  <function name="r:absolute-URI" as="xs:string">
    <value-of select="p:seq((r:scheme(), 
                              p:lit(':'), 
                              r:hier-part(), 
                              p:zero-or-one(p:seq((
                                p:lit('?'), 
                                r:query())))))"/>
  </function>
    
  <function name="r:scheme" as="xs:string">
    <value-of 
        select="p:seq(( r:ALPHA(), 
                        p:zero-to-n(
                          p:or(( r:ALPHA(),
                                 r:DIGIT(),
                                 p:lit('+'),
                                 p:lit('-'),
                                 p:lit('.'))))))"/>
  </function>
  
  <function name="r:authority" as="xs:string">
    <value-of select="p:seq(( p:zero-or-one(p:seq(( r:userinfo(), p:lit('@') ))),
                              r:host(),
                              p:zero-or-one(p:seq(( p:lit(':'), r:port() )))))"/>
  </function>
  
  <function name="r:userinfo" as="xs:string">
    <value-of
       select="p:zero-to-n(
                 p:or((
                   r:unreserved(),
                   r:pct-encoded(),
                   r:sub-delims(),
                   p:lit(':'))))"/>
  </function>

  <function name="r:host" as="xs:string">
    <value-of select="p:or(( r:IP-literal(), r:IPv4address(), r:reg-name() ))"/>
  </function>

  <function name="r:port" as="xs:string">
    <value-of select="p:zero-to-n( r:DIGIT() )"/>
  </function>

  <function name="r:IP-literal" as="xs:string">
    <text>Z</text>
  </function>

  <function name="r:IPv4address" as="xs:string">
    <text>Z</text>
  </function>

  <function name="r:reg-name" as="xs:string">
    <text>Z</text>
  </function>

  <function name="r:path-abempty" as="xs:string">
    <value-of select="p:zero-to-n(p:seq((
                        p:lit('/'),
                        r:segment())))"/>
  </function>

  <function name="r:path-absolute" as="xs:string">
    <value-of select="p:seq(( p:lit('/'), 
                              p:zero-or-one(p:seq((
                                r:segment-nz(),
                                p:zero-to-n(p:seq((
                                  '/', r:segment()))))))))"/>
  </function>

  <function name="r:path-rootless" as="xs:string">
    <value-of select="p:seq(( r:segment-nz(), p:zero-to-n(p:seq(( '/', r:segment() )))))"/>
  </function>

  <function name="r:path-empty" as="xs:string">
    <value-of select="''"/>
  </function>

  <function name="r:segment" as="xs:string">
    <value-of select="p:zero-to-n( r:pchar() )"/>
  </function>

  <function name="r:segment-nz" as="xs:string">
    <value-of select="p:one-to-n( r:pchar() )"/>
  </function>

  <function name="r:pchar" as="xs:string">
    <value-of select="p:or(( r:unreserved(), r:pct-encoded(), r:sub-delims(), p:lit((':', '@'))))"/>
  </function>

  <function name="r:query" as="xs:string">
    <value-of select="p:zero-to-n( p:seq(( r:pchar(), p:lit(('/', '?')))))"/>
  </function>

  <function name="r:pct-encoded" as="xs:string">
    <value-of select="p:seq(( p:lit('%'), r:HEXDIG(), r:HEXDIG() ))"/>
  </function>

  <function name="r:unreserved" as="xs:string">
    <value-of select="p:or((
                        r:ALPHA(),
                        r:DIGIT(),
                        p:lit(('-', '.', '_', '~')) ))"/>
  </function>

  <variable name="apos" as="xs:string">&apos;</variable>

  <function name="r:sub-delims" as="xs:string">
    <value-of select="p:or(( p:lit(( '!', '$', '&amp;', $apos, '(', ')', '*', '+', ',', ';', '=' )) ))"/>
  </function>

