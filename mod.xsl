<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:oxm="https://www.openxsl.com">
    <xsl:template match="/root" name="wurui.ctrip-hot-cities">
        <!-- className 'J_OXMod' required  -->
        <div class="J_OXMod oxmod-ctrip-hot-cities" ox-uid="{login/uid}" ox-mod="ctrip-hot-cities">
            <h3>
                热门城市
            </h3>
            <xsl:variable select="data/user-city/i[1]/city" name="city"/>
            <div class="list" data-current="{$city}">
            	
            	<xsl:for-each select="data/string-list/i">

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
