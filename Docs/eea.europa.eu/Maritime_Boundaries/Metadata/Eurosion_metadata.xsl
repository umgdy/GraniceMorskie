<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:eur="http://www.eurosion.org/metadataModel/" xmlns:iso19115="http://www.isotc211.org/iso19115/" xmlns:iso19103="http://www.isotc211.org/iso19103/" xmlns:iso19109="http://www.isotc211.org/iso19109/" xmlns:iso4217="http://www.isotc211.org/iso4217/" xmlns:iso639-2="http://www.isotc211.org/iso639-2/" xmlns:gml="http://www.opengis.net/gml" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<html>
			<head>
				<SCRIPT LANGUAGE="JavaScript"><![CDATA[

function test() {
  var ua = window.navigator.userAgent
  var msie = ua.indexOf ( "MSIE " )
  if ( msie == -1 ) 
    document.write("<P>" + "Netscape")
}

      function fix(e) {
        var par = e.parentNode;
        e.id = "";
        e.style.marginLeft = "0.42in";
        var pos = e.innerText.indexOf("\n");
        if (pos > 0) {
          while (pos > 0) {
            var t = e.childNodes(0);
            var n = document.createElement("PRE");
            var s = t.splitText(pos);
            e.insertAdjacentElement("afterEnd", n);
            n.appendChild(s);
            n.style.marginLeft = "0.42in";
            e = n;
            pos = e.innerText.indexOf("\n");
          }
          var count = (par.children.length);
          for (var i = 0; i < count; i++) {
            e = par.children(i);
            if (e.tagName == "PRE") {
              pos = e.innerText.indexOf(">");
              if (pos != 0) {
                n = document.createElement("DD");
                e.insertAdjacentElement("afterEnd", n);
                n.innerText = e.innerText;
                e.removeNode(true);
              }
            }
          }
          if (par.children.tags("PRE").length > 0) {
            count = (par.children.length);
            for (i = 0; i < count; i++) {
              e = par.children(i);
              if (e.tagName == "PRE") {
                e.id = "";
                if (i < (count-1)) {
                  var e2 = par.children(i + 1);
                  if (e2.tagName == "PRE") {
                    e.insertAdjacentText("beforeEnd", e2.innerText+"\n");
                    e2.removeNode(true);
                    count = count-1;
                    i = i-1;
                  }
                }
              }
            }
          }
        }
        else {
          n = document.createElement("DD");
          par.appendChild(n);
          n.innerText = e.innerText;
          e.removeNode(true);
        }
      }

    ]]></SCRIPT>
    				<style>
    				.sum_text {font-family:Verdana; font-size: 10pt; color:#006400;}
    				.sum_title {font-family:Verdana; font-size: 12pt; color:#006400; font-weight: bold;}
     			.common {font-family:Verdana; font-size: 10pt; color:#0000AA;}
     			.specific {font-family:Verdana; font-size: 10pt; color:#006400;}
     			.note {font-size: 8pt;}
     			.toc {font-size: 11pt;}
     			.title_1 {color:#646464; font-size: 12pt;} 
     			.title_2 {color:#646464} 
   				</style>
				<title>Eurosion metadata</title>
				<!-- label -->
			</head>
			<body BGCOLOR="#FFFFFF" ONCONTEXTMENU="return false" class="common">
					<!-- SHOW METADATA SUMMARY -->
					<table COLS="2" WIDTH="100%" BGCOLOR="#CCFFCC" CELLPADDING="11" BORDER="0" CELLSPACING="0">
						<!-- show title -->
						<xsl:if test="/eur:Metadata/eur:Ident/eur:idCitation/iso19115:resTitle | 
						                  /eur:Metadata/eur:DataIdent/eur:idCitation/iso19115:resTitle">
							<tr ALIGN="center" VALIGN="center">
								<td COLSPAN="2" class="sum_title">
											<xsl:value-of select="/eur:Metadata/eur:Ident/eur:idCitation/iso19115:resTitle | /eur:Metadata/eur:DataIdent/eur:idCitation/iso19115:resTitle"/>
								</td>
							</tr>
						</xsl:if>
						<tr ALIGN="left" VALIGN="top">
							<!-- show thumbnail  -->
							<xsl:if test="/eur:Metadata/eur:Ident/eur:graphOver/eur:bgFileName | 
							                  /eur:Metadata/eur:DataIdent/eur:graphOver/eur:bgFileName">
								<td>
									<xsl:choose>
										<!-- would also test for natvform and file name -->
										<xsl:when test="/eur:Metadata[eur:Ident/eur:descKeys[eur:keyType/text() = 'discipline']  | 
													eur:DataIdent/eur:descKeys[eur:keyType/text() = 'discipline'] |
        		 										eur:RefSystem/eur:refSysId/iso19115:identCode/text() | 
        		 										eur:MdCoRefSys/eur:refSysId/iso19115:identCode/text() | 
	 		 										eur:distInfo/eur:distributor/eur:distorCont/iso19115:rpOrgName/text() |
	 		 										eur:distInfo/eur:distributor/eur:distorCont/iso19115:cntOnLineRes/iso19115:linkage/text()]">
											<xsl:attribute name="WIDTH">210</xsl:attribute>
										</xsl:when>
										<xsl:otherwise>
											<xsl:attribute name="ALIGN">center</xsl:attribute>
										</xsl:otherwise>
									</xsl:choose>
									<font COLOR="#006400" FACE="Verdana" SIZE="2">
										<xsl:apply-templates select="/eur:Metadata/eur:Ident/eur:graphOver/eur:bgFileName | /eur:Metadata/eur:DataIdent/eur:graphOver/eur:bgFileName"/>
									</font>
								</td>
							</xsl:if>
							<!-- show format, file name, coordinate system, theme keywords -->
							<xsl:if test="/eur:Metadata[eur:Ident/eur:descKeys[eur:keyType/text() = 'discipline'] | eur:DataIdent/eur:descKeys[eur:keyType/text() = 'discipline'] |													eur:RefSystem/eur:refSysId/iso19115:identCode/text() | eur:MdCoRefSys/eur:refSysId/iso19115:identCode/text() |
										eur:distInfo/eur:distFormat/eur:formatName/text() |
	 									eur:distInfo/eur:distributor/eur:distorCont/iso19115:rpOrgName/text()]">
								<td class="sum_text">
										<xsl:call-template name="summary_tpl">
											<xsl:with-param name="name" select="/eur:Metadata/eur:distInfo/eur:distFormat/eur:formatName"/>
											<xsl:with-param name="label" select="'Data format: '"/>
										</xsl:call-template>
										<xsl:call-template name="summary_tpl">
											<xsl:with-param name="name" select="/eur:Metadata/eur:RefSystem/eur:refSysId/iso19115:identCode | /eur:Metadata/eur:MdCoRefSys/eur:refSysId/iso19115:identCode"/>
											<xsl:with-param name="label" select="'Coordinate system: '"/>
										</xsl:call-template>
										<xsl:call-template name="summary_tpl">
											<xsl:with-param name="name" select="/eur:Metadata/eur:distInfo/eur:distributor/eur:distorCont/iso19115:rpOrgName"/>
											<xsl:with-param name="label" select="'Organisation: '"/>
										</xsl:call-template>
										<xsl:call-template name="summary_keys_tpl">
											<xsl:with-param name="name" select="/eur:Metadata/eur:Ident/eur:descKeys/eur:keyTyp | /eur:Metadata/eur:DataIdent/eur:descKeys/eur:keyTyp"/>
											<xsl:with-param name="value" select="'discipline'"/>
											<xsl:with-param name="label" select="'Theme keywords: '"/>
											<xsl:with-param name="display" select="/eur:Metadata/eur:Ident/eur:descKeys/eur:keyword | /eur:Metadata/eur:DataIdent/eur:descKeys/eur:keyword"/>
										</xsl:call-template>
										<xsl:call-template name="summary_tpl">
											<xsl:with-param name="name" select="/eur:Metadata/eur:distInfo/eur:distributor/eur:distorCont/iso19115:rpCntInfo/iso19115:cntOnlineRes/iso19115:linkage"/>
											<xsl:with-param name="label" select="'On line resource: '"/>
										</xsl:call-template>
								</td>
							</xsl:if>
						</tr>
					</table>
					<!-- build the toc -->
					<A name="Top"/>
					<H4>Eurosion Metadata:</H4>
					<!-- label -->
					<ul class="toc">
						<!-- Metadata Identification -->
						<LI>
							<A HREF="#Metadata_Information">Metadata Information</A>
							<!-- label -->
						</LI>
						<!-- Root node "metadata" will always exist. Only add to TOC if it contains elements
          that describe the metadata. -->
						<xsl:if test="eur:Metadata[eur:Ident | eur:DataIdent | eur:SpatRep | eur:contInfo | eur:dqInfo | 
								 eur:RefSystem | eur:MdCoRefSys | eur:distInfo | eur:appSchInfo]">
							<xsl:call-template name="toc_tpl">
								<xsl:with-param name="name" select="eur:Metadata/eur:Ident | eur:Metadata/eur:DataIdent"/>
								<xsl:with-param name="label" select="'Data identification'"/>
								<xsl:with-param name="label_item" select="'Description'"/>
							</xsl:call-template>
							<xsl:call-template name="toc_tpl">
								<xsl:with-param name="name" select="eur:Metadata/eur:SpatRep"/>
								<xsl:with-param name="label" select="'Representation of spatial information'"/>
								<xsl:with-param name="label_item" select="'Description'"/>
							</xsl:call-template>
							<xsl:call-template name="toc_tpl">
								<xsl:with-param name="name" select="eur:Metadata/eur:contInfo"/>
								<xsl:with-param name="label" select="'Content information'"/>
								<xsl:with-param name="label_item" select="'Description'"/>
							</xsl:call-template>
							<xsl:call-template name="toc_tpl">
								<xsl:with-param name="name" select="eur:Metadata/eur:dqInfo"/>
								<xsl:with-param name="label" select="'Data Quality'"/>
								<xsl:with-param name="label_item" select="'Description'"/>
							</xsl:call-template>
							<xsl:call-template name="toc_tpl">
								<xsl:with-param name="name" select="eur:Metadata/eur:RefSystem | eur:Metadata/eur:MdCoRefSys"/>
								<xsl:with-param name="label" select="'Reference Systeme Information'"/>
								<xsl:with-param name="label_item" select="'Description'"/>
							</xsl:call-template>
							<xsl:call-template name="toc_tpl">
								<xsl:with-param name="name" select="eur:Metadata/eur:distInfo"/>
								<xsl:with-param name="label" select="'Distribution information'"/>
								<xsl:with-param name="label_item" select="'Description'"/>
							</xsl:call-template>
							<xsl:call-template name="toc_tpl">
								<xsl:with-param name="name" select="eur:Metadata/eur:appSchInfo"/>
								<xsl:with-param name="label" select="'Conceptual schema information'"/>
								<xsl:with-param name="label_item" select="'Description'"/>
							</xsl:call-template>
						</xsl:if>
						<!-- Metadata extension -->
						<xsl:if test="eur:Metadata[eur:dcmiExt | eur:giscoExt | 
       							 eur:gelosExt | eur:euroExt]">
							<LI>
								<A HREF="#Metadata_extension">Metadata extension</A>
								<!-- label -->
							</LI>
						</xsl:if>
					</ul>
					<!-- Give legend used in this stylesheet -->
					<BLOCKQUOTE class="note">
							<!-- label -->
      Metadata elements shown with blue text are defined in the
      International Organization for Standardization's (ISO) document 19115
      <I>Geographic Information - Metadata.</I>
      Elements shown with <FONT color="#2E8B00">green</FONT>
      text are defined by the Eurosion project and will be documented as extentions to the
      ISO 19115. Elements shown with a green asterisk (<FONT color="#2E8B00">*</FONT>) 
      will be automatically updated by ArcCatalog.
					</BLOCKQUOTE>
					<!-- PUT METADATA CONTENT ON THE HTML PAGE  -->
					<!-- Metadata Information -->
					<!-- Root node "metadata" will always exist. Only apply template if it contains elements
          that describe the metadata. -->
					<xsl:if test="eur:Metadata[eur:mdFileID | eur:mdLang | eur:mdChar | eur:mdParentID | eur:mdHrLv | 
        							   eur:mdHrLvName | eur:mdContact | eur:mdDateSt | eur:mdStanName | eur:mdStanVer | 
        							   eur:mdMaint | eur:mdConst]">
						<xsl:apply-templates select="eur:Metadata"/>
					</xsl:if>
					<!-- Resource Identification -->
					<xsl:apply-templates select="/eur:Metadata/eur:Ident | /eur:Metadata/eur:DataIdent"/>
					<!-- Spatial Representation Information -->
					<xsl:apply-templates select="/eur:Metadata/eur:SpatRep"/>
					<!-- Content Information -->
					<xsl:apply-templates select="/eur:Metadata/eur:contInfo"/>
					<!-- Data Quality Information -->
					<xsl:apply-templates select="/eur:Metadata/eur:dqInfo"/>
					<!-- Reference System Information -->
					<xsl:apply-templates select="/eur:Metadata/eur:RefSystem | /eur:Metadata/eur:MdCoRefSys"/>
					<!-- Distribution Information -->
					<xsl:apply-templates select="/eur:Metadata/eur:distInfo"/>
					<!-- Schema Information -->
					<xsl:apply-templates select="/eur:Metadata/eur:appSchInfo"/>
					<xsl:if test="eur:Metadata[eur:dcmiExt | eur:giscoExt | 
       							 eur:gelosExt | eur:euroExt]">
						<xsl:call-template name="extension_tpl"/>
					</xsl:if>
			</body>
		</html>
	</xsl:template>
	<!-- Thumbnail -->
	<xsl:template match="/eur:Metadata/eur:Ident/eur:graphOver/eur:bgFileName | /eur:Metadata/eur:DataIdent/eur:graphOver/eur:bgFileName">
		<img ID="thumbnail" ALIGN="absmiddle" STYLE="width:217; border:'2 outset #FFFFFF'; position:relative">
			<xsl:attribute name="SRC"><xsl:value-of select="."/></xsl:attribute>
		</img>
		<br/>
		<br/>
	</xsl:template>
	<!-- Generic templates -->
	<xsl:template name="summary_tpl">
		<xsl:param name="name"/>
		<xsl:param name="label"/>
		<xsl:if test="$name">
			<dt>
				<b>
					<xsl:value-of select="$label"/>
				</b>
				<xsl:value-of select="$name"/>
			</dt>
			<br/>
			<br/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="summary_keys_tpl">
		<xsl:param name="name"/>
		<xsl:param name="value"/>
		<xsl:param name="label"/>
		<xsl:param name="display"/>
		<xsl:if test="$name[text() = $value]">
			<dt>
				<b>
					<xsl:value-of select="$label"/>
				</b>
				<xsl:for-each select="$name[text() = $value]">
					<xsl:for-each select="$display">
						<xsl:value-of select="."/>
						<xsl:text> </xsl:text>
					</xsl:for-each>
					<xsl:text> </xsl:text>
				</xsl:for-each>
			</dt>
			<br/>
			<br/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="toc_tpl">
		<xsl:param name="name"/>
		<xsl:param name="label"/>
		<xsl:param name="label_item"/>
		<xsl:if test="count($name) = 1">
			<LI>
				<A>
					<xsl:attribute name="HREF">#<xsl:value-of select="generate-id($name)"/></xsl:attribute>
					<xsl:value-of select="$label"/>
				</A>
			</LI>
		</xsl:if>
		<xsl:if test="count($name) &gt; 1">
			<LI>
				<xsl:value-of select="$label"/>
			</LI>
			<xsl:for-each select="$name">
				<LI STYLE="margin-left:0.5in">
					<A>
						<xsl:attribute name="HREF">#<xsl:value-of select="generate-id()"/></xsl:attribute>
						<xsl:value-of select="$label_item"/>
						<xsl:text> : </xsl:text>
						<xsl:number value="position()"/>
					</A>
				</LI>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template name="display_select_tpl">
		<xsl:param name="name"/>
		<xsl:param name="label"/>
		<xsl:for-each select="$name">
			<DT>
				<xsl:if test="$name[@Sync = 'TRUE']">
					<FONT color="#2E8B00">*</FONT>
				</xsl:if>
					<B>
						<xsl:value-of select="$label"/>
					</B>
				<xsl:apply-templates select="$name"/>
			</DT>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="display_value_tpl">
		<xsl:param name="name"/>
		<xsl:param name="label"/>
		<xsl:for-each select="$name">
			<DT>
				<xsl:if test="$name[@Sync = 'TRUE']">
					<FONT color="#2E8B00">*</FONT>
				</xsl:if>
					<B>
						<xsl:value-of select="$label"/>
					</B>
				<xsl:value-of select="$name"/>
			</DT>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="simple_select_tpl">
		<xsl:param name="name"/>
		<xsl:param name="label"/>
		<xsl:for-each select="$name">
			<DT>
					<B>
						<xsl:value-of select="$label"/>
					</B>
				<xsl:apply-templates select="$name"/>
			</DT>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="simple_value_tpl">
		<xsl:param name="name"/>
		<xsl:param name="label"/>
		<xsl:for-each select="$name">
			<DT>
					<B>
						<xsl:value-of select="$label"/>
					</B>
				<xsl:value-of select="$name"/>
			</DT>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="simple_mult_tpl">
		<xsl:param name="name"/>
		<xsl:param name="label"/>
		<xsl:if test="$name[text()]">
			<DT>
					<B>
						<xsl:value-of select="$label"/>
					</B>
				<xsl:for-each select="$name[text()]">
					<xsl:value-of select="."/>
					<xsl:if test="position() != last()">, </xsl:if>
				</xsl:for-each>
			</DT>
			<BR/>
			<BR/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="simple_fix_tpl">
		<xsl:param name="name"/>
		<xsl:param name="label"/>
		<xsl:for-each select="$name">
			<DT>
					<B>
						<xsl:value-of select="$label"/>
					</B>
			</DT>
			<PRE ID="original">
				<xsl:value-of select="."/>
			</PRE>
			<SCRIPT>fix(original)</SCRIPT>
			<BR/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="simple_boolean_tpl">
		<xsl:param name="name"/>
		<xsl:param name="label"/>
		<xsl:for-each select="$name">
			<DT>
					<B>
						<xsl:value-of select="$label"/>
					</B>
				<xsl:choose>
					<xsl:when test=". = 'true'">Yes</xsl:when>
					<xsl:when test=". = 'false'">No</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="."/>
					</xsl:otherwise>
				</xsl:choose>
			</DT>
		</xsl:for-each>
	</xsl:template>
	<!-- Templates for matching the metadata description -->
	<xsl:template match="eur:Metadata">
		<A name="Metadata_Information">
			<HR/>
		</A>
		<DL>
			<DT class="title_1">
					<B>Metadata Information</B>
					<!-- label -->
			</DT>
			<BR/>
			<BR/>
			<DL class="common">
				<DD>
					<xsl:call-template name="display_select_tpl">
						<xsl:with-param name="name" select="eur:mdLang/iso639-2:isoCode"/>
						<xsl:with-param name="label" select="'Metadata language: '"/>
					</xsl:call-template>
					<xsl:call-template name="display_select_tpl">
						<xsl:with-param name="name" select="eur:mdChar"/>
						<xsl:with-param name="label" select="'Metadata character set: '"/>
					</xsl:call-template>
					<xsl:if test="eur:mdLang | eur:mdChar">
						<BR/>
						<BR/>
					</xsl:if>
					<xsl:call-template name="display_value_tpl">
						<xsl:with-param name="name" select="eur:mdDateSt"/>
						<xsl:with-param name="label" select="'Last update: '"/>
					</xsl:call-template>
					<xsl:apply-templates select="eur:mdMaint"/>
					<xsl:if test="(eur:mdDateSt) or (eur:mdMaint)">
						<BR/>
					</xsl:if>
					<xsl:apply-templates select="eur:mdContact"/>
					<xsl:call-template name="display_select_tpl">
						<xsl:with-param name="name" select="eur:mdHrLv"/>
						<xsl:with-param name="label" select="'Scope of the data described by the metadata: '"/>
					</xsl:call-template>
					<xsl:call-template name="display_value_tpl">
						<xsl:with-param name="name" select="eur:mdHrLvName"/>
						<xsl:with-param name="label" select="'Scope name: '"/>
					</xsl:call-template>
					<xsl:if test="eur:mdHrLv | eur:HrLvName">
						<BR/>
						<BR/>
					</xsl:if>
					<xsl:call-template name="display_value_tpl">
						<xsl:with-param name="name" select="eur:mdStanName"/>
						<xsl:with-param name="label" select="'Name of the metadata standard used: '"/>
					</xsl:call-template>
					<xsl:call-template name="display_value_tpl">
						<xsl:with-param name="name" select="eur:mdStanVer"/>
						<xsl:with-param name="label" select="'Version of the metadata standard: '"/>
					</xsl:call-template>
					<xsl:if test="eur:mdStanName | eur:mdStanVer">
						<BR/>
						<BR/>
					</xsl:if>
					<xsl:call-template name="display_value_tpl">
						<xsl:with-param name="name" select="eur:mdFileID"/>
						<xsl:with-param name="label" select="'Metadata identifier: '"/>
					</xsl:call-template>
					<xsl:call-template name="display_value_tpl">
						<xsl:with-param name="name" select="eur:mdParentID"/>
						<xsl:with-param name="label" select="'Parent identifier: '"/>
					</xsl:call-template>
					<xsl:if test="eur:mdFileID | eur:mdParentID">
						<BR/>
						<BR/>
					</xsl:if>
				</DD>
			</DL>
		</DL>
		<A HREF="#Top">Back to Top</A>
	</xsl:template>
	<!-- Maintenance Information (B.2.5 MD_MaintenanceInformation - line142) -->
	<xsl:template match="eur:mdMaint | eur:resMaint">
		<DD>
			<xsl:choose>
				<xsl:when test="local-name() = 'resMaint'">
					<DT class="title_2">
							<B>Resource maintenance:</B>
							<!-- label -->
					</DT>
					<!-- label -->
				</xsl:when>
				<xsl:otherwise>
					<DT class="title_2">
							<B>Maintenance:</B>
							<!-- label -->
					</DT>
					<!-- label -->
				</xsl:otherwise>
			</xsl:choose>
			<DD>
				<DL>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:dateNext"/>
						<xsl:with-param name="label" select="'Date of next update: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_select_tpl">
						<xsl:with-param name="name" select="eur:maintFreq"/>
						<xsl:with-param name="label" select="'Update frequency: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:maintNote"/>
						<xsl:with-param name="label" select="'Other maintenance requirements: '"/>
					</xsl:call-template>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<!-- Responsible Party Information (B.3.2 CI_ResponsibleParty - line374) -->
	<xsl:template match="eur:mdContact | eur:idPoC | eur:usrCntInfo | eur:stepProc | eur:distorCont | 
      						   iso19115:citRespParty | eur:extEleSrc | eur:gelosRecordSource | eur:etccdsRecordSource">
		<DD>
			<dt class="title_2">
					<xsl:choose>
						<xsl:when test="local-name() = 'mdContact'">
							<B>Metadata contact:</B>
							<!-- label -->
						</xsl:when>
						<xsl:when test="local-name() = 'idPoC'">
							<B>Point of contact:</B>
							<!-- label -->
						</xsl:when>
						<xsl:when test="local-name() = 'usrCntInfo'">
							<B>Party using the resource:</B>
							<!-- label -->
						</xsl:when>
						<xsl:when test="local-name() = 'stepProc'">
							<B>Process contact:</B>
							<!-- label -->
						</xsl:when>
						<xsl:when test="local-name() = 'distorCont'">
							<B>Contact information:</B>
							<!-- label -->
						</xsl:when>
						<xsl:when test="local-name() = 'citRespParty'">
							<B>Party responsible for the resource:</B>
							<!-- label -->
						</xsl:when>
						<xsl:when test="local-name() = 'extEleSrc'">
							<B>Extension source:</B>
							<!-- label -->
						</xsl:when>
						<xsl:when test="local-name() = 'gelosRecordSource'">
							<B>gelos Record Source:</B>
							<!-- label -->
						</xsl:when>
						<xsl:when test="local-name() = 'etccdsRecordSource'">
							<B>etc cds Record Source:</B>
							<!-- label -->
						</xsl:when>
						<xsl:otherwise>
							<B>Contact information:</B>
							<!-- label -->
						</xsl:otherwise>
					</xsl:choose>
			</dt>
			<DD>
				<DL>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="iso19115:rpIndName"/>
						<xsl:with-param name="label" select="'Individual name: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="iso19115:rpOrgName"/>
						<xsl:with-param name="label" select="'Organization name: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="iso19115:rpPosName"/>
						<xsl:with-param name="label" select="'Contact position: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_select_tpl">
						<xsl:with-param name="name" select="iso19115:role"/>
						<xsl:with-param name="label" select="'Contact role: '"/>
					</xsl:call-template>
					<xsl:if test="iso19115:rpIndName | iso19115:rpOrgName | iso19115:rpPosName | iso19115:role">
						<BR/>
						<BR/>
					</xsl:if>
					<xsl:apply-templates select="iso19115:rpCntInfo"/>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<!-- Contact Information (B.3.2.2 CI_Contact - line387) -->
	<xsl:template match="iso19115:rpCntInfo">
		<DD>
			<DT class="title_2">
					<B>Contact information:</B>
					<!-- label -->
			</DT>
			<DD>
				<DL>
					<xsl:apply-templates select="iso19115:cntPhone"/>
					<xsl:apply-templates select="iso19115:cntAddress"/>
					<xsl:apply-templates select="iso19115:cntOnlineRes"/>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<!-- Telephone Information (B.3.2.6 CI_Telephone - line407) -->
	<xsl:template match="iso19115:cntPhone">
		<DD>
			<DT class="title_2">
					<B>Phone:</B>
					<!-- label -->
			</DT>
			<DD>
				<DL>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="iso19115:voiceNum"/>
						<xsl:with-param name="label" select="'Voice: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="iso19115:faxNum"/>
						<xsl:with-param name="label" select="'Fax: '"/>
					</xsl:call-template>
				</DL>
			</DD>
		</DD>
		<BR/>
	</xsl:template>
	<!-- Address Information (B.3.2.1 CI_Address - line380) -->
	<xsl:template match="iso19115:cntAddress">
		<DD>
			<DT class="title_2">
					<B>Address:</B>
					<!-- label -->
			</DT>
			<DD>
				<DL>
					<xsl:call-template name="simple_fix_tpl">
						<xsl:with-param name="name" select="iso19115:delPoint"/>
						<xsl:with-param name="label" select="'Delivery point: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="iso19115:city"/>
						<xsl:with-param name="label" select="'City: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="iso19115:adminArea"/>
						<xsl:with-param name="label" select="'Administrative area: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="iso19115:postCode"/>
						<xsl:with-param name="label" select="'Postal code: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="iso19115:country"/>
						<xsl:with-param name="label" select="'Country: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="iso19115:eMailAdd"/>
						<xsl:with-param name="label" select="'E-mail address: '"/>
					</xsl:call-template>
				</DL>
			</DD>
		</DD>
		<BR/>
	</xsl:template>
	<!-- Online Resource Information (B.3.2.4 CI_OnLineResource - line396) -->
	<xsl:template match="iso19115:cntOnlineRes | eur:onLineSrc | eur:extOnRes">
		<DD>
			<xsl:choose>
				<xsl:when test="local-name() = 'onLineSrc'">
					<DT class="title_2">
							<B>Online source:</B>
							<!-- label -->
					</DT>
				</xsl:when>
				<xsl:when test="local-name() = 'extOnRes'">
					<DT class="title_2">
							<B>Extension online resource:</B>
							<!-- label -->
					</DT>
				</xsl:when>
				<xsl:otherwise>
					<DT class="title_2">
							<B>Online resource:</B>
							<!-- label -->
					</DT>
				</xsl:otherwise>
			</xsl:choose>
			<DD>
				<DL>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="iso19115:orName"/>
						<xsl:with-param name="label" select="'Name of resource: '"/>
					</xsl:call-template>
					<xsl:call-template name="display_value_tpl">
						<xsl:with-param name="name" select="iso19115:linkage"/>
						<xsl:with-param name="label" select="'Online location (URL): '"/>
					</xsl:call-template>
					<xsl:call-template name="display_value_tpl">
						<xsl:with-param name="name" select="iso19115:protocol"/>
						<xsl:with-param name="label" select="'Connection protocol: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_select_tpl">
						<xsl:with-param name="name" select="iso19115:orFunct"/>
						<xsl:with-param name="label" select="'Function performed: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="iso19115:orDesc"/>
						<xsl:with-param name="label" select="'Description: '"/>
					</xsl:call-template>
				</DL>
			</DD>
		</DD>
		<BR/>
	</xsl:template>
	<!-- RESOURCE IDENTIFICATION -->
	<!-- Resource Identification Information (B.2.2 MD_Identification - line23, including MD_DataIdentification - line36) -->
	<xsl:template match="eur:Ident | eur:DataIdent">
		<A>
			<xsl:attribute name="NAME"><xsl:value-of select="generate-id()"/></xsl:attribute>
			<HR/>
		</A>
		<DL>
			<xsl:if test="count(/eur:Metadata/eur:Ident | /eur:Metadata/eur:DataIdent) = 1">
				<DT class="title_1">
						<B>Resource Identification Information:</B>
				</DT>
			</xsl:if>
			<xsl:if test="count(/eur:Metadata/eur:Ident | /eur:Metadata/eur:DataIdent) &gt; 1">
				<DT class="title_1">
						<B>
        Resource Identification Information - Resource <xsl:number value="position()"/>:
      					</B>
				</DT>
			</xsl:if>
			<BR/>
			<BR/>
			<DL class="common">
				<DD>
					<xsl:apply-templates select="eur:idCitation"/>
					<xsl:call-template name="simple_mult_tpl">
						<xsl:with-param name="name" select="eur:tpCat"/>
						<xsl:with-param name="label" select="'Themes or categories of the resource: '"/>
					</xsl:call-template>
					<xsl:apply-templates select="eur:descKeys"/>
					<xsl:call-template name="simple_fix_tpl">
						<xsl:with-param name="name" select="eur:idAbs"/>
						<xsl:with-param name="label" select="'Abstract: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_fix_tpl">
						<xsl:with-param name="name" select="eur:idPurp"/>
						<xsl:with-param name="label" select="'Purpose: '"/>
					</xsl:call-template>
					<xsl:apply-templates select="graphOver"/>
					<xsl:call-template name="simple_select_tpl">
						<xsl:with-param name="name" select="eur:dataLang/iso639-2:isoCode"/>
						<xsl:with-param name="label" select="'Dataset language: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_select_tpl">
						<xsl:with-param name="name" select="eur:dataChar"/>
						<xsl:with-param name="label" select="'Dataset character set: '"/>
					</xsl:call-template>
					<xsl:if test="eur:dataLang | eur:dataChar">
						<BR/>
						<BR/>
					</xsl:if>
					<xsl:call-template name="simple_select_tpl">
						<xsl:with-param name="name" select="eur:idStatus"/>
						<xsl:with-param name="label" select="'Status: '"/>
					</xsl:call-template>
					<br/><br/>
					<xsl:apply-templates select="eur:resMaint"/>
						<BR/>
					<br/>
					<xsl:apply-templates select="eur:Consts | eur:LegConsts"/>
					<br/>
					<xsl:apply-templates select="eur:idSpecUse"/>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:spatRpType"/>
						<xsl:with-param name="label" select="'Spatial representation type: '"/>
					</xsl:call-template>
					<xsl:apply-templates select="dsFormat"/>
					<xsl:if test="eur:spatRpType and not (dsFormat)">
						<BR/>
						<BR/>
					</xsl:if>
					<xsl:call-template name="display_value_tpl">
						<xsl:with-param name="name" select="eur:envirDesc"/>
						<xsl:with-param name="label" select="'Processing environment: '"/>
					</xsl:call-template>
					<xsl:apply-templates select="eur:dataScale"/>
					<xsl:apply-templates select="eur:geoBox"/>
					<xsl:apply-templates select="eur:geoDesc"/>
					<xsl:apply-templates select="eur:dataExt"/>
					<xsl:call-template name="simple_fix_tpl">
						<xsl:with-param name="name" select="eur:suppInfo"/>
						<xsl:with-param name="label" select="'Supplemental information: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_fix_tpl">
						<xsl:with-param name="name" select="eur:idCredit"/>
						<xsl:with-param name="label" select="'Credits: '"/>
					</xsl:call-template>
					<xsl:apply-templates select="eur:idPoC"/>
				</DD>
			</DL>
		</DL>
		<A HREF="#Top">Back to Top</A>
	</xsl:template>
	<!-- Citation Information (B.3.2 CI_Citation - line359) -->
	<xsl:template match="eur:idCitation | eur:thesaName | iso19115:identAuth | eur:srcCitatn | iso19115:evalProc | 
      eur:conSpec | eur:paraCit | eur:portCatCit | eur:catCitation | eur:asName | eur:relation">
		<DD>
			<DT class="title_2">
					<xsl:choose>
						<xsl:when test="local-name() = 'idCitation'">
							<B>Citation:</B>
							<!-- label -->
						</xsl:when>
						<xsl:when test="local-name() = 'thesaName'">
							<B>Thesaurus name:</B>
							<!-- label -->
						</xsl:when>
						<xsl:when test="local-name() = 'identAuth'">
							<B>Reference that defines the value:</B>
							<!-- label -->
						</xsl:when>
						<xsl:when test="local-name() = 'srcCitatn'">
							<B>Source citation:</B>
							<!-- label -->
						</xsl:when>
						<xsl:when test="local-name() = 'evalProc'">
							<B>Description of evaluation procedure:</B>
							<!-- label -->
						</xsl:when>
						<xsl:when test="local-name() = 'conSpec'">
							<B>Description of conformance requirements:</B>
							<!-- label -->
						</xsl:when>
						<xsl:when test="local-name() = 'paraCit'">
							<B>Georeferencing parameters citation:</B>
							<!-- label -->
						</xsl:when>
						<xsl:when test="local-name() = 'catCitation'">
							<B>Feature catalogue citation:</B>
							<!-- label -->
						</xsl:when>
						<xsl:when test="local-name() = 'asName'">
							<B>Application schema name:</B>
							<!-- label -->
						</xsl:when>
						<xsl:when test="local-name() = 'relation'">
							<B>Relation: </B>
							<!-- label -->
						</xsl:when>
						<xsl:otherwise>
							<B>Citation:</B>
							<!-- label -->
						</xsl:otherwise>
					</xsl:choose>
			</DT>
			<DD>
				<DL>
					<xsl:call-template name="display_value_tpl">
						<xsl:with-param name="name" select="iso19115:resTitle"/>
						<xsl:with-param name="label" select="'Title: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_mult_tpl">
						<xsl:with-param name="name" select="iso19115:resAltTitle"/>
						<xsl:with-param name="label" select="'Alternate titles: '"/>
					</xsl:call-template>
					<xsl:if test="not(iso19115:resAltTitle)">
						<BR/>
						<BR/>
					</xsl:if>
					<xsl:apply-templates select="iso19115:resRefDate"/>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="iso19115:resEd"/>
						<xsl:with-param name="label" select="'Edition: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="iso19115:resEdDate"/>
						<xsl:with-param name="label" select="'Edition date: '"/>
					</xsl:call-template>
					<xsl:call-template name="display_select_tpl">
						<xsl:with-param name="name" select="iso19115:presForm"/>
						<xsl:with-param name="label" select="'Presentation format: '"/>
					</xsl:call-template>
					<xsl:if test="iso19115:resEd | iso19115:resEdDate | iso19115:presForm">
						<BR/>
						<BR/>
					</xsl:if>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="iso19115:isbn"/>
						<xsl:with-param name="label" select="'ISBN: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="iso19115:issn"/>
						<xsl:with-param name="label" select="'ISSN: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="iso19115:citId"/>
						<xsl:with-param name="label" select="'Unique resource identifier: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="iso19115:citIdType"/>
						<xsl:with-param name="label" select="'Reference of identifier: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="iso19115:identifierType"/>
						<xsl:with-param name="label" select="'Type of identifier: '"/>
					</xsl:call-template>
					<xsl:if test="iso19115:isbn | iso19115:issn | iso19115:citId | iso19115:citIdType | iso19115:identifierType">
						<BR/>
						<BR/>
					</xsl:if>
					<xsl:apply-templates select="iso19115:citRespParty"/>
					<BR/>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<!-- Date Information (B.3.2.3 CI_Date) -->
	<xsl:template match="iso19115:resRefDate">
		<DD>
			<DT class="title_2">
					<B>Reference date:</B>
					<!-- label -->
			</DT>
			<DD>
				<DL>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="iso19115:refDate"/>
						<xsl:with-param name="label" select="'Date: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_select_tpl">
						<xsl:with-param name="name" select="iso19115:refDateType"/>
						<xsl:with-param name="label" select="'Type of date: '"/>
					</xsl:call-template>
				</DL>
			</DD>
		</DD>
		<BR/>
	</xsl:template>
	<!-- Keyword Information (B.2.2.2 MD_Keywords - line52)-->
	<xsl:template match="eur:descKeys | eur:place | eur:habitatType | eur:issue">
		<DD>
			<xsl:choose>
				<xsl:when test="eur:keyTyp = 'discipline'">
					<DT class="title_2">
							<B>Discipline keywords:</B>
							<!--label -->
					</DT>
					<!-- label -->
				</xsl:when>
				<xsl:when test="eur:keyTyp = 'place'">
					<DT class="title_2">
							<B>Place keywords:</B>
					</DT>
					<!-- label -->
				</xsl:when>
				<xsl:when test="eur:keyTyp = 'stratum'">
					<DT class="title_2">
							<B>Stratum keywords:</B>
					</DT>
					<!-- label -->
				</xsl:when>
				<xsl:when test="eur:keyTyp = 'temporal'">
					<DT class="title_2">
							<B>Temporal keywords:</B>
					</DT>
					<!-- label -->
				</xsl:when>
				<xsl:when test="eur:keyTyp = 'theme'">
					<DT class="title_2">
							<B>Theme keywords:</B>
					</DT>
					<!-- label -->
				</xsl:when>
				<xsl:otherwise>
					<DT class="title_2">
							<B>Descriptive keywords:</B>
					</DT>
					<!-- label -->
				</xsl:otherwise>
			</xsl:choose>
			<DD>
				<DL>
					<xsl:if test="(eur:keyTyp != 'discipline') and (eur:keyTyp != 'place') and (eur:keyTyp != 'stratum') and (eur:keyTyp != 'temporal') and (eur:keyTyp != 'theme')">
						<DT>
								<B>Type of keywords:</B>
							<xsl:value-of select="eur:keyTyp"/>
						</DT>
						<BR/>
						<BR/>
					</xsl:if>
					<xsl:call-template name="simple_mult_tpl">
						<xsl:with-param name="name" select="eur:keyword"/>
						<xsl:with-param name="label" select="'Keywords: '"/>
					</xsl:call-template>
					<font class="specific">
					<xsl:call-template name="simple_mult_tpl">
						<xsl:with-param name="name" select="eur:keyID"/>
						<xsl:with-param name="label" select="'Keyword identifiers: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_mult_tpl">
						<xsl:with-param name="name" select="eur:keyDesc"/>
						<xsl:with-param name="label" select="'Keyword descriptions: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:thesaId"/>
						<xsl:with-param name="label" select="'Identifier of thesaurus: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:thesaLan"/>
						<xsl:with-param name="label" select="'Language of thesaurus: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:lanId"/>
						<xsl:with-param name="label" select="'Identifier of language: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:thesaDesc"/>
						<xsl:with-param name="label" select="'Description of thesaurus: '"/>
					</xsl:call-template>
					</font>
					<xsl:if test="eur:thesaName"><br/><br/></xsl:if>
					<xsl:apply-templates select="eur:thesaName"/>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<!-- Usage Information (B.2.2.5 MD_Usage - line62) -->
	<xsl:template match="eur:idSpecUse">
		<DD>
			<DT class="title_2">
					<B>How the resource is used:</B>
			</DT>
			<!-- label -->
			<DD>
				<DL>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:specUsage"/>
						<xsl:with-param name="label" select="'Description: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:usrDetLim"/>
						<xsl:with-param name="label" select="'How the resource must not be used: '"/>
					</xsl:call-template>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<!-- Constraints Information (B.2.3 MD_Constraints - line67) -->
	<xsl:template match="eur:Consts | eur:LegConsts">
		<DD>
			<DT class="title_2">
					<B>Restrictions on the access and use:</B>
			</DT>
			<!-- label -->
			<DD>
				<DL>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:useLimit"/>
						<xsl:with-param name="label" select="'Limitation affecting the fitness for use: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:accessConsts"/>
						<xsl:with-param name="label" select="'Access constraints: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:useConsts"/>
						<xsl:with-param name="label" select="'Use constraints: '"/>
					</xsl:call-template>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<!-- Format Information (B.2.10.3 MD_Format - line284) -->
	<xsl:template match="eur:dsFormat | eur:distorFormat | eur:distFormat">
		<DD>
			<DT class="title_2">
					<xsl:choose>
						<xsl:when test="local-name() = 'dsFormat'">
							<B>Resource format:</B>
							<!-- label -->
						</xsl:when>
						<xsl:when test="local-name() = 'distorFormat'">
							<B>Available format:</B>
							<!-- label -->
						</xsl:when>
						<xsl:when test="local-name() = 'distFormat'">
							<B>Distribution format:</B>
							<!-- label -->
						</xsl:when>
						<xsl:otherwise>
							<B>Format:</B>
							<!-- label -->
						</xsl:otherwise>
					</xsl:choose>
			</DT>
			<DD>
				<DL>
					<xsl:call-template name="display_value_tpl">
						<xsl:with-param name="name" select="eur:formatName"/>
						<xsl:with-param name="label" select="'Format name: '"/>
					</xsl:call-template>
					<xsl:call-template name="display_value_tpl">
						<xsl:with-param name="name" select="eur:formatVer"/>
						<xsl:with-param name="label" select="'Format version: '"/>
					</xsl:call-template>
					<xsl:call-template name="display_value_tpl">
						<xsl:with-param name="name" select="eur:fileDecmTech"/>
						<xsl:with-param name="label" select="'File decompression technique: '"/>
					</xsl:call-template>
					<xsl:if test="eur:formatName | eur:formatVer | eur:fileDecmTech">
						<BR/>
						<BR/>
					</xsl:if>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<!-- Resolution Information (B.2.2.4 MD_Resolution - line59) -->
	<xsl:template match="eur:dataScale | eur:srcScale">
		<DD>
			<xsl:choose>
				<xsl:when test="local-name() = 'dataScale'">
					<DT class="title_2">
							<B>Spatial resolution:</B>
							<!-- label -->
					</DT>
					<!-- label -->
				</xsl:when>
				<xsl:when test="local-name() = 'srcScale'">
					<DT class="title_2">
							<B>Resolution of the source data:</B>
							<!-- label -->
					</DT>
					<!-- label -->
				</xsl:when>
				<xsl:otherwise>
					<DT class="title_2">
							<B>Resolution:</B>
							<!-- label -->
					</DT>
					<!-- label -->
				</xsl:otherwise>
			</xsl:choose>
			<DD>
				<DL>
					<xsl:apply-templates select="eur:equScale"/>
					<xsl:for-each select="eur:scaleDist">
						<DT class="title_2">
								<B>Ground sample distance:</B>
						</DT>
						<!-- label -->
						<DD>
							<DL>
								<!-- value will be shown regardless of the subelement Integer, Real, or Decimal -->
								<xsl:call-template name="simple_value_tpl">
									<xsl:with-param name="name" select="iso19115:value"/>
									<xsl:with-param name="label" select="'Precision of spatial data: '"/>
								</xsl:call-template>
								<xsl:apply-templates select="eur:uom"/>
								<xsl:if test="iso19115:value and not (eur:uom)">
									<BR/>
									<BR/>
								</xsl:if>
							</DL>
						</DD>
					</xsl:for-each>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<!-- Representative Fraction Information (B.2.2.3 MD_RepresentativeFraction - line56) -->
	<xsl:template match="eur:equScale">
		<DT class="title_2">
				<B>Dataset's scale:</B>
		</DT>
		<DD>
			<DL>
				<xsl:call-template name="simple_value_tpl">
					<xsl:with-param name="name" select="eur:rfDenom"/>
					<xsl:with-param name="label" select="'Scale denominator: '"/>
				</xsl:call-template>
				<xsl:call-template name="simple_value_tpl">
					<xsl:with-param name="name" select="eur:scale"/>
					<xsl:with-param name="label" select="'Fraction is derived from scale: '"/>
				</xsl:call-template>
			</DL>
		</DD>
		<BR/>
	</xsl:template>
	<!-- Units of Measurement Types (from ISO 19103 information in 19115 DTD) -->
	<xsl:template match="eur:uom | eur:_UnitOfMeasure | eur:UomLength | eur:UomScale | eur:UomTime | eur:UomArea | eur:UomVolume | eur:UomAngle | eur:UomVelocity">
		<DT class="title_2">
				<B>Units of measure: </B>
		</DT>
		<DD>
			<DL>
				<xsl:call-template name="simple_value_tpl">
					<xsl:with-param name="name" select="eur:uomName"/>
					<xsl:with-param name="label" select="'Units name: '"/>
				</xsl:call-template>
				<xsl:call-template name="simple_value_tpl">
					<xsl:with-param name="name" select="eur:uomSymbol"/>
					<xsl:with-param name="label" select="'Units symbol: '"/>
				</xsl:call-template>
			</DL>
		</DD>
		<BR/>
	</xsl:template>
	<!-- Bounding Box Information (B.3.1.1 EX_GeographicBoundingBox - line343) -->
	<xsl:template match="eur:geoBox | eur:GeoExtent[@xsi:type = 'GeoBndBoxType']">
		<DD>
			<xsl:choose>
				<xsl:when test="local-name() = 'geoBox'">
					<DT class="title_2">
							<B>Resource's bounding rectangle:</B>
							<!-- label -->
					</DT>
				</xsl:when>
				<xsl:otherwise>
					<DT class="title_2">
							<B>Bounding rectangle:</B>
							<!-- label -->
					</DT>
				</xsl:otherwise>
			</xsl:choose>
			<DD>
				<DL>
					<xsl:call-template name="display_value_tpl">
						<xsl:with-param name="name" select="eur:westBL"/>
						<xsl:with-param name="label" select="'West longitude: '"/>
					</xsl:call-template>
					<xsl:call-template name="display_value_tpl">
						<xsl:with-param name="name" select="eur:eastBL"/>
						<xsl:with-param name="label" select="'East longitude: '"/>
					</xsl:call-template>
					<xsl:call-template name="display_value_tpl">
						<xsl:with-param name="name" select="eur:northBL"/>
						<xsl:with-param name="label" select="'North latitude: '"/>
					</xsl:call-template>
					<xsl:call-template name="display_value_tpl">
						<xsl:with-param name="name" select="eur:southBL"/>
						<xsl:with-param name="label" select="'South latitude: '"/>
					</xsl:call-template>
					<xsl:call-template name="display_value_tpl">
						<xsl:with-param name="name" select="eur:altiBoundLongitude"/>
						<xsl:with-param name="label" select="'Altitude longitude: '"/>
					</xsl:call-template>
					<xsl:call-template name="display_value_tpl">
						<xsl:with-param name="name" select="eur:altiBoundLatitude"/>
						<xsl:with-param name="label" select="'Altitude latitude: '"/>
					</xsl:call-template>
				</DL>
			</DD>
		</DD>
		<BR/>
	</xsl:template>
	<!-- Geographic Description Information (B.3.1.1 EX_GeographicDescription - line348) -->
	<xsl:template match="eur:geoDesc | eur:GeoExtent[@xsi:type = 'GeoDesc']">
		<DD>
			<xsl:choose>
				<xsl:when test="local-name() = 'geoDesc'">
					<DT class="title_2">
							<B>Description of the resource's location:</B>
							<!-- label -->
					</DT>
				</xsl:when>
				<xsl:otherwise>
					<DT class="title_2">
							<B>Geographic description:</B>
							<!-- label -->
					</DT>
				</xsl:otherwise>
			</xsl:choose>
			<DD>
				<DL>
					<xsl:call-template name="simple_boolean_tpl">
						<xsl:with-param name="name" select="eur:exTypeCode"/>
						<xsl:with-param name="label" select="'Extent contains the resource: '"/>
					</xsl:call-template>
					<xsl:apply-templates select="eur:geoId"/>
					<xsl:if test="(eur:exTypeCode) and not (eur:geoId)">
						<BR/>
						<BR/>
					</xsl:if>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<!-- Identifier Information (B.2.7.2 MD_Identifier - line205) -->
	<xsl:template match="eur:geoId | eur:refSysId | eur:projection | eur:ellipsoid | eur:datum | eur:refSysName | 
      eur:MdIdent | eur:RS_Identifier | eur:datumID">
		<DD>
			<xsl:choose>
				<xsl:when test="local-name() = 'geoId'">
					<DT class="title_2">
							<B>Geographic identifier:</B>
					</DT>
					<!-- label -->
				</xsl:when>
				<!-- can't use this method to add headings for refSysID, projection, ellipsoid, and datum
          because all exist together inside MdCoRefSys - also affects RefSystem -->
				<xsl:when test="local-name() = 'refSysName'">
					<DT class="title_2">
							<B>Reference system name identifier:</B>
					</DT>
					<!-- label -->
				</xsl:when>
				<xsl:when test="local-name() = 'datumID'">
					<DT class="title_2">
							<B>Vertical datum:</B>
					</DT>
					<!-- label -->
				</xsl:when>
				<!-- don't include an xsl:otherwise so the identCode value will appear correctly indented under the heading -->
			</xsl:choose>
			<DD class="common">
				<DL>
					<xsl:call-template name="display_value_tpl">
						<xsl:with-param name="name" select="iso19115:identCode"/>
						<xsl:with-param name="label" select="'Value: '"/>
					</xsl:call-template>
					<xsl:apply-templates select="iso19115:identAuth"/>
					<xsl:if test="(iso19115:identCode) and not (iso19115:identAuth)">
						<BR/>
						<BR/>
					</xsl:if>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<!-- Extent Information (B.3.1 EX_Extent - line334) -->
	<xsl:template match="eur:dataExt | eur:scpExt | eur:srcExt">
		<DD>
			<DT class="title_2">
					<xsl:choose>
						<xsl:when test="local-name() = 'dataExt'">
							<B>Other extent information:</B>
							<!-- label -->
						</xsl:when>
						<xsl:when test="local-name() = 'scpExt'">
							<B>Scope extent:</B>
							<!-- label -->
						</xsl:when>
						<xsl:when test="local-name() = 'srcExt'">
							<B>Extent of the source data:</B>
							<!-- label -->
						</xsl:when>
						<xsl:otherwise>
							<B>Extent:</B>
							<!-- label -->
						</xsl:otherwise>
					</xsl:choose>
			</DT>
			<DD>
				<DL>
					<xsl:call-template name="simple_fix_tpl">
						<xsl:with-param name="name" select="eur:exDesc"/>
						<xsl:with-param name="label" select="'Extent description: '"/>
					</xsl:call-template>
					<xsl:if test="eur:GeoExtent">
						<DT class="title_2">
								<B>Geographic extent:</B>
								<!-- label -->
						</DT>
						<DD>
							<DD>
								<DL>
									<xsl:apply-templates select="eur:GeoExtent[@xsi:type = 'BoundPolyType']"/>
									<xsl:apply-templates select="eur:GeoExtent[@xsi:type = 'GeoBndBoxType']"/>
									<xsl:apply-templates select="eur:GeoExtent[@xsi:type = 'GeoDescType']"/>
								</DL>
							</DD>
						</DD>
						<BR/>
					</xsl:if>
					<xsl:apply-templates select="eur:tempEle/eur:exTemp"/>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<!-- Bounding Polygon Information (B.3.1.1 EX_BoundingPolygon - line341) -->
	<xsl:template match="eur:GeoExtent[@xsi:type = 'BoundPolyType']">
		<DD>
			<DT class="title_2">
					<B>Bounding polygon:</B>
					<!-- label -->
			</DT>
			<DD>
				<DL>
					<xsl:call-template name="simple_boolean_tpl">
						<xsl:with-param name="name" select="eur:exTypeCode"/>
						<xsl:with-param name="label" select="'Extent contains the resource: '"/>
					</xsl:call-template>
					<xsl:apply-templates select="eur:polygon/eur:polygon"/>
					<xsl:apply-templates select="eur:box"/>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<xsl:template match="eur:polygon">
		<DD>
			<DT class="title_2">
					<B>polygon:</B>
					<!-- label -->
					<!-- label -->
			</DT>
			<DD>
				<DL>
					<xsl:apply-templates select="gml:outerBoundaryIs"/>
					<xsl:apply-templates select="gml:innerBoundaryIs"/>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<xsl:template match="gml:outerBoundaryIs | gml:innerBoundaryIs">
		<DD>
			<xsl:choose>
				<xsl:when test="local-name() = 'outerBoundaryIs'">
					<DT class="title_2">
							<B>Outer boundaries:</B>
							<!-- label -->
					</DT>
				</xsl:when>
				<xsl:otherwise>
					<DT class="title_2">
							<B>Inner boundaries:</B>
							<!-- label -->
					</DT>
				</xsl:otherwise>
			</xsl:choose>
			<DD>
				<DL>
					<xsl:apply-templates select="gml:LinearRing/gml:coord"/>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="gml:LinearRing/gml:coordinates"/>
						<xsl:with-param name="label" select="'Coordinates values: '"/>
					</xsl:call-template>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<xsl:template match="gml:coord">
		<DD>
			<DT class="title_2">
					<B>Coordinates:</B>
					<!-- label -->
			</DT>
			<DD>
				<DL>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="gml:X"/>
						<xsl:with-param name="label" select="'x: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="gml:Y"/>
						<xsl:with-param name="label" select="'y: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="gml:Z"/>
						<xsl:with-param name="label" select="'z: '"/>
					</xsl:call-template>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<!-- Temporal Extent Information (B.3.1.2 EX_TemporalExtent - line350) -->
	<xsl:template match="eur:exTemp">
		<DD>
			<DT class="title_2">
					<B>Temporal extent:</B>
					<!-- label -->
			</DT>
			<DD>
				<DL>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:beginEnd/eur:begin"/>
						<xsl:with-param name="label" select="'Beginning date: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:beginEnd/eur:end"/>
						<xsl:with-param name="label" select="'Ending date: '"/>
					</xsl:call-template>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<!-- Spatial Representation Information (B.2.6  MD_SpatialRepresentation - line156) -->
	<xsl:template match="eur:Metadata/eur:SpatRep">
		<A>
			<xsl:attribute name="NAME"><xsl:value-of select="generate-id()"/></xsl:attribute>
			<HR/>
		</A>
		<DL>
			<xsl:choose>
				<xsl:when test="@xsi:type = 'GridSpatRepType'">
					<DT class="title_1">
							<B>Spatial Representation - Grid:</B>
					</DT>
				</xsl:when>
				<xsl:when test="@xsi:type = 'GeorectType'">
					<DT class="title_1">
							<B>Spatial Representation - Georectified Grid:</B>
					</DT>
				</xsl:when>
				<xsl:when test="@xsi:type = 'VectSpatRepType'">
					<DT class="title_1">
							<B>Spatial Representation - Vector:</B>
					</DT>
				</xsl:when>
				<xsl:otherwise>
					<DT class="title_1">
							<B>Spatial Representation:</B>
					</DT>
				</xsl:otherwise>
			</xsl:choose>
			<BR/>
			<BR/>
			<DL class="common">
				<DD>
					<xsl:call-template name="grid_tpl"/>
					<xsl:call-template name="vector_tpl"/>
				</DD>
			</DL>
		</DL>
		<A HREF="#Top">Back to Top</A>
	</xsl:template>
	<!-- Grid Information (B.2.6  MD_GridSpatialRepresentation - line157, 
		MD_Georectified - line162, and MD_Georeferenceable - line170) -->
	<xsl:template name="grid_tpl">
		<!--match="*[@xsi:type = 'GridSpatRepType'] | Georect | Georef"-->
		<xsl:call-template name="simple_value_tpl">
			<xsl:with-param name="name" select="eur:numDims"/>
			<xsl:with-param name="label" select="'Number of dimensions: '"/>
		</xsl:call-template>
		<xsl:apply-templates select="eur:axDimProps"/>
		<xsl:if test="(eur:numDims) and not (eur:axDimProps)">
			<BR/>
			<BR/>
		</xsl:if>
		<xsl:call-template name="display_select_tpl">
			<xsl:with-param name="name" select="eur:cellGeo"/>
			<xsl:with-param name="label" select="'Cell geometry: '"/>
		</xsl:call-template>
		<xsl:if test="eur:cellGeo">
			<BR/>
			<BR/>
		</xsl:if>
		<xsl:call-template name="simple_boolean_tpl">
			<xsl:with-param name="name" select="eur:tranParaAv"/>
			<xsl:with-param name="label" select="'Transformation parameters are available: '"/>
		</xsl:call-template>
		<xsl:for-each select="eur:cornerPts">
			<DT class="title_2">
					<B>Corner points:</B>
					<!-- label -->
			</DT>
			<DD>
				<DL>
					<xsl:apply-templates select="eur:point2/gml:coord"/>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:point1/gml:coordinates"/>
						<xsl:with-param name="label" select="'Coordinates values: '"/>
					</xsl:call-template>
					<xsl:apply-templates select="eur:point2/gml:coord"/>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:point2/gml:coordinates"/>
						<xsl:with-param name="label" select="'Coordinates values: '"/>
					</xsl:call-template>
				</DL>
			</DD>
		</xsl:for-each>
		<xsl:call-template name="simple_select_tpl">
			<xsl:with-param name="name" select="eur:pointInPixel"/>
			<xsl:with-param name="label" select="'Point in a pixel: '"/>
		</xsl:call-template>
		<xsl:for-each select="eur:centerPt">
			<DT class="title_2">
					<B>Center point:</B>
					<!-- label -->
			</DT>
			<DD>
				<DL>
					<xsl:apply-templates select="gml:coord"/>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="gml:coordinates"/>
						<xsl:with-param name="label" select="'Coordinates values: '"/>
					</xsl:call-template>
				</DL>
			</DD>
		</xsl:for-each>
		<xsl:if test="eur:cornerPts | eur:pointInPixel | eur:centerPt">
			<br/>
		</xsl:if>
		<xsl:call-template name="simple_value_tpl">
			<xsl:with-param name="name" select="eur:transDimDesc"/>
			<xsl:with-param name="label" select="'Description of the transformation dimension: '"/>
		</xsl:call-template>
		<xsl:call-template name="simple_select_tpl">
			<xsl:with-param name="name" select="eur:transDimMap"/>
			<xsl:with-param name="label" select="'Description of the transformation mapping: '"/>
		</xsl:call-template>
	</xsl:template>
	<!-- Dimension Information (B.2.6.1 MD_Dimension - line179) -->
	<xsl:template match="eur:axDimProps">
		<DD>
			<DT class="title_2">
					<B>Axis dimensions properties:</B>
			</DT>
			<DD>
				<DL>
					<xsl:call-template name="display_select_tpl">
						<xsl:with-param name="name" select="iso19115:dimName"/>
						<xsl:with-param name="label" select="'Dimension name: '"/>
					</xsl:call-template>
					<xsl:call-template name="display_value_tpl">
						<xsl:with-param name="name" select="iso19115:dimSize"/>
						<xsl:with-param name="label" select="'Dimension size: '"/>
					</xsl:call-template>
					<xsl:apply-templates select="iso19115:_Measure | eur:Angle | eur:Area | eur:Scale | eur:Time | eur:Velocity | eur:Volume | eur:Length"/>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<xsl:template match="iso19115:_Measure | eur:Angle | eur:Area | eur:Scale | eur:Time | eur:Velocity | eur:Volume | eur:Length">
		<DT class="title_2">
				<xsl:choose>
					<xsl:when test="name() = 'Angle'">
						<B>Angle measure: </B>
					</xsl:when>
					<xsl:when test="name() = 'Area'">
						<B>Area measure: </B>
					</xsl:when>
					<xsl:when test="name() = 'Scale'">
						<B>Scale measure: </B>
					</xsl:when>
					<xsl:when test="name() = 'Time'">
						<B>Time measure: </B>
					</xsl:when>
					<xsl:when test="name() = 'Velocity'">
						<B>Velocity measure: </B>
					</xsl:when>
					<xsl:when test="name() = 'Volume'">
						<B>Volume measure: </B>
					</xsl:when>
					<xsl:when test="name() = 'Length'">
						<B>Length measure: </B>
					</xsl:when>
					<xsl:otherwise>
						<B>Measure: </B>
					</xsl:otherwise>
				</xsl:choose>
		</DT>
		<!-- label -->
		<DD>
			<DL>
				<!-- value will be shown regardless of the subelement Integer, Real, or Decimal -->
				<xsl:call-template name="simple_value_tpl">
					<xsl:with-param name="name" select="iso19115:value"/>
					<xsl:with-param name="label" select="'Value: '"/>
				</xsl:call-template>
				<xsl:call-template name="simple_value_tpl">
					<xsl:with-param name="name" select="iso19115:accuracy"/>
					<xsl:with-param name="label" select="'Accuracy: '"/>
				</xsl:call-template>
				<xsl:apply-templates select="eur:uom"/>
				<xsl:if test="(iso19115:value or iso19115:accuracy) and not (eur:uom)">
					<BR/>
					<BR/>
				</xsl:if>
			</DL>
		</DD>
	</xsl:template>
	<!-- Vector Information (B.2.6  MD_VectorSpatialRepresentation - line176) -->
	<xsl:template name="vector_tpl">
		<xsl:call-template name="display_select_tpl">
			<xsl:with-param name="name" select="eur:topLvl"/>
			<xsl:with-param name="label" select="'Level of topology for this dataset: '"/>
		</xsl:call-template>
		<xsl:apply-templates select="eur:geometObjs"/>
		<xsl:if test="eur:topLvl and not (eur:geometObjs)">
			<BR/>
			<BR/>
		</xsl:if>
	</xsl:template>
	<!-- Geometric Object Information (B.2.6.2 MD_GeometricObjects - line183) -->
	<xsl:template match="eur:geometObjs">
		<DD>
			<DT class="title_2">
					<B>Geometric objects:</B>
			</DT>
			<DD>
				<DL>
					<xsl:call-template name="display_select_tpl">
						<xsl:with-param name="name" select="eur:geoObjTyp"/>
						<xsl:with-param name="label" select="'Object type: '"/>
					</xsl:call-template>
					<xsl:call-template name="display_value_tpl">
						<xsl:with-param name="name" select="eur:geoObjCnt"/>
						<xsl:with-param name="label" select="'Object count: '"/>
					</xsl:call-template>
				</DL>
			</DD>
		</DD>
		<BR/>
	</xsl:template>
	<!-- Content Information (B.2.8 MD_ContentInformation - line232) -->
	<xsl:template match="eur:contInfo">
		<A>
			<xsl:attribute name="NAME"><xsl:value-of select="generate-id()"/></xsl:attribute>
			<HR/>
		</A>
		<DL>
			<DT class="title_1">
					<B>Content Information - Coverage Description:</B>
					<!-- label -->
			</DT>
			<BR/>
			<BR/>
			<DL class="common">
				<DD>
					<xsl:call-template name="simple_select_tpl">
						<xsl:with-param name="name" select="eur:contentTyp"/>
						<xsl:with-param name="label" select="'Type of information: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:attDesc"/>
						<xsl:with-param name="label" select="'Attribute described by cell values: '"/>
					</xsl:call-template>
					<xsl:if test="eur:attDesc | eur:contentTyp">
						<BR/>
						<BR/>
					</xsl:if>
					<xsl:apply-templates select="eur:covDim"/>
				</DD>
			</DL>
		</DL>
		<A HREF="#Top">Back to Top</A>
	</xsl:template>
	<!-- Range dimension Information (B.2.8.1 MD_RangeDimension - line256) -->
	<xsl:template match="eur:covDim">
		<DD>
			<DT class="title_2">
					<B>Cell value information:</B>
			</DT>
			<DD>
				<DL>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:dimDescrp"/>
						<xsl:with-param name="label" select="'Minimum and maximum values: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_select_tpl">
						<xsl:with-param name="name" select="eur:seqID"/>
						<xsl:with-param name="label" select="'Band identifier: '"/>
					</xsl:call-template>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<xsl:template match="eur:seqID">
		<DD>
			<DL>
				<xsl:call-template name="simple_value_tpl">
					<xsl:with-param name="name" select="iso19103:scope"/>
					<xsl:with-param name="label" select="'Scope: '"/>
				</xsl:call-template>
				<xsl:call-template name="simple_value_tpl">
					<xsl:with-param name="name" select="iso19103:aName"/>
					<xsl:with-param name="label" select="'Name: '"/>
				</xsl:call-template>
				<xsl:for-each select="iso19103:attributeType">
					<DT class="title_2">
							<B>Attribute type:</B>
							<!-- label -->
					</DT>
					<DD>
						<DL>
							<xsl:call-template name="simple_value_tpl">
								<xsl:with-param name="name" select="iso19103:scope"/>
								<xsl:with-param name="label" select="'Scope: '"/>
							</xsl:call-template>
							<xsl:call-template name="simple_value_tpl">
								<xsl:with-param name="name" select="iso19103:aName"/>
								<xsl:with-param name="label" select="'Name: '"/>
							</xsl:call-template>
						</DL>
					</DD>
				</xsl:for-each>
			</DL>
		</DD>
		<BR/>
	</xsl:template>
	<!-- Data Quality Information  (B.2.4 DQ_DataQuality - line78) -->
	<xsl:template match="eur:Metadata/eur:dqInfo">
		<A>
			<xsl:attribute name="NAME"><xsl:value-of select="generate-id()"/></xsl:attribute>
			<HR/>
		</A>
		<DL>
			<xsl:if test="count(/eur:Metadata/eur:dqInfo) = 1">
				<DT class="title_1">
						<B>Data Quality Information:</B>
				</DT>
			</xsl:if>
			<xsl:if test="count(/eur:Metadata/eur:dqInfo) &gt; 1">
				<DT class="title_1">
						<B>
       Data Quality - Description <xsl:number value="position()"/>:
      </B>
				</DT>
			</xsl:if>
			<BR/>
			<BR/>
			<DL class="common">
				<DD>
					<xsl:apply-templates select="eur:dqScope"/>
					<xsl:apply-templates select="eur:dataLineage"/>
					<xsl:apply-templates select="iso19115:DQElement"/>
				</DD>
			</DL>
		</DL>
		<A HREF="#Top">Back to Top</A>
	</xsl:template>
	<!-- Scope Information (B.2.4.4 DQ_Scope - line138) -->
	<xsl:template match="eur:dqScope">
		<DD>
			<DT class="title_2">
					<B>Scope of quality information:</B>
			</DT>
			<DD>
				<DL>
					<xsl:call-template name="simple_select_tpl">
						<xsl:with-param name="name" select="eur:scpLvl"/>
						<xsl:with-param name="label" select="'Level of the data: '"/>
					</xsl:call-template>
					<xsl:apply-templates select="eur:scpLvlDesc"/>
					<xsl:if test="eur:scpLvl and not (eur:scpLvlDesc)">
						<BR/>
						<BR/>
					</xsl:if>
					<xsl:apply-templates select="eur:scpExt"/>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<!-- Scope Description Information (B.2.5.1 MD_ScopeDescription - line149) -->
	<xsl:template match="eur:scpLvlDesc | upScpDesc">
		<DD>
			<xsl:if test="position() = 1">
				<DT class="title_2">
						<B>Scope description:</B>
				</DT>
			</xsl:if>
			<!--treat attributes-->
			<xsl:call-template name="simple_value_tpl">
				<xsl:with-param name="name" select="eur:datasetSet"/>
				<xsl:with-param name="label" select="'Dataset to which the information applies: '"/>
			</xsl:call-template>
			<xsl:call-template name="simple_value_tpl">
				<xsl:with-param name="name" select="eur:other"/>
				<xsl:with-param name="label" select="'Class of information that does not fall into the other categories: '"/>
			</xsl:call-template>
			<xsl:call-template name="simple_select_tpl">
				<xsl:with-param name="name" select="eur:attribSet"/>
				<xsl:with-param name="label" select="'Attributes: '"/>
			</xsl:call-template>
			<xsl:call-template name="simple_select_tpl">
				<xsl:with-param name="name" select="eur:featSet"/>
				<xsl:with-param name="label" select="'Features: '"/>
			</xsl:call-template>
			<xsl:call-template name="simple_select_tpl">
				<xsl:with-param name="name" select="eur:featIntSet"/>
				<xsl:with-param name="label" select="'Features instances: '"/>
			</xsl:call-template>
			<xsl:call-template name="simple_select_tpl">
				<xsl:with-param name="name" select="eur:attribIntSet"/>
				<xsl:with-param name="label" select="'Attributes instances: '"/>
			</xsl:call-template>
			<xsl:if test="position() = last()">
				<BR/>
				<BR/>
			</xsl:if>
		</DD>
	</xsl:template>
	<xsl:template match="eur:attribSet | eur:attribIntSet">
		<DD>
			<DT class="title_2">
					<B>Attribute:</B>
			</DT>
			<DD>
				<DL>
					<xsl:call-template name="simple_select_tpl">
						<xsl:with-param name="name" select="iso19109:memberName"/>
						<xsl:with-param name="label" select="'Member name: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="iso19109:definition"/>
						<xsl:with-param name="label" select="'definition: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_select_tpl">
						<xsl:with-param name="name" select="iso19109:constrainedBy"/>
						<xsl:with-param name="label" select="'constrained by: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_select_tpl">
						<xsl:with-param name="name" select="iso19109:valueType"/>
						<xsl:with-param name="label" select="'value type: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_select_tpl">
						<xsl:with-param name="name" select="iso19109:valueDomain"/>
						<xsl:with-param name="label" select="'value domain: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_select_tpl">
						<xsl:with-param name="name" select="iso19109:cardinality"/>
						<xsl:with-param name="label" select="'cardinality: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_select_tpl">
						<xsl:with-param name="name" select="iso19109:characterizedBy"/>
						<xsl:with-param name="label" select="'characterized by: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_select_tpl">
						<xsl:with-param name="name" select="iso19109:characterizes"/>
						<xsl:with-param name="label" select="'characterizes: '"/>
					</xsl:call-template>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<xsl:template match="eur:featSet | eur:featIntSet">
		<DD>
			<DT class="title_2">
					<B>Feature:</B>
			</DT>
			<DD>
				<DL>
					<xsl:apply-templates/>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<!-- Lineage Information (B.2.4.1 LI_Lineage - line82) -->
	<xsl:template match="eur:dataLineage">
		<DD>
			<DT class="title_2">
					<B>Lineage:</B>
			</DT>
			<DD>
				<DL>
					<xsl:call-template name="simple_fix_tpl">
						<xsl:with-param name="name" select="eur:statement"/>
						<xsl:with-param name="label" select="'Lineage statement: '"/>
					</xsl:call-template>
					<xsl:apply-templates select="eur:prcStep"/>
					<xsl:apply-templates select="eur:dataSource"/>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<!-- Process Step Information (B.2.4.1.1 LI_ProcessStep - line86) -->
	<xsl:template match="eur:prcStep | srcStep">
		<DD>
			<DT class="title_2">
					<B>Process step:</B>
			</DT>
			<DD>
				<DL>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:description"/>
						<xsl:with-param name="label" select="'Description of the event in the creation process: '"/>
					</xsl:call-template>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<!-- Source Information (B.2.4.1.2 LI_Source - line92) -->
	<xsl:template match="eur:dataSource | stepSrc">
		<DD>
			<DT class="title_2">
					<B>Source data:</B>
			</DT>
			<DD>
				<DL>
					<xsl:call-template name="simple_fix_tpl">
						<xsl:with-param name="name" select="eur:srcDesc"/>
						<xsl:with-param name="label" select="'Level of the source data: '"/>
					</xsl:call-template>
					<xsl:apply-templates select="eur:srcCitatn"/>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<xsl:template match="iso19115:DQElement">
		<DD>
			<DT class="title_2">
					<xsl:choose>
						<xsl:when test="@xsi:type = 'DQCompleteCommType'">
							<B>Data quality report - Completeness commission:</B>
						</xsl:when>
						<xsl:when test="@xsi:type = 'DQCompOmType'">
							<B>Data quality report - Completeness omission:</B>
						</xsl:when>
						<xsl:when test="@xsi:type = 'DQConcConsisType'">
							<B>Data quality report - Conceptual consistency:</B>
						</xsl:when>
						<xsl:when test="@xsi:type = 'DQDomConsisType'">
							<B>Data quality report - Domain consistency:</B>
						</xsl:when>
						<xsl:when test="@xsi:type = 'DQFormConsisType'">
							<B>Data quality report - Format consistency:</B>
						</xsl:when>
						<xsl:when test="@xsi:type = 'DQTopConsisType'">
							<B>Data quality report - Topological consistency:</B>
						</xsl:when>
						<xsl:when test="@xsi:type = 'DQAbsExtPosAccType'">
							<B>Data quality report - Absolute external positional accuracy:</B>
						</xsl:when>
						<xsl:when test="@xsi:type = 'DQGridDataPosAccType'">
							<B>Data quality report - Gridded data positional accuracy:</B>
						</xsl:when>
						<xsl:when test="@xsi:type = 'DQRelIntPosAccType'">
							<B>Data quality report - Relative internal positional accuracy:</B>
						</xsl:when>
						<xsl:when test="@xsi:type = 'DQAccTimeMeasType'">
							<B>Data quality report - Accuracy of a time measurement:</B>
						</xsl:when>
						<xsl:when test="@xsi:type = 'DQTempConsisType'">
							<B>Data quality report - Temporal consistency:</B>
						</xsl:when>
						<xsl:when test="@xsi:type = 'DQTempValidType'">
							<B>Data quality report - Temporal validity:</B>
						</xsl:when>
						<xsl:when test="@xsi:type = 'DQThemClassCorType'">
							<B>Data quality report - Thematic classification correctness:</B>
						</xsl:when>
						<xsl:when test="@xsi:type = 'DQNonQuanAttAccType'">
							<B>Data quality report - Non quantitative attribute accuracy:</B>
						</xsl:when>
						<xsl:when test="@xsi:type = 'DQQuanAttAccType'">
							<B>Data quality report - Quantitative attribute accuracy:</B>
						</xsl:when>
						<xsl:otherwise>
							<B>Data quality report</B>
						</xsl:otherwise>
					</xsl:choose>
			</DT>
			<DD>
				<DL>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="iso19115:measName"/>
						<xsl:with-param name="label" select="'Name of the test: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_select_tpl">
						<xsl:with-param name="name" select="iso19115:evalMethType"/>
						<xsl:with-param name="label" select="'Type of test: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="iso19115:measDateTm"/>
						<xsl:with-param name="label" select="'Date of the test: '"/>
					</xsl:call-template>
					<xsl:if test="iso19115:measName | iso19115:evalMethType | iso19115:measDateTm">
						<BR/>
						<BR/>
					</xsl:if>
					<xsl:call-template name="simple_fix_tpl">
						<xsl:with-param name="name" select="iso19115:measDesc"/>
						<xsl:with-param name="label" select="'Measure produced by the test: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_fix_tpl">
						<xsl:with-param name="name" select="iso19115:evalMethDesc"/>
						<xsl:with-param name="label" select="'Evaluation method: '"/>
					</xsl:call-template>
					<xsl:for-each select="iso19115:measId">
						<DT class="title_2">
								<B>Registered standard procedure:</B>
						</DT>
						<DD>
							<DL>
								<xsl:call-template name="display_value_tpl">
									<xsl:with-param name="name" select="iso19115:identCode"/>
									<xsl:with-param name="label" select="'Value: '"/>
								</xsl:call-template>
								<xsl:apply-templates select="iso19115:identAuth"/>
								<xsl:if test="(iso19115:identCode) and not (iso19115:identAuth)">
									<BR/>
									<BR/>
								</xsl:if>
							</DL>
						</DD>
					</xsl:for-each>
					<xsl:apply-templates select="iso19115:evalProc"/>
					<xsl:apply-templates select="iso19115:measResult[@xsi:type = 'ConResultType']"/>
					<xsl:apply-templates select="iso19115:measResult[@xsi:type = 'QuanResultType']"/>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<!-- Conformance Result Information (B.2.4.3 DQ_ConformanceResult - line129) -->
	<xsl:template match="iso19115:measResult[@xsi:type = 'ConResultType']">
		<DD>
			<DT class="title_2">
					<B>Conformance test results:</B>
			</DT>
			<DD>
				<DL>
					<xsl:call-template name="simple_boolean_tpl">
						<xsl:with-param name="name" select="eur:conPass"/>
						<xsl:with-param name="label" select="'Test passed: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:conExpl"/>
						<xsl:with-param name="label" select="'Meaning of the result: '"/>
					</xsl:call-template>
					<xsl:if test="eur:conPass | eur:conExpl">
						<BR/>
						<BR/>
					</xsl:if>
					<xsl:apply-templates select="eur:conSpec"/>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<!-- Quantitative Result Information (B.2.4.3 DQ_QuantitativeResult - line133) -->
	<xsl:template match="iso19115:measResult[@xsi:type = 'QuanResultType']">
		<DD>
			<DT class="title_2">
					<B>Quality test results:</B>
			</DT>
			<DD>
				<DL>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:quanValType"/>
						<xsl:with-param name="label" select="'Values required for conformance: '"/>
					</xsl:call-template>
					<xsl:apply-templates select="eur:_UnitOfMeasure | eur:UomLength | eur:UomScale | eur:UomTime | eur:UomArea | eur:UomVolume | eur:UomAngle | eur:UomVelocity"/>
					<xsl:apply-templates select="eur:quanVal"/>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:errStat"/>
						<xsl:with-param name="label" select="'Statistic method used to determine teh value: '"/>
					</xsl:call-template>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<xsl:template match="eur:quanVal">
		<DD>
			<DT class="title_2">
					<B>Quantitative value:</B>
			</DT>
			<DD>
				<DL>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:otherValue"/>
						<xsl:with-param name="label" select="'Other value: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:recordValue"/>
						<xsl:with-param name="label" select="'Record value: '"/>
					</xsl:call-template>
					<xsl:if test="eur:otherValue | eur:recordValue">
						<BR/>
						<BR/>
					</xsl:if>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<!-- Reference System Information (B.2.7 MD_ReferenceSystem - line186) -->
	<xsl:template match="eur:RefSystem | eur:MdCoRefSys">
		<A>
			<xsl:attribute name="NAME"><xsl:value-of select="generate-id()"/></xsl:attribute>
			<HR/>
		</A>
		<DL>
			<xsl:if test="count(/eur:Metadata/eur:RefSystem | /eur:Metadata/eur:MdCoRefSys) = 1">
				<DT class="title_1">
						<B>Reference System Information:</B>
				</DT>
			</xsl:if>
			<xsl:if test="count(/eur:Metadata/eur:RefSystem | /eur:Metadata/eur:MdCoRefSys) &gt; 1">
				<DT class="title_1">
						<B>
        Reference System Information - System <xsl:number value="position()"/>: </B>
				</DT>
			</xsl:if>
			<BR/>
			<BR/>
			<DL class="common">
				<DD>
					<xsl:choose>
						<xsl:when test="@xsi:type = 'MdCoRefSysType'">
							<xsl:call-template name="CoRefSys_tpl"/>
						</xsl:when>
						<xsl:when test="@xsi:type = 'eur:MdCoRefSysType'">
							<xsl:call-template name="CoRefSys_tpl"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="RefSys_tpl"/>
						</xsl:otherwise>
					</xsl:choose>
				</DD>
			</DL>
		</DL>
		<A HREF="#Top">Back to Top</A>
	</xsl:template>
	<!-- Reference System Information (B.2.7 MD_ReferenceSystem - line186) -->
	<xsl:template name="RefSys_tpl">
		<DT class="title_2">
				<B>Reference system identifier:</B>
		</DT>
		<xsl:apply-templates select="eur:refSysId"/>
		<BR/>
	</xsl:template>
	<!-- Metadata for Coordinate Systems (B.2.7 MD_CRS - line189) -->
	<xsl:template name="CoRefSys_tpl">
		<xsl:if test="eur:refSysId">
			<DT class="title_2">
					<B>Reference system identifier:</B>
			</DT>
			<dl>
				<dt>
					<xsl:apply-templates select="eur:refSysId"/>
				</dt>
			</dl>
		</xsl:if>
		<xsl:if test="eur:projection">
			<DT class="title_2">
					<B>Projection identifier:</B>
			</DT>
			<xsl:apply-templates select="eur:projection"/>
		</xsl:if>
		<xsl:if test="eur:ellipsoid">
			<DT class="title_2">
					<B>Ellipsoid identifier:</B>
			</DT>
			<xsl:apply-templates select="eur:ellipsoid"/>
		</xsl:if>
		<xsl:if test="eur:datum">
			<DT class="title_2">
					<B>Datum identifier:</B>
			</DT>
			<xsl:apply-templates select="eur:datum"/>
		</xsl:if>
		<xsl:apply-templates select="eur:projParas"/>
		<xsl:apply-templates select="eur:ellParas"/>
		<BR/>
	</xsl:template>
	<!-- Projection Parameter Information (B.2.7.5 MD_ProjectionParameters - line215) -->
	<xsl:template match="eur:projParas">
		<DD>
			<DT class="title_2">
					<B>Projection parameters:</B>
			</DT>
			<DD>
				<DL>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:zone"/>
						<xsl:with-param name="label" select="'Zone number: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:stanParal"/>
						<xsl:with-param name="label" select="'Standard parallel: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:longCntMer"/>
						<xsl:with-param name="label" select="'Longitude of central meridian: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:latProjOri"/>
						<xsl:with-param name="label" select="'Latitude of projection origin: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:sclFacEqu"/>
						<xsl:with-param name="label" select="'Scale factor at equator: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:hgtProsPt"/>
						<xsl:with-param name="label" select="'Height of prospective point above surface: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:longProjCnt"/>
						<xsl:with-param name="label" select="'Longitude of projection center: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:latProjCnt"/>
						<xsl:with-param name="label" select="'Latitude of projection center: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:sclFacCnt"/>
						<xsl:with-param name="label" select="'Scale factor at center line: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:stVrLongPl"/>
						<xsl:with-param name="label" select="'Straight vertical longitude from pole: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:sclFacPrOr"/>
						<xsl:with-param name="label" select="'Scale factor at projection origin: '"/>
					</xsl:call-template>
					<xsl:if test="eur:zone | eur:stanParal | eur:longCntMer | eur:latProjOri | eur:sclFacEqu | 
      		eur:hgtProsPt | eur:longProjCnt | eur:latProjCnt | eur:sclFacCnt | eur:stVrLongPl | eur:sclFacPrOr">
						<BR/>
						<BR/>
					</xsl:if>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:falEastng"/>
						<xsl:with-param name="label" select="'False easting: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:falNorthng"/>
						<xsl:with-param name="label" select="'False northing: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_select_tpl">
						<xsl:with-param name="name" select="eur:falENUnits"/>
						<xsl:with-param name="label" select="'False easting northing units: '"/>
					</xsl:call-template>
					<xsl:if test="(eur:falEastng | eur:falNorthng | eur:falENUnits)">
						<BR/>
						<BR/>
					</xsl:if>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<!-- Ellipsoid Parameter Information (B.2.7.1 MD_EllipsoidParameters - line201) -->
	<xsl:template match="eur:ellParas">
		<DD>
			<DT class="title_2">
					<B>Ellipsoid parameters:</B>
			</DT>
			<DD>
				<DL>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:semiMajAx"/>
						<xsl:with-param name="label" select="'Semi-major axis: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_select_tpl">
						<xsl:with-param name="name" select="eur:axisUnits"/>
						<xsl:with-param name="label" select="'Axis units: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:denFlatRat"/>
						<xsl:with-param name="label" select="'Denominator of flattening ratio: '"/>
					</xsl:call-template>
				</DL>
			</DD>
		</DD>
		<BR/>
	</xsl:template>
	<!-- Distribution Information (B.2.10 MD_Distribution - line270) -->
	<xsl:template match="eur:Metadata/eur:distInfo">
		<A>
			<xsl:attribute name="NAME"><xsl:value-of select="generate-id()"/></xsl:attribute>
			<HR/>
		</A>
		<DL>
			<DT class="title_1">
					<B>Distribution Information:</B>
			</DT>
			<BR/>
			<BR/>
			<DL class="common">
				<DD>
					<xsl:apply-templates select="eur:distributor"/>
					<xsl:apply-templates select="eur:distFormat"/>
					<!-- toto -->
					<xsl:apply-templates select="eur:distTranOps"/>
				</DD>
			</DL>
		</DL>
		<A HREF="#Top">Back to Top</A>
	</xsl:template>
	<!-- Distributor Information (B.2.10.2 MD_Distributor - line279) -->
	<xsl:template match="eur:distributor | eur:formatDist">
		<DD>
			<DT class="title_2">
					<B>Distributor:</B>
			</DT>
			<DD>
				<DL>
					<xsl:apply-templates select="eur:distorCont"/>
					<xsl:apply-templates select="eur:distorOrdPrc"/>
					<xsl:apply-templates select="eur:distorTran"/>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<!-- Standard Order Process Information (B.2.10.5 MD_StandardOrderProcess - line298) -->
	<xsl:template match="eur:distorOrdPrc">
		<DD>
			<DT class="title_2">
					<B>Ordering process:</B>
			</DT>
			<DD>
				<DL>
					<xsl:call-template name="simple_select_tpl">
						<xsl:with-param name="name" select="eur:resFees"/>
						<xsl:with-param name="label" select="'Terms and fees: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_fix_tpl">
						<xsl:with-param name="name" select="eur:ordInstr"/>
						<xsl:with-param name="label" select="'Instructions: '"/>
					</xsl:call-template>
				</DL>
			</DD>
		</DD>
		<BR/>
	</xsl:template>
	<xsl:template match="eur:resFees">
		<DD>
			<DL>
				<xsl:call-template name="simple_value_tpl">
					<xsl:with-param name="name" select="eur:retrievalTerms"/>
					<xsl:with-param name="label" select="'Retrieval terms: '"/>
				</xsl:call-template>
				<xsl:call-template name="simple_value_tpl">
					<xsl:with-param name="name" select="eur:monetaryAmount/iso4217:monetaryAmt"/>
					<xsl:with-param name="label" select="'Amount: '"/>
				</xsl:call-template>
				<xsl:call-template name="simple_value_tpl">
					<xsl:with-param name="name" select="eur:monetaryAmount/iso4217:monetaryType/iso4217:isoName"/>
					<xsl:with-param name="label" select="'Monetary name: '"/>
				</xsl:call-template>
				<xsl:call-template name="simple_value_tpl">
					<xsl:with-param name="name" select="eur:monetaryAmount/iso4217:monetaryType/iso4217:isoCode"/>
					<xsl:with-param name="label" select="'Monetary code: '"/>
				</xsl:call-template>
			</DL>
		</DD>
		<BR/>
	</xsl:template>
	<!-- Digital Transfer Options Information (B.2.10.1 MD_DigitalTransferOptions - line274) -->
	<xsl:template match="eur:distorTran | eur:distTranOps">
		<DD>
			<DT class="title_2">
					<B>Transfer options:</B>
			</DT>
			<DD>
				<DL>
					<xsl:call-template name="display_value_tpl">
						<xsl:with-param name="name" select="eur:transSize"/>
						<xsl:with-param name="label" select="'Transfer size: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:unitsODist"/>
						<xsl:with-param name="label" select="'Units of distribution (e.g., tiles): '"/>
					</xsl:call-template>
					<xsl:if test="eur:transSize | eur:unitsODist">
						<BR/>
						<BR/>
					</xsl:if>
					<xsl:apply-templates select="eur:onLineSrc"/>
					<xsl:apply-templates select="eur:offLineMed"/>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<!-- Medium Information (B.2.10.4 MD_Medium - line291) -->
	<xsl:template match="eur:offLineMed">
		<DD>
			<DT class="title_2">
					<B>Medium of distribution:</B>
			</DT>
			<DD>
				<DL>
					<xsl:call-template name="simple_select_tpl">
						<xsl:with-param name="name" select="eur:medName"/>
						<xsl:with-param name="label" select="'Medium name: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:medVol"/>
						<xsl:with-param name="label" select="'Number of media items: '"/>
					</xsl:call-template>
					<xsl:if test="eur:medName | eur:medVol">
						<BR/>
						<BR/>
					</xsl:if>
					<xsl:call-template name="simple_select_tpl">
						<xsl:with-param name="name" select="eur:medFormat"/>
						<xsl:with-param name="label" select="'How the medium is written: '"/>
					</xsl:call-template>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<xsl:template name="extension_tpl">
		<A name="Metadata_extension">
			<HR/>
		</A>
		<DL>
			<DT class="title_1">
					<B>Metadata extension : </B>
					<!-- label -->
			</DT>
			<BR/>
			<BR/>
			<DL class="common">
				<DD>
					<DT class="title_2">
							<B>Eurosion extension:</B>
					</DT>
					<DD class="specific">
						<DL>
							<xsl:call-template name="simple_select_tpl">
								<xsl:with-param name="name" select="eur:Metadata/eur:euroExt/eur:eurTopic"/>
								<xsl:with-param name="label" select="'Eurosion topic: '"/>
							</xsl:call-template>
						</DL>
					</DD>
					<xsl:if test="eur:Metadata/eur:euroExt">
						<br/>
						<br/>
					</xsl:if>
					<DT class="title_2">
							<B>Gisco extension:</B>
					</DT>
					<DD class="specific">
						<DL>
							<xsl:call-template name="simple_value_tpl">
								<xsl:with-param name="name" select="eur:Metadata/eur:giscoExt/eur:esriExtentTypeCode"/>
								<xsl:with-param name="label" select="'Esri extent type code: '"/>
							</xsl:call-template>
							<xsl:call-template name="simple_value_tpl">
								<xsl:with-param name="name" select="eur:Metadata/eur:giscoExt/eur:thumbnail"/>
								<xsl:with-param name="label" select="'Thumbnail: '"/>
							</xsl:call-template>
							<xsl:call-template name="simple_value_tpl">
								<xsl:with-param name="name" select="eur:Metadata/eur:giscoExt/eur:enclosure"/>
								<xsl:with-param name="label" select="'Enclosure: '"/>
							</xsl:call-template>
							<xsl:call-template name="simple_value_tpl">
								<xsl:with-param name="name" select="eur:Metadata/eur:giscoExt/eur:giscoAttributesInfo"/>
								<xsl:with-param name="label" select="'Gisco attributes: '"/>
							</xsl:call-template>
							<xsl:call-template name="simple_value_tpl">
								<xsl:with-param name="name" select="eur:Metadata/eur:giscoExt/eur:esriNameObject"/>
								<xsl:with-param name="label" select="'Esri Name Object: '"/>
							</xsl:call-template>
						</DL>
					</DD>
					<xsl:if test="eur:Metadata/eur:giscoExt">
						<br/>
						<br/>
					</xsl:if>
					<DT  class="title_2">
							<B>Dublin Core extension:</B>
					</DT>
					<DD class="specific">
						<DL>
							<xsl:apply-templates select="eur:Metadata/eur:dcmiExt/eur:relation"/>
						</DL>
					</DD>
					<xsl:if test="eur:Metadata/eur:dcmiExt">
						<br/>
						<br/>
					</xsl:if>
					<DT class="title_2">
							<B>Gelos extension:</B>
					</DT>
					<DD class="specific">
						<DL>
							<xsl:apply-templates select="eur:Metadata/eur:gelosExt/eur:glsExt"/>
							<xsl:apply-templates select="eur:Metadata/eur:gelosExt/eur:coastbaseExt"/>
							<xsl:apply-templates select="eur:Metadata/eur:gelosExt/eur:etccdsExt"/>
						</DL>
					</DD>
				</DD>
			</DL>
		</DL>
		<A HREF="#Top">Back to Top</A>
	</xsl:template>
	<xsl:template match="eur:glsExt">
		<DD>
			<DT class="title_2">
					<B>Gelos:</B>
			</DT>
			<DD>
				<DL>
					<xsl:apply-templates select="eur:place"/>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:uncontrolledVocabulary"/>
						<xsl:with-param name="label" select="'Uncontrolled vocabulary: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:medVol"/>
						<xsl:with-param name="label" select="'Number of media items: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:gelosTemporalCoverage"/>
						<xsl:with-param name="label" select="'gelos Temporal Coverage: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:gelosControlIdentifier"/>
						<xsl:with-param name="label" select="'gelosControlIdentifier: '"/>
					</xsl:call-template>
					<xsl:apply-templates select="eur:gelosRecordSource"/>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:gelosLanguageOfRecord"/>
						<xsl:with-param name="label" select="'gelos Language Of Record: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:gelosDateOfLastUpdateRecord"/>
						<xsl:with-param name="label" select="'gelos Date Of Last Update Record: '"/>
					</xsl:call-template>
				</DL>
			</DD>
		</DD>
		<br/>
	</xsl:template>
	<xsl:template match="eur:coastbaseExt">
		<DD>
			<DT class="title_2">
					<B>Coastbase:</B>
			</DT>
			<DD>
				<DL>
					<xsl:if test="eur:habitatType">
						<DT class="title_2">
								<B>Habitat type:</B>
						</DT>
						<DD>
							<DL>
								<xsl:apply-templates select="eur:habitatType"/>
							</DL>
						</DD>
					</xsl:if>
					<xsl:if test="eur:issue">
						<DT class="title_2">
								<B>Issue:</B>
						</DT>
						<DD>
							<DL>
								<xsl:apply-templates select="eur:issue"/>
							</DL>
						</DD>
					</xsl:if>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:method"/>
						<xsl:with-param name="label" select="'Method: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:aggregationLevel"/>
						<xsl:with-param name="label" select="'Aggregation level: '"/>
					</xsl:call-template>
				</DL>
			</DD>
		</DD>
		<br/>
	</xsl:template>
		<xsl:template match="eur:etccdsExt">
		<DD>
			<DT class="title_2">
					<B>Etc cds:</B>
			</DT>
			<DD>
				<DL>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:englishTitle"/>
						<xsl:with-param name="label" select="'English title: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:englishAbstract"/>
						<xsl:with-param name="label" select="'english Abstract: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:thesTopTerm"/>
						<xsl:with-param name="label" select="'thesaurus Top Term: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:etccdsControlIdentifier"/>
						<xsl:with-param name="label" select="'etc cds Control Identifier: '"/>
					</xsl:call-template>
					<xsl:apply-templates select="eur:etccdsRecordSource"/>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:etccdsLanguageOfRecord"/>
						<xsl:with-param name="label" select="'etc cds Language Of Record: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:etccdsDateOfLastUpdateRecord"/>
						<xsl:with-param name="label" select="'etc cds Date Of Last Update Record: '"/>
					</xsl:call-template>
				</DL>
			</DD>
		</DD>
	</xsl:template>
	<!-- Application schema Information (B.2.12 MD_ApplicationSchemaInformation - line320) -->
	<xsl:template match="eur:Metadata/eur:appSchInfo">
		<A>
			<xsl:attribute name="NAME"><xsl:value-of select="generate-id()"/></xsl:attribute>
			<HR/>
		</A>
		<DL>
			<xsl:if test="count(/eur:Metadata/eur:appSchInfo) = 1">
				<DT class="title_1">
						<B>Application Schema Information:</B> <!-- label -->
				</DT>
			</xsl:if>
			<xsl:if test="count(/eur:Metadata/eur:appSchInfo) &gt; 1">
				<DT class="title_1">
						<B>
        Application Schema Information - Schema <xsl:number value="position()"/>
      </B>
				</DT>
			</xsl:if>
			<BR/>
			<BR/>
			<DL class="common">
				<DD>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:asSchLang"/>
						<xsl:with-param name="label" select="'Schema language used: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:asCstLang"/>
						<xsl:with-param name="label" select="'Formal language used in schema: '"/>
					</xsl:call-template>
					<xsl:if test="eur:asSchLang | eur:asCstLang">
						<BR/>
						<BR/>
					</xsl:if>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:asAscii"/>
						<xsl:with-param name="label" select="'Schema ASCII file: '"/>
					</xsl:call-template>
					<xsl:call-template name="simple_value_tpl">
						<xsl:with-param name="name" select="eur:asGraFile"/>
						<xsl:with-param name="label" select="'Schema graphics file: '"/>
					</xsl:call-template>
				</DD>
			</DL>
		</DL>
		<A HREF="#Top">Back to Top</A>
	</xsl:template>

	<!-- ENUMERATION TEMPLATES -->
	<!-- 2 letter language code list from ISO 639 : 1988, in alphabetic order by code -->
	<!-- KMP : to be completed -->
	<xsl:template match="iso639-2:isoCode">
		<xsl:choose>
			<xsl:when test=". = 'aar'">Afar</xsl:when>
			<xsl:when test=". = 'abk'">Abkhazian</xsl:when>
			<xsl:when test=". = 'ace'">Ace</xsl:when>
			<xsl:when test=". = 'ach'">Ach</xsl:when>
			<xsl:when test=". = 'ada'">Ada</xsl:when>
			<xsl:when test=". = 'afa'">Afrikaans</xsl:when>
			<xsl:when test=". = 'afh'">Afh</xsl:when>
			<xsl:when test=". = 'afr'">Afr</xsl:when>
			<xsl:when test=". = 'am'">Amharic</xsl:when>
			<xsl:when test=". = 'ar'">Arabic</xsl:when>
			<xsl:when test=". = 'as'">Assamese</xsl:when>
			<xsl:when test=". = 'ay'">Aymara</xsl:when>
			<xsl:when test=". = 'az'">Azerbaijani</xsl:when>
			<xsl:when test=". = 'ba'">Bashkir</xsl:when>
			<xsl:when test=". = 'be'">Byelorussian</xsl:when>
			<xsl:when test=". = 'bg'">Bulgarian</xsl:when>
			<xsl:when test=". = 'bh'">Bihari</xsl:when>
			<xsl:when test=". = 'bi'">Bislama</xsl:when>
			<xsl:when test=". = 'bn'">Bengali, Bangla</xsl:when>
			<xsl:when test=". = 'bo'">Tibetan</xsl:when>
			<xsl:when test=". = 'br'">Breton</xsl:when>
			<xsl:when test=". = 'ca'">Catalan</xsl:when>
			<xsl:when test=". = 'co'">Corsican</xsl:when>
			<xsl:when test=". = 'cs'">Czech</xsl:when>
			<xsl:when test=". = 'cy'">Welsh</xsl:when>
			<xsl:when test=". = 'da'">Danish</xsl:when>
			<xsl:when test=". = 'de'">German</xsl:when>
			<xsl:when test=". = 'dz'">Bhutani</xsl:when>
			<xsl:when test=". = 'el'">Greek</xsl:when>
			<xsl:when test=". = 'en'">English</xsl:when>
			<xsl:when test=". = 'eo'">Esperanto</xsl:when>
			<xsl:when test=". = 'es'">Spanish</xsl:when>
			<xsl:when test=". = 'et'">Estonian</xsl:when>
			<xsl:when test=". = 'eu'">Basque</xsl:when>
			<xsl:when test=". = 'fa'">Persian</xsl:when>
			<xsl:when test=". = 'fi'">Finnish</xsl:when>
			<xsl:when test=". = 'fj'">Fiji</xsl:when>
			<xsl:when test=". = 'fo'">Faroese</xsl:when>
			<xsl:when test=". = 'fr'">French</xsl:when>
			<xsl:when test=". = 'fy'">Frisian</xsl:when>
			<xsl:when test=". = 'ga'">Irish</xsl:when>
			<xsl:when test=". = 'gd'">Scots Gaelic</xsl:when>
			<xsl:when test=". = 'gl'">Galician</xsl:when>
			<xsl:when test=". = 'gn'">Guarani</xsl:when>
			<xsl:when test=". = 'gu'">Gujarati</xsl:when>
			<xsl:when test=". = 'ha'">Hausa</xsl:when>
			<xsl:when test=". = 'hi'">Hindi</xsl:when>
			<xsl:when test=". = 'hr'">Croatian</xsl:when>
			<xsl:when test=". = 'hu'">Hungarian</xsl:when>
			<xsl:when test=". = 'hy'">Armenian</xsl:when>
			<xsl:when test=". = 'ia'">Interlingua</xsl:when>
			<xsl:when test=". = 'ie'">Interlingue</xsl:when>
			<xsl:when test=". = 'ik'">Inupiak</xsl:when>
			<xsl:when test=". = 'in'">Indonesian</xsl:when>
			<xsl:when test=". = 'is'">Icelandic</xsl:when>
			<xsl:when test=". = 'it'">Italian</xsl:when>
			<xsl:when test=". = 'iw'">Hebrew</xsl:when>
			<xsl:when test=". = 'ja'">Japanese</xsl:when>
			<xsl:when test=". = 'ji'">Yiddish</xsl:when>
			<xsl:when test=". = 'jw'">Javanese</xsl:when>
			<xsl:when test=". = 'ka'">Georgian</xsl:when>
			<xsl:when test=". = 'kk'">Kazakh</xsl:when>
			<xsl:when test=". = 'kl'">Greenlandic</xsl:when>
			<xsl:when test=". = 'km'">Cambodian</xsl:when>
			<xsl:when test=". = 'kn'">Kannada</xsl:when>
			<xsl:when test=". = 'ko'">Korean</xsl:when>
			<xsl:when test=". = 'ks'">Kashmiri</xsl:when>
			<xsl:when test=". = 'ku'">Kurdish</xsl:when>
			<xsl:when test=". = 'ky'">Kirghiz</xsl:when>
			<xsl:when test=". = 'la'">Latin</xsl:when>
			<xsl:when test=". = 'ln'">Lingala</xsl:when>
			<xsl:when test=". = 'lo'">Laothian</xsl:when>
			<xsl:when test=". = 'lt'">Lithuanian</xsl:when>
			<xsl:when test=". = 'lv'">Latvian, Lettish</xsl:when>
			<xsl:when test=". = 'mg'">Malagasy</xsl:when>
			<xsl:when test=". = 'mi'">Maori</xsl:when>
			<xsl:when test=". = 'mk'">Macedonian</xsl:when>
			<xsl:when test=". = 'ml'">Malayalam</xsl:when>
			<xsl:when test=". = 'mn'">Mongolian</xsl:when>
			<xsl:when test=". = 'mo'">Moldavian</xsl:when>
			<xsl:when test=". = 'mr'">Marathi</xsl:when>
			<xsl:when test=". = 'ms'">Malay</xsl:when>
			<xsl:when test=". = 'mt'">Maltese</xsl:when>
			<xsl:when test=". = 'my'">Burmese</xsl:when>
			<xsl:when test=". = 'na'">Nauru</xsl:when>
			<xsl:when test=". = 'ne'">Nepali</xsl:when>
			<xsl:when test=". = 'nl'">Dutch</xsl:when>
			<xsl:when test=". = 'no'">Norwegian</xsl:when>
			<xsl:when test=". = 'oc'">Occitan</xsl:when>
			<xsl:when test=". = 'om'">(Afan) Oromo</xsl:when>
			<xsl:when test=". = 'or'">Oriya</xsl:when>
			<xsl:when test=". = 'pa'">Punjabi</xsl:when>
			<xsl:when test=". = 'pl'">Polish</xsl:when>
			<xsl:when test=". = 'ps'">Pashto, Pushto</xsl:when>
			<xsl:when test=". = 'pt'">Portugese</xsl:when>
			<xsl:when test=". = 'qu'">Quechua</xsl:when>
			<xsl:when test=". = 'rm'">Rhaeto-Romance</xsl:when>
			<xsl:when test=". = 'rn'">Kirundi</xsl:when>
			<xsl:when test=". = 'ro'">Romanian</xsl:when>
			<xsl:when test=". = 'ru'">Russian</xsl:when>
			<xsl:when test=". = 'rw'">Kinyarwanda</xsl:when>
			<xsl:when test=". = 'sa'">Sanskrit</xsl:when>
			<xsl:when test=". = 'sd'">Sindhi</xsl:when>
			<xsl:when test=". = 'sg'">Sangho</xsl:when>
			<xsl:when test=". = 'sh'">Serbo-Croatian</xsl:when>
			<xsl:when test=". = 'si'">Singhalese</xsl:when>
			<xsl:when test=". = 'sk'">Slovak</xsl:when>
			<xsl:when test=". = 'sl'">Slovenian</xsl:when>
			<xsl:when test=". = 'sm'">Samoan</xsl:when>
			<xsl:when test=". = 'sn'">Shona</xsl:when>
			<xsl:when test=". = 'so'">Somali</xsl:when>
			<xsl:when test=". = 'sq'">Albanian</xsl:when>
			<xsl:when test=". = 'sr'">Serbian</xsl:when>
			<xsl:when test=". = 'ss'">Siswati</xsl:when>
			<xsl:when test=". = 'st'">Sesotho</xsl:when>
			<xsl:when test=". = 'su'">Sundanese</xsl:when>
			<xsl:when test=". = 'sv'">Swedish</xsl:when>
			<xsl:when test=". = 'sw'">Swahili</xsl:when>
			<xsl:when test=". = 'ta'">Tamil</xsl:when>
			<xsl:when test=". = 'te'">Telugu</xsl:when>
			<xsl:when test=". = 'tg'">Tajik</xsl:when>
			<xsl:when test=". = 'th'">Thai</xsl:when>
			<xsl:when test=". = 'ti'">Tigrinya</xsl:when>
			<xsl:when test=". = 'tk'">Turkmen</xsl:when>
			<xsl:when test=". = 'tl'">Tagalog</xsl:when>
			<xsl:when test=". = 'tn'">Setswana</xsl:when>
			<xsl:when test=". = 'to'">Tonga</xsl:when>
			<xsl:when test=". = 'tr'">Turkish</xsl:when>
			<xsl:when test=". = 'ts'">Tsonga</xsl:when>
			<xsl:when test=". = 'tt'">Tatar</xsl:when>
			<xsl:when test=". = 'tw'">Twi</xsl:when>
			<xsl:when test=". = 'uk'">Ukrainian</xsl:when>
			<xsl:when test=". = 'ur'">Urdu</xsl:when>
			<xsl:when test=". = 'uz'">Uzbek</xsl:when>
			<xsl:when test=". = 'vi'">Vietnamese</xsl:when>
			<xsl:when test=". = 'vo'">Volapuk</xsl:when>
			<xsl:when test=". = 'wo'">Wolof</xsl:when>
			<xsl:when test=". = 'xh'">Xhosa</xsl:when>
			<xsl:when test=". = 'yo'">Yoruba</xsl:when>
			<xsl:when test=". = 'zh'">Chinese</xsl:when>
			<xsl:when test=". = 'zu'">Zulu</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Character set code list (B.5.10 MD_CharacterSetCode) -->
	<xsl:template match="eur:mdChar | eur:dataChar">
		<xsl:choose>
			<xsl:when test=". = 'ucs2'">ucs2 - 16 bit Universal Character Set</xsl:when>
			<xsl:when test=". = 'ucs4'">ucs4 - 32 bit Universal Character Set</xsl:when>
			<xsl:when test=". = 'utf8'">utf8 - 8 bit UCS Transfer Format</xsl:when>
			<xsl:when test=". = 'utf16'">utf16 - 16 bit UCS Transfer Format</xsl:when>
			<xsl:when test=". = '8859part1'">8859part1 - Latin-1, Western European</xsl:when>
			<xsl:when test=". = '8859part2'">8859part2 - Latin-2, Central European</xsl:when>
			<xsl:when test=". = '8859part3'">8859part3 - Latin-3, South European</xsl:when>
			<xsl:when test=". = '8859part4'">8859part4 - Latin-4, North European</xsl:when>
			<xsl:when test=". = '8859part5'">8859part5 - Cyrillic</xsl:when>
			<xsl:when test=". = '8859part6'">8859part6 - Arabic</xsl:when>
			<xsl:when test=". = '8859part7'">8859part7 - Greek</xsl:when>
			<xsl:when test=". = '8859part8'">8859part8 - Hebrew</xsl:when>
			<xsl:when test=". = '8859part9'">8859part9 - Latin-5, Turkish</xsl:when>
			<xsl:when test=". = '8859part10'">8859part10 </xsl:when>
			<xsl:when test=". = '8859part11'">8859part11 - Thai</xsl:when>
			<xsl:when test=". = '8859part13'">8859part13</xsl:when>
			<xsl:when test=". = '8859part14'">8859part14 - Latin-8</xsl:when>
			<xsl:when test=". = '8859part15'">8859part15 - Latin-9</xsl:when>
			<xsl:when test=". = '8859part16'">8859part16</xsl:when>
			<xsl:when test=". = 'jis'">jis - Japanese for electronic transmission</xsl:when>
			<xsl:when test=". = 'shiftJIS'">shiftJIS - Japanese for MS-DOS</xsl:when>
			<xsl:when test=". = 'eucJP'">eucJP - Japanese for UNIX</xsl:when>
			<xsl:when test=". = 'usAscii'">U.S. ASCII</xsl:when>
			<xsl:when test=". = 'ebcdic'">ebcdic - IBM mainframe</xsl:when>
			<xsl:when test=". = 'eucKR'">eucKR - Korean</xsl:when>
			<xsl:when test=". = 'big5'">big5 - Taiwanese</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="eur:maintFreq">
		<xsl:choose>
			<xsl:when test=". = 'continual'">continual</xsl:when>
			<xsl:when test=". = 'daily'">daily</xsl:when>
			<xsl:when test=". = 'weekly'">weekly</xsl:when>
			<xsl:when test=". = 'fortnightly'">fortnightly</xsl:when>
			<xsl:when test=". = 'monthly'">monthly</xsl:when>
			<xsl:when test=". = 'quartely'">quarterly</xsl:when>
			<xsl:when test=". = 'biannually'">biannually</xsl:when>
			<xsl:when test=". = 'annually'">annually</xsl:when>
			<xsl:when test=". = 'asNeeded'">as needed</xsl:when>
			<xsl:when test=". = 'irregular'">irregular</xsl:when>
			<xsl:when test=". = 'notPlanned'">not planned</xsl:when>
			<xsl:when test=". = 'unknown'">unknown</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="iso19115:role">
		<xsl:choose>
			<xsl:when test=". = 'resourceProvider'">resource provider</xsl:when>
			<xsl:when test=". = 'custodian'">custodian</xsl:when>
			<xsl:when test=". = 'owner'">owner</xsl:when>
			<xsl:when test=". = 'user'">user</xsl:when>
			<xsl:when test=". = 'distributor'">distributor</xsl:when>
			<xsl:when test=". = 'originator'">originator</xsl:when>
			<xsl:when test=". = 'pointOfContact'">point of contact</xsl:when>
			<xsl:when test=". = 'principalInvestigator'">principal investigator</xsl:when>
			<xsl:when test=". = 'processor'">processor</xsl:when>
			<xsl:when test=". = 'publisher'">publisher</xsl:when>
			<xsl:when test=". = 'author'">author</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="iso19115:orFunct">
		<xsl:choose>
			<xsl:when test=". = 'download'">download</xsl:when>
			<xsl:when test=". = 'information'">information</xsl:when>
			<xsl:when test=". = 'offlineAccess'">offline access</xsl:when>
			<xsl:when test=". = 'order'">order</xsl:when>
			<xsl:when test=". = 'search'">search</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="eur:mdHrLv | eur:scpLvl">
		<xsl:choose>
			<xsl:when test=". = 'attribute'">attribute</xsl:when>
			<xsl:when test=". = 'attributeType'">attribute type</xsl:when>
			<xsl:when test=". = 'collectionHardware'">collection hardware</xsl:when>
			<xsl:when test=". = 'collectionSession'">collection session</xsl:when>
			<xsl:when test=". = 'dataset'">dataset</xsl:when>
			<xsl:when test=". = 'series'">series</xsl:when>
			<xsl:when test=". = 'nonGeographicDataset'">non-geographic dataset</xsl:when>
			<xsl:when test=". = 'dimensionGroup'">dimension group</xsl:when>
			<xsl:when test=". = 'feature'">feature</xsl:when>
			<xsl:when test=". = 'featureType'">feature type</xsl:when>
			<xsl:when test=". = 'propertyType'">property type</xsl:when>
			<xsl:when test=". = 'fieldSession'">field session</xsl:when>
			<xsl:when test=". = 'software'">software</xsl:when>
			<xsl:when test=". = 'service'">service</xsl:when>
			<xsl:when test=". = 'model'">model</xsl:when>
			<xsl:when test=". = 'tile'">tile</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="iso19115:refDateType">
		<xsl:choose>
			<xsl:when test=". = 'documentDigital'">document digital</xsl:when>
			<xsl:when test=". = 'documentHardcopy'">document hardcopy</xsl:when>
			<xsl:when test=". = 'imageDigital'">image digital</xsl:when>
			<xsl:when test=". = 'imageHardcopy'">image hardcopy</xsl:when>
			<xsl:when test=". = 'mapDigital'">map digital</xsl:when>
			<xsl:when test=". = 'mapHardcopy'">map hardcopy</xsl:when>
			<xsl:when test=". = 'modelDigital'">model digital</xsl:when>
			<xsl:when test=". = 'modelHardcopy'">model hardcopy</xsl:when>
			<xsl:when test=". = 'profileDigital'">profile digital</xsl:when>
			<xsl:when test=". = 'profileHardcopy'">profile hardcopy</xsl:when>
			<xsl:when test=". = 'tableDigital'">table digital</xsl:when>
			<xsl:when test=". = 'tableHardcopy'">table hardcopy</xsl:when>
			<xsl:when test=". = 'videoDigital'">video digital</xsl:when>
			<xsl:when test=". = 'videoHardcopy'">video hardcopy</xsl:when>
			<xsl:when test=". = 'collection'">collection</xsl:when>
			<xsl:when test=". = 'dataset'">dataset</xsl:when>
			<xsl:when test=". = 'event'">event</xsl:when>
			<xsl:when test=". = 'image'">image</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="iso19115:presForm">
		<xsl:choose>
			<xsl:when test=". = 'creation'">creation</xsl:when>
			<xsl:when test=". = 'publication'">publication</xsl:when>
			<xsl:when test=". = 'revision'">revision</xsl:when>
			<xsl:when test=". = 'modified'">modified</xsl:when>
			<xsl:when test=". = 'issued'">publication</xsl:when>
			<xsl:when test=". = 'validation'">validation</xsl:when>
			<xsl:when test=". = 'available'">available</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="eur:tpCat">
		<xsl:choose>
			<xsl:when test=". = 'farming'">farming</xsl:when>
			<xsl:when test=". = 'biota'">biota</xsl:when>
			<xsl:when test=". = 'boundaries'">boundaries</xsl:when>
			<xsl:when test=". = 'climatologyMeteorologyAtmosphere'">climatology, meteorology, and atmosphere</xsl:when>
			<xsl:when test=". = 'economy'">economy</xsl:when>
			<xsl:when test=". = 'elevation'">elevation</xsl:when>
			<xsl:when test=". = 'environment'">environment</xsl:when>
			<xsl:when test=". = 'geoscientificInformation'">geo-scientific information</xsl:when>
			<xsl:when test=". = 'health'">health</xsl:when>
			<xsl:when test=". = 'imageryBaseMapsEarthCover'">imagery base maps, and earth cover</xsl:when>
			<xsl:when test=". = 'intelligenceMilitary'">intelligence, and military</xsl:when>
			<xsl:when test=". = 'inlandWaters'">inland waters</xsl:when>
			<xsl:when test=". = 'location'">location</xsl:when>
			<xsl:when test=". = 'oceans'">oceans</xsl:when>
			<xsl:when test=". = 'planningCadastre'">planning, and cadastre</xsl:when>
			<xsl:when test=". = 'society'">society</xsl:when>
			<xsl:when test=". = 'structure'">structure</xsl:when>
			<xsl:when test=". = 'transportation'">transportation</xsl:when>
			<xsl:when test=". = 'utilitiesCommunication'">utilities, and communication</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="eur:idStatus">
		<xsl:choose>
			<xsl:when test=". = 'completed'">completed</xsl:when>
			<xsl:when test=". = 'historicalArchive'">historical archive</xsl:when>
			<xsl:when test=". = 'obsolete'">obsolete</xsl:when>
			<xsl:when test=". = 'onGoing'">on-going</xsl:when>
			<xsl:when test=". = 'planned'">planned</xsl:when>
			<xsl:when test=". = 'required'">required</xsl:when>
			<xsl:when test=". = 'underDevelopment'">under development</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="eur:spatRpType">
		<xsl:choose>
			<xsl:when test=". = 'vector'">vector</xsl:when>
			<xsl:when test=". = 'grid'">grid</xsl:when>
			<xsl:when test=". = 'textTable'">text table</xsl:when>
			<xsl:when test=". = 'tin'">tin</xsl:when>
			<xsl:when test=". = 'stereoModel'">stereo model</xsl:when>
			<xsl:when test=". = 'video'">video</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="eur:cellGeo">
		<xsl:choose>
			<xsl:when test=". = 'point'">point</xsl:when>
			<xsl:when test=". = 'area'">area</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="iso19115:dimName">
		<xsl:choose>
			<xsl:when test=". = 'row'">row (y-axis)</xsl:when>
			<xsl:when test=". = 'column'">column (x-axis)</xsl:when>
			<xsl:when test=". = 'vertical'">vertical (z-axis)</xsl:when>
			<xsl:when test=". = 'track'">track (along direction of motion)</xsl:when>
			<xsl:when test=". = 'crossTrack'">cross track (perpendicular to direction of motion)</xsl:when>
			<xsl:when test=". = 'line'">scal line of sensor</xsl:when>
			<xsl:when test=". = 'sample'">sample (element along scan line)</xsl:when>
			<xsl:when test=". = 'time'">time duration</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="eur:topLvl">
		<xsl:choose>
			<xsl:when test=". = 'geometryOnly'">geometry only</xsl:when>
			<xsl:when test=". = 'toplogy1D'">topology 1D</xsl:when>
			<xsl:when test=". = 'planarGraph'">planar graph</xsl:when>
			<xsl:when test=". = 'fullPlanarGraph'">full planar graph</xsl:when>
			<xsl:when test=". = 'surfaceGraph'">surface graph</xsl:when>
			<xsl:when test=". = 'fullSurfaceGraph'">full surface graph</xsl:when>
			<xsl:when test=". = 'topology3D'">topology 3D</xsl:when>
			<xsl:when test=". = 'fullTopology3D'">full topology 3D</xsl:when>
			<xsl:when test=". = 'abstract'">abstract</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="eur:geoObjTyp">
		<xsl:choose>
			<xsl:when test=". = 'complex'">complexes</xsl:when>
			<xsl:when test=". = 'composite'">composites</xsl:when>
			<xsl:when test=". = 'curve'">curve</xsl:when>
			<xsl:when test=". = 'point'">point</xsl:when>
			<xsl:when test=". = 'solid'">solid</xsl:when>
			<xsl:when test=". = 'surface'">surface</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="eur:contentTyp">
		<xsl:choose>
			<xsl:when test=". = 'image'">image</xsl:when>
			<xsl:when test=". = 'thematicClassification'">thematic classification</xsl:when>
			<xsl:when test=". = 'physicalMeasurement'">physical measurement</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="eur:pointInPixel">
		<xsl:choose>
			<xsl:when test=". = 'center'">center</xsl:when>
			<xsl:when test=". = 'lowerLeft'">lower left</xsl:when>
			<xsl:when test=". = 'lowerRight'">lower right</xsl:when>
			<xsl:when test=". = 'upperLeft'">upper left</xsl:when>
			<xsl:when test=". = 'upperRight'">upper right</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="eur:evalMethType">
		<xsl:choose>
			<xsl:when test=". = 'directInternal'">direct internal</xsl:when>
			<xsl:when test=". = 'directExternal'">direct external</xsl:when>
			<xsl:when test=". = 'indirect'">indirect</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="eur:falENUnits | eur:axisUnits">
		<xsl:choose>
			<xsl:when test=". = 'kilometer'">kilometer</xsl:when>
			<xsl:when test=". = 'meter'">meter</xsl:when>
			<xsl:when test=". = 'decimeter'">decimeter</xsl:when>
			<xsl:when test=". = 'mile'">mile'</xsl:when>
			<xsl:when test=". = 'yard'">yard</xsl:when>
			<xsl:when test=". = 'foot'">foot</xsl:when>
			<xsl:when test=". = 'nanometer'">nanometer</xsl:when>
			<xsl:when test=". = 'micrometer'">micrometer</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="eur:medName">
		<xsl:choose>
			<xsl:when test=". = 'cdRom'">CD-ROM</xsl:when>
			<xsl:when test=". = 'dvd'">DVD</xsl:when>
			<xsl:when test=". = 'dvdRom'">DVD-ROM</xsl:when>
			<xsl:when test=". = '3halfInchFloppy'">3.5 inch floppy disk</xsl:when>
			<xsl:when test=". = '5quarterInchFloppy'">5.25 inch floppy disk</xsl:when>
			<xsl:when test=". = '7trackTape'">7 track tape</xsl:when>
			<xsl:when test=". = '9trackTape'">9 track tape</xsl:when>
			<xsl:when test=". = '3480Cartridge'">3480 cartridge</xsl:when>
			<xsl:when test=". = '3490Cartridge'">3490 cartridge</xsl:when>
			<xsl:when test=". = '3580Cartridge'">3580 cartridge</xsl:when>
			<xsl:when test=". = '4mmCartridgeTape'">4mm cartridge tape</xsl:when>
			<xsl:when test=". = '8mmCartridgeTape'">8mm cartridge tape</xsl:when>
			<xsl:when test=". = '1quarterInchCartridgeTape'">0.25 inch cartridge tape</xsl:when>
			<xsl:when test=". = 'digitalLinearTape'">digital linear tape</xsl:when>
			<xsl:when test=". = 'onLine'">online link</xsl:when>
			<xsl:when test=". = 'satellite'">satellite link</xsl:when>
			<xsl:when test=". = 'telephoneLink'">telephone link</xsl:when>
			<xsl:when test=". = 'hardcopy'">hardcopy</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="eur:medFormat">
		<xsl:choose>
			<xsl:when test=". = 'cpio'">cpio</xsl:when>
			<xsl:when test=". = 'tar'">tar</xsl:when>
			<xsl:when test=". = 'highSierra'">high sierra file system</xsl:when>
			<xsl:when test=". = 'iso9660'">iso9660 (CD-ROM)</xsl:when>
			<xsl:when test=". = 'iso9660RockRidge'">iso9660 Rock Ridge</xsl:when>
			<xsl:when test=". = 'iso9660AppleHFS'">iso9660 Apple HFS</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="eur:eurTopic">
		<xsl:choose>
			<xsl:when test=". = 'elevation'">elevation</xsl:when>
			<xsl:when test=". = 'bathymetry'">bathymetry</xsl:when>
			<xsl:when test=". = 'shoreline'">shoreline</xsl:when>
			<xsl:when test=". = 'terrestrialAdministrativeBoundaries'">terrestrial Administrative Boundaries</xsl:when>
			<xsl:when test=". = 'marineAdministrativeBoundaries'">marine Administrative Boundaries</xsl:when>
			<xsl:when test=". = infrastructure">infrastructure</xsl:when>
			<xsl:when test=". = 'hydrography'">hydrography</xsl:when>
			<xsl:when test=". = 'geologicalGeomorphologicalFeatures'">geological Geomorphological Features</xsl:when>
			<xsl:when test=". = 'erosionTrend'">erosion Trend</xsl:when>
			<xsl:when test=". = 'actualLandCover'">actual Land Cover</xsl:when>
			<xsl:when test=". = 'landCoverChangesBetween1975And1990'">land Cover Changes Between 1975 And 1990</xsl:when>
			<xsl:when test=". = 'hydrodynamics'">hydrodynamics</xsl:when>
			<xsl:when test=". = 'seaLevel'">seaLevel</xsl:when>
			<xsl:when test=". = 'biodiversityAndNaturalHabitat'">biodiversity And Natural Habitat</xsl:when>
			<xsl:when test=". = 'socioEconomicalAspects'">socio Economical Aspects</xsl:when>
			<xsl:when test=". = 'landOwnershipPatterns'">land Ownership Patterns</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c)1998-2002 eXcelon Corp.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\..\MetadataModel\SchemaDesign\XML\eurosion_instance_2.xml" htmlbaseurl="" processortype="internal" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext=""/></scenarios><MapperInfo srcSchemaPath="" srcSchemaRoot="" srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
</metaInformation>
-->
