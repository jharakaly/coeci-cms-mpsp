<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:xdt="http://www.w3.org/2005/xpath-datatypes"
    xmlns:err="http://www.w3.org/2005/xqt-errors"
    xmlns:ext="http://gov.medicaid.services.enrollment/ValidationService"
    xmlns:ext2="http://gov.medicaid.shared/Entities"
    exclude-result-prefixes="xs xdt err fn">

    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    
    <xsl:template match="/">
		<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:impl="http://impl.services.screening.medicaid.gov/">
		   <soapenv:Header/>
		   <soapenv:Body>
		      <impl:doSearch>
		         <arg0>
		            <xsl:for-each select="//ext:SAMVerificationRequest/ext:ProviderInformation/ext2:ApplicantInformation/ext2:PersonalInformation">
			            <firstName><xsl:value-of select="//ext:SAMVerificationRequest/ext:ProviderInformation/ext2:ApplicantInformation/ext2:PersonalInformation/ext2:FirstName/text()"></xsl:value-of></firstName>
			            <middleName><xsl:value-of select="//ext:SAMVerificationRequest/ext:ProviderInformation/ext2:ApplicantInformation/ext2:PersonalInformation/ext2:MiddleName/text()"></xsl:value-of></middleName>
			            <lastName><xsl:value-of select="//ext:SAMVerificationRequest/ext:ProviderInformation/ext2:ApplicantInformation/ext2:PersonalInformation/ext2:LastName/text()"></xsl:value-of></lastName>
		            </xsl:for-each>
                    <xsl:for-each select="//ext:SAMVerificationRequest/ext:ProviderInformation/ext2:ApplicantInformation/ext2:OrganizationInformation">
			            <partialName><xsl:value-of select="//ext:SAMVerificationRequest/ext:ProviderInformation/ext2:ApplicantInformation/ext2:OrganizationInformation/ext2:Name/text()"></xsl:value-of></partialName>
		            </xsl:for-each>
		         </arg0>
		      </impl:doSearch>
		   </soapenv:Body>
		</soapenv:Envelope>
    </xsl:template>

</xsl:stylesheet>