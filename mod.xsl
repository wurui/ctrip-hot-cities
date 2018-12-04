<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:oxm="https://www.openxsl.com">
    <xsl:template match="/root" name="wurui.ctrip-hot-cities">
        <!-- className 'J_OXMod' required  -->
        <div class="J_OXMod oxmod-ctrip-hot-cities" ox-uid="{login/uid}" ox-mod="ctrip-hot-cities">
            
            <xsl:variable select="data/user-select/i[1]/selected" name="city"/>
            <div class="list" data-current="{$city}">
            	
            	<xsl:for-each select="data/ui-texts/i">

            		<input type="button" class="item" value="{.}">
            			<xsl:if test=". = $city">
            				<xsl:attribute name="class">item selected</xsl:attribute>
            			</xsl:if>
            		</input>
            	</xsl:for-each>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>
