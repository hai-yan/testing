<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<script type="text/vbscript">
			Sub OnMouseOverArea()
				On Error Resume Next
								
				window.event.cancelBubble = true

				document.getElementById("curr_sel1").outerText = ""
				document.getElementById("curr_sel2").outerText = ""
				document.getElementById("curr_sel3").outerText = ""
				document.getElementById("curr_sel4").outerText = ""
								
				Set e = window.event.srcElement
				e.insertAdjacentHTML "AfterEnd", "&lt;DIV id=curr_sel1 style=""position:absolute; top:" &amp; e.offsetTop &amp; _
       			";left:" &amp; e.offsetLeft &amp; ";width:" &amp; e.offsetWidth-1 &amp; _
       			";height:1; font-size:0; background-color:#9999CC; z-index:20""&gt;&lt;/DIV&gt;"
       			
       			e.insertAdjacentHTML "AfterEnd", "&lt;DIV id=curr_sel2 style=""position:absolute; top:" &amp; _
       			e.offsetTop + e.offsetHeight-1 &amp; _
       			";left:" &amp; e.offsetLeft &amp; ";width:" &amp; e.offsetWidth-1 &amp; _
       			";height:1; font-size:0; background-color:#9999CC; z-index:20""&gt;&lt;/DIV&gt;"
				
				e.insertAdjacentHTML "AfterEnd", "&lt;DIV id=curr_sel3 style=""position:absolute; top:" &amp; e.offsetTop &amp; _
       			";left:" &amp; e.offsetLeft &amp; ";width:1;height:" &amp; e.offsetHeight &amp; _
       			"; font-size:0; background-color:#9999CC; z-index:20""&gt;&lt;/DIV&gt;"
				
				e.insertAdjacentHTML "AfterEnd", "&lt;DIV id=curr_sel4 style=""position:absolute; top:" &amp; e.offsetTop &amp; _
       			";left:" &amp; e.offsetLeft + e.offsetWidth-1 &amp; ";width:1;height:" &amp; e.offsetHeight &amp; _
       			"; font-size:0; background-color:#9999CC; z-index:20""&gt;&lt;/DIV&gt;"
			End Sub
		
			Sub OnMouseOverImg
				On Error Resume Next
				document.getElementById("curr_sel1").outerText = ""
				document.getElementById("curr_sel2").outerText = ""
				document.getElementById("curr_sel3").outerText = ""
				document.getElementById("curr_sel4").outerText = ""
			End Sub
		</script>
			</head>
			<body>
				<!-- Construct the image - Take it's source from the XML-->
				<img usemap="#imagemap" style="position:absolute; top=0; left=0;" BORDER="0" onmouseover="OnMouseOverImg">
					<xsl:attribute name="src"><xsl:value-of select="/ASXMLStore/Step"/>.png</xsl:attribute>
				</img>
				<!-- Construct the map -->
				<MAP name="imagemap">
					<!-- Build an area map according to the coordinates in the XML -->
					<!-- The GuiStatusBar is special, and needs to be hardcoded into the top layer -->
					<xsl:for-each select="//ASObject[TypeAsNumber=103]">
						<AREA HIDEFOCUS="" shape="rect" href="" onmouseover="OnMouseOverArea">
							<xsl:attribute name="coords"><xsl:value-of select="Left"/>,
					<xsl:value-of select="Top"/>,
					<xsl:value-of select="Left + Width"/>,
					<xsl:value-of select="Top + Height"/></xsl:attribute>
							<xsl:attribute name="id"><xsl:value-of select="Id"/></xsl:attribute>
							<xsl:attribute name="alt">Name = <xsl:value-of select="Name"/>
Type = <xsl:value-of select="Type"/>
Text = <xsl:value-of select="Text"/>
<xsl:if test="/ASXMLStore/ShowIDInALT='Yes'">
ID = <xsl:value-of select="substring-after(substring-after(Id, 'wnd['), '/')"/></xsl:if></xsl:attribute>
						</AREA>
					</xsl:for-each>
					
					<xsl:for-each select="//ASObject/Top">
						<AREA HIDEFOCUS="" shape="rect" href="" onmouseover="OnMouseOverArea">
							<!-- If the control is a GuiTab, put in it's place an area with it's id, but with the TabStrip's info -->
							<xsl:choose>
								<xsl:when test="../TypeAsNumber=91 and ../ASObject">
									
									<xsl:attribute name="coords"><xsl:value-of select="../../Left"/>,<xsl:value-of select="../../Top"/>,
									<xsl:choose>
										<xsl:when test="../../Left + ../../Width > /ASXMLStore/ScreenWidth">
											<xsl:value-of select="/ASXMLStore/ScreenWidth"/>,
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="../../Left + ../../Width"/>,
										</xsl:otherwise>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="../../Top + ../../Height > /ASXMLStore/ScreenHeight">
											<xsl:value-of select="/ASXMLStore/ScreenHeight"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="../../Top + ../../Height"/>
										</xsl:otherwise>
									</xsl:choose>
									</xsl:attribute>
		
			<xsl:attribute name="id"><xsl:value-of select="../Id"/></xsl:attribute>
							<xsl:attribute name="alt">Name = <xsl:value-of select="../../Name"/>
Type = <xsl:value-of select="../Type"/>
Text = <xsl:value-of select="../Text"/>
<xsl:if test="/ASXMLStore/ShowIDInALT='Yes'">
ID = <xsl:value-of select="substring-after(substring-after(../Id, 'wnd['), '/')"/></xsl:if></xsl:attribute>
								
								</xsl:when>
								<xsl:otherwise>
								
									<xsl:attribute name="coords"><xsl:value-of select="../Left"/>,<xsl:value-of select="../Top"/>,
									<xsl:choose>
										<xsl:when test="../Left + ../Width > /ASXMLStore/ScreenWidth">
											<xsl:value-of select="/ASXMLStore/ScreenWidth"/>,
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="../Left + ../Width"/>,
										</xsl:otherwise>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="../Top + ../Height > /ASXMLStore/ScreenHeight">
											<xsl:value-of select="/ASXMLStore/ScreenHeight"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="../Top + ../Height"/>
										</xsl:otherwise>
									</xsl:choose>
									</xsl:attribute>

									<xsl:attribute name="id"><xsl:value-of select="../Id"/></xsl:attribute>
							<xsl:attribute name="alt">Name = <xsl:value-of select="../Name"/>
Type = <xsl:value-of select="../Type"/>
Text = <xsl:value-of select="../Text"/>
<xsl:if test="/ASXMLStore/ShowIDInALT='Yes'">
ID = <xsl:value-of select="substring-after(substring-after(../Id, 'wnd['), '/')"/></xsl:if></xsl:attribute>
																	
								</xsl:otherwise>							
							</xsl:choose>
							
							
							
						</AREA>
						<!--		<DIV>
			<xsl:attribute name="style">
				<xsl:value-of select="concat('position:absolute;font-size:0; top:' , Top - 1, '; left:', Left - 1, ';width:', Right - Left + 2, ';height:1; background-color:red')"/>
			</xsl:attribute>
		</DIV>-->
					</xsl:for-each>
					<!--</DIV> style="position:absolute; top:200; left:200; width:100; height:2; font-size:1; background-color:red; z-index:20"></DIV>-->
				</MAP>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
