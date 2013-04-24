<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="#all"
    xmlns="http://www.tei-c.org/ns/1.0" 
    xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:rng="http://relaxng.org/ns/structure/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Apr 23, 2013</xd:p>
            <xd:p><xd:b>Author:</xd:b> mholmes</xd:p>
            <xd:p>This stylesheet is designed to generate a short paragraph
            and table of information about elements and classes for the 
            ST chapter of the Guidelines.</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:output method="xml" encoding="UTF-8"/>
    
    <xsl:template match="/">
<xsl:comment>
    THIS IS A GENERATED FILE.
    DO NOT EDIT!
</xsl:comment>
        
        <xsl:variable name="totalElements" select="count(distinct-values(//elementSpec/@ident))"/>
        
        <p>The present version of the TEI Guidelines includes some <xsl:value-of select="$totalElements"/> different elements. <ptr
            target="#tab-content-models"/> shows, in descending order of frequency, the seven most
            commonly used content models.<table xml:id="tab-content-models" rend="display">
                
                <row role="label">
                    <cell>Content model</cell>
                    <cell>Number of elements using this</cell>
                    <cell>Description</cell>
                </row>
                
                <xsl:variable name="rows">
                <xsl:for-each select="//macroSpec[@type='pe']">
                    <xsl:variable name="ident" select="@ident"/>

                    <row>
                        <cell><xsl:value-of select="@ident"/></cell>
                        <cell><xsl:value-of select="count(distinct-values(//elementSpec[descendant::rng:ref[@name=$ident]]/@ident))"/></cell>
                        <cell><xsl:apply-templates select="desc[1]"/></cell>
                    </row>
                    
                </xsl:for-each>
                </xsl:variable>
                
                <xsl:for-each select="$rows/row">
                    <xsl:sort select="cell[2] cast as xs:integer" order="descending"/>
                    <xsl:if test="position() lt 8"><xsl:copy-of select="."/> 
                    </xsl:if>
                </xsl:for-each>
            </table>
        </p>
        
    </xsl:template>
    
</xsl:stylesheet>