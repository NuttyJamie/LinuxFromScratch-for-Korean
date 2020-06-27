<?xml version='1.0' encoding='ISO-8859-1'?>

<!--
$LastChangedBy: bdubbs $
$Date: 2012-08-30 05:45:23 +0900 (Thu, 30 Aug 2012) $
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                version="1.0">

  <!-- This stylesheet controls how list are generated. -->

    <!-- What spacing do you want before and after lists? -->
  <xsl:attribute-set name="list.block.spacing">
    <xsl:attribute name="space-before.optimum">0.6em</xsl:attribute>
    <xsl:attribute name="space-before.minimum">0.4em</xsl:attribute>
    <xsl:attribute name="space-before.maximum">0.8em</xsl:attribute>
    <xsl:attribute name="space-after.optimum">0.6em</xsl:attribute>
    <xsl:attribute name="space-after.minimum">0.4em</xsl:attribute>
    <xsl:attribute name="space-after.maximum">0.8em</xsl:attribute>
  </xsl:attribute-set>

    <!-- What spacing do you want between list items? -->
  <xsl:attribute-set name="list.item.spacing">
    <xsl:attribute name="space-before.optimum">0.4em</xsl:attribute>
    <xsl:attribute name="space-before.minimum">0.2em</xsl:attribute>
    <xsl:attribute name="space-before.maximum">0.6em</xsl:attribute>
  </xsl:attribute-set>

    <!-- Properties that apply to each list-block generated by itemizedlist. -->
  <xsl:attribute-set name="itemizedlist.properties"
                     use-attribute-sets="list.block.properties">
    <xsl:attribute name="text-align">left</xsl:attribute>
  </xsl:attribute-set>

    <!-- Format variablelists lists as blocks? 1 = yes, 0 = no
           Default variablelist format. We override it when necessary
           using the list-presentation processing instruction. -->
  <xsl:param name="variablelist.as.blocks" select="1"/>

    <!-- Specifies the longest term in variablelists.
         Used when list-presentation = list -->
  <xsl:param name="variablelist.max.termlength">35</xsl:param>

    <!-- varlistentry mode block:
           Addibg a bullet, left alignament, and @kepp-*.* attributes
           for packages and paches list. -->
    <!-- The original template is in {docbook-xsl}/fo/list.xsl -->
  <xsl:template match="varlistentry" mode="vl.as.blocks">
    <xsl:variable name="id"><xsl:call-template name="object.id"/></xsl:variable>
    <xsl:choose>
      <xsl:when test="ancestor::variablelist/@role = 'materials'">
        <fo:block id="{$id}" xsl:use-attribute-sets="list.item.spacing"
                  keep-together.within-column="always" font-weight="bold"
                  keep-with-next.within-column="always" text-align="left">
          <xsl:text>&#x2022;   </xsl:text>
          <xsl:apply-templates select="term"/>
        </fo:block>
        <fo:block text-align="left"
                  keep-together.within-column="always"
                  keep-with-previous.within-column="always">
          <xsl:apply-templates select="listitem"/>
        </fo:block>
      </xsl:when>
      <xsl:otherwise>
        <fo:block id="{$id}" xsl:use-attribute-sets="list.item.spacing"
                  keep-together.within-column="always"
                  keep-with-next.within-column="always" margin-left="1em">
          <xsl:apply-templates select="term"/>
        </fo:block>
        <fo:block margin-left="2em">
          <xsl:apply-templates select="listitem"/>
        </fo:block>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

    <!-- segmentedlist:
           Making it an actual FO list to can indent items.
           Adjust vertical space. -->
    <!-- The original template is in {docbook-xsl}/fo/list.xsl -->
  <xsl:template match="segmentedlist">
    <xsl:variable name="id">
      <xsl:call-template name="object.id"/>
    </xsl:variable>
    <fo:list-block id="{$id}" provisional-distance-between-starts="12em"
                   provisional-label-separation="1em"
                   keep-together.within-column="always">
      <xsl:choose>
        <xsl:when test="ancestor::appendix[@id='appendixc']">
          <xsl:attribute name="space-before.optimum">0.2em</xsl:attribute>
          <xsl:attribute name="space-before.minimum">0em</xsl:attribute>
          <xsl:attribute name="space-before.maximum">0.4em</xsl:attribute>
          <xsl:attribute name="space-after.optimum">0.2em</xsl:attribute>
          <xsl:attribute name="space-after.minimum">0em</xsl:attribute>
          <xsl:attribute name="space-after.maximum">0.4em</xsl:attribute>
          <xsl:attribute name="keep-with-previous.within-column">always</xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="space-before.optimum">0.4em</xsl:attribute>
          <xsl:attribute name="space-before.minimum">0.2em</xsl:attribute>
          <xsl:attribute name="space-before.maximum">0.6em</xsl:attribute>
          <xsl:attribute name="space-after.optimum">0.4em</xsl:attribute>
          <xsl:attribute name="space-after.minimum">0.2em</xsl:attribute>
          <xsl:attribute name="space-after.maximum">0.6em</xsl:attribute>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="seglistitem/seg"/>
    </fo:list-block>
  </xsl:template>

    <!-- seg:
           Self-made template based on the original seg template
           found in {docbook-xsl}/fo/list.xsl
           Making segmentedlist an actual FO list to can indent items. -->
  <xsl:template match="seglistitem/seg">
    <xsl:variable name="id">
      <xsl:call-template name="object.id"/>
    </xsl:variable>
    <xsl:variable name="segnum" select="count(preceding-sibling::seg)+1"/>
    <xsl:variable name="seglist" select="ancestor::segmentedlist"/>
    <xsl:variable name="segtitles" select="$seglist/segtitle"/>
    <fo:list-item xsl:use-attribute-sets="compact.list.item.spacing">
      <fo:list-item-label end-indent="label-end()" text-align="start">
        <fo:block>
          <fo:inline font-weight="bold">
            <xsl:apply-templates select="$segtitles[$segnum=position()]"
                                 mode="segtitle-in-seg"/>
            <xsl:text>:</xsl:text>
          </fo:inline>
        </fo:block>
      </fo:list-item-label>
      <fo:list-item-body start-indent="body-start()">
        <fo:block id="{$id}">
          <xsl:apply-templates/>
        </fo:block>
      </fo:list-item-body>
    </fo:list-item>
  </xsl:template>

    <!-- simplelist:
           Self-made template. Wrap it into a fo:block and process member childs.
           If @type is specified, the original templates will be used.
           NOTE: when using type='horiz' or type='vert', FOP-0.93 will complaints
             about not supported table-layout="auto" -->
  <xsl:template match="simplelist">
    <fo:block xsl:use-attribute-sets="simplelist.properties">
      <xsl:apply-templates mode="condensed"/>
    </fo:block>
  </xsl:template>

    <!-- member:
           Self-made template to wrap it into a fo:block using customized
           properties. -->
  <xsl:template match="member" mode="condensed">
    <fo:block xsl:use-attribute-sets="simplelist.properties">
      <xsl:call-template name="simple.xlink">
        <xsl:with-param name="content">
          <xsl:apply-templates/>
        </xsl:with-param>
      </xsl:call-template>
    </fo:block>
  </xsl:template>

    <!-- Properties associated with our simplelist format. -->
  <xsl:attribute-set name="simplelist.properties">
    <xsl:attribute name="keep-with-previous.within-column">always</xsl:attribute>
    <xsl:attribute name="space-before.optimum">0em</xsl:attribute>
    <xsl:attribute name="space-before.minimum">0em</xsl:attribute>
    <xsl:attribute name="space-before.maximum">0.2em</xsl:attribute>
  </xsl:attribute-set>

</xsl:stylesheet>
