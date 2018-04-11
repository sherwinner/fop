<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
	<xsl:output method="text"/>
	<xsl:template match="/">
		<fo:root language="EN-AU">
			<fo:layout-master-set>
				<fo:simple-page-master master-name="A4-portrait" page-height="297mm" page-width="210mm" margin-top="15mm" margin-bottom="5mm" margin-left="5mm" margin-right="5mm">
					<fo:region-body margin-top="80mm" margin-bottom="10mm"/>
					<fo:region-before region-name="xsl-region-before" extent="25mm" display-align="before" precedence="true"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="A4-portrait">
				<fo:static-content flow-name="xsl-region-before">
				<fo:block  text-align="right" display-align="center" space-after="3mm">Page <fo:page-number/> of <fo:page-number-citation ref-id="end-of-document"/>
				</fo:block>
				<fo:table table-layout="fixed" width="100%" font-size="10pt">
						<fo:table-column column-width="proportional-column-width(30)"/>
						<fo:table-column column-width="proportional-column-width(30)"/>
						<fo:table-column column-width="proportional-column-width(30)"/>
						<fo:table-body>
							<fo:table-row height="8mm">
								<fo:table-cell text-align="left" display-align="center" padding-left="2mm">
									<fo:block space-before="5mm"/>
									<fo:block font-weight="bold" font-size="12pt" space-after="6pt">
									Invoice # <xsl:value-of select="cXML/Request/InvoiceDetailRequest/InvoiceDetailRequestHeader/@invoiceID"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell text-align="center" display-align="center" padding-left="2mm">
									<fo:block font-weight="bold" font-size="12pt" space-after="6pt">
										Invoice Date:  
										<xsl:variable name="date" select="cXML/Request/InvoiceDetailRequest/InvoiceDetailRequestHeader/@invoiceDate"/>
										<xsl:value-of select="concat(substring($date, 9, 2),'/',substring($date, 6, 2),'/',substring($date, 1, 4))"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell text-align="right" display-align="center" padding-left="2mm">
									<fo:block space-before="5mm"/>
									<fo:block font-weight="bold" font-size="12pt" space-after="6pt">
									Order # <xsl:value-of select="cXML/Request/InvoiceDetailRequest/InvoiceDetailOrder/InvoiceDetailOrderInfo/OrderReference/@orderID"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
					<fo:table table-layout="fixed" width="100%" font-size="10pt" border-color="black" border-width="0.4mm" border-style="solid">
						<fo:table-column column-width="proportional-column-width(85)"/>
						<fo:table-body>
							<fo:table-row height="8mm">
								<fo:table-cell text-align="center" display-align="center" font-size= "14pt" font-weight="bold">
									<fo:block font-size="120%">
									TAX INVOICE
									</fo:block>
									<fo:block space-after="3mm"/>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
					<fo:block space-before="5mm"/>
					<fo:table table-layout="fixed" width="100%" font-size="10pt" border-color="black" border-width="0.4mm" border-style="solid">
						<fo:table-column column-width="proportional-column-width(40)"/>
						<fo:table-column column-width="proportional-column-width(5)"/>
						<fo:table-column column-width="proportional-column-width(40)"/>
						<fo:table-body>
							<fo:table-row height="8mm">
								<fo:table-cell text-align="left" display-align="center" padding-left="2mm">
									<fo:block space-before="5mm"/>
									<fo:block>
									Supplier ABN : <xsl:value-of select="cXML/Request/InvoiceDetailRequest/InvoiceDetailRequestHeader/Extrinsic[@name='supplierVatID']"/>										
									</fo:block>
									<fo:block>
									Supplier Name : <xsl:value-of select="cXML/Request/InvoiceDetailRequest/InvoiceDetailRequestHeader/InvoiceDetailShipping/Contact[@role='shipFrom']/Name[@xml:lang='en']"/>
									</fo:block>
									</fo:table-cell>
								<fo:table-cell>	
									<fo:block>
									</fo:block>								
								</fo:table-cell>
								<fo:table-cell text-align="left" display-align="center" padding-left="2mm">
									<fo:block space-before="5mm"/>
									<fo:block>
									Buyer ABN : <xsl:value-of select="cXML/Request/InvoiceDetailRequest/InvoiceDetailRequestHeader/Extrinsic[@name='buyerVatID']"/>
									</fo:block>
									<fo:block>
									Buyer Name : <xsl:value-of select="cXML/Request/InvoiceDetailRequest/InvoiceDetailRequestHeader/InvoiceDetailShipping/Contact[@role='shipTo']/Name[@xml:lang='en']"/>
									</fo:block>
									</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
					<fo:block space-before="5mm"/>
					<fo:table table-layout="fixed" width="100%" font-size="10pt">
						<fo:table-column column-width="proportional-column-width(30)"/>
						<fo:table-column column-width="proportional-column-width(30)"/>
						<fo:table-body>
							<fo:table-row height="8mm">
								<fo:table-cell text-align="left" display-align="center" padding-left="2mm">
									<fo:block space-before="5mm"/>
									<fo:block space-before="5mm" font-weight="bold" font-size="14pt" space-after="6pt">
									Billing Address
									</fo:block>
									<fo:block>
										<xsl:value-of select="cXML/Request/InvoiceDetailRequest/InvoiceDetailRequestHeader/InvoicePartner/Contact[@role='billTo']/Name[@xml:lang='en']"/>
									</fo:block>
									<fo:block>
										<xsl:value-of select="cXML/Request/InvoiceDetailRequest/InvoiceDetailRequestHeader/InvoicePartner/Contact[@role='billTo']/PostalAddress/Street[1]"/>
									</fo:block>
									<fo:block>
										<xsl:value-of select="cXML/Request/InvoiceDetailRequest/InvoiceDetailRequestHeader/InvoicePartner/Contact[@role='billTo']/PostalAddress/Street[2]"/>
									</fo:block>
									<fo:block>
										<xsl:value-of select="cXML/Request/InvoiceDetailRequest/InvoiceDetailRequestHeader/InvoicePartner/Contact[@role='billTo']/PostalAddress/City"/>
									</fo:block>
									<fo:block>
										<xsl:value-of select="cXML/Request/InvoiceDetailRequest/InvoiceDetailRequestHeader/InvoicePartner/Contact[@role='billTo']/PostalAddress/State"/>, 
										<xsl:value-of select="cXML/Request/InvoiceDetailRequest/InvoiceDetailRequestHeader/InvoicePartner/Contact[@role='billTo']/PostalAddress/PostalCode"/>, <xsl:value-of select="cXML/Request/InvoiceDetailRequest/InvoiceDetailRequestHeader/InvoicePartner/Contact[@role='billTo']/PostalAddress/Country"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell text-align="left" display-align="center" padding-left="2mm">
									<fo:block space-before="5mm"/>
									<fo:block space-before="5mm" font-weight="bold" font-size="14pt" space-after="6pt">
									Shipping Address
									</fo:block>
									<fo:block>
									<xsl:value-of select="cXML/Request/InvoiceDetailRequest/InvoiceDetailRequestHeader/InvoiceDetailShipping/Contact[@role='shipTo']/Name[@xml:lang='en']"/>
									</fo:block>
									<fo:block>
									<xsl:value-of select="cXML/Request/InvoiceDetailRequest/InvoiceDetailRequestHeader/InvoiceDetailShipping/Contact[@role='shipTo'][@addressID='93382']/Name[@xml:lang='en']/Name[@xml:lang='en']"/>
									</fo:block>
									<fo:block>
									<xsl:value-of select="cXML/Request/InvoiceDetailRequest/InvoiceDetailRequestHeader/InvoiceDetailShipping/Contact[@role='shipTo']/PostalAddress/Street[1]"/>
									</fo:block>
									<fo:block>
									<xsl:value-of select="cXML/Request/InvoiceDetailRequest/InvoiceDetailRequestHeader/InvoiceDetailShipping/Contact[@role='shipTo']/PostalAddress/Street[2]"/>
									</fo:block>
									<fo:block>
									<xsl:value-of select="cXML/Request/InvoiceDetailRequest/InvoiceDetailRequestHeader/InvoiceDetailShipping/Contact[@role='shipTo']/PostalAddress/City"/>
									</fo:block>
									<fo:block>
									<xsl:value-of select="cXML/Request/InvoiceDetailRequest/InvoiceDetailRequestHeader/InvoiceDetailShipping/Contact[@role='shipTo']/PostalAddress/State"/>, 
									<xsl:value-of select="cXML/Request/InvoiceDetailRequest/InvoiceDetailRequestHeader/InvoiceDetailShipping/Contact[@role='shipTo']/PostalAddress/PostalCode"/>, <xsl:value-of select="cXML/Request/InvoiceDetailRequest/InvoiceDetailRequestHeader/InvoiceDetailShipping/Contact[@role='shipTo'][@addressID='93382']/PostalAddress/Country"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
				</fo:static-content>
				<fo:flow flow-name="xsl-region-body" border-collapse="collapse" reference-orientation="0">
					<fo:block font-weight="bold" font-size="14pt" space-after="6pt">
					Invoice Items
					</fo:block>
					<fo:table table-layout="fixed" width="100%" font-size="10pt" border-color="black" border-width="0.35mm" border-style="solid" text-align="left" display-align="center" space-after="5mm">
						<fo:table-column column-width="proportional-column-width(20)"/>
						<fo:table-column column-width="proportional-column-width(40)"/>
						<fo:table-column column-width="proportional-column-width(10)"/>
						<fo:table-column column-width="proportional-column-width(10)"/>
						<fo:table-column column-width="proportional-column-width(10)"/>
						<fo:table-column column-width="proportional-column-width(10)"/>
						<fo:table-body font-size="95%">
							<fo:table-row height="8mm">
								<fo:table-cell>
									<fo:block>Part #</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>Description</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>Qty.</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>Price (Ex. Tax)</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>Tax</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>Sub-Total</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="cXML/Request/InvoiceDetailRequest/InvoiceDetailOrder/InvoiceDetailItem">
								<fo:table-row>
									<fo:table-cell>
										<fo:block>
											<xsl:value-of select="InvoiceDetailItemReference/ItemID/SupplierPartID"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block>
											<xsl:value-of select="InvoiceDetailItemReference/Description"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block>
											<xsl:value-of select="@quantity"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block>
											<xsl:value-of select="SubtotalAmount/Money"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block>
											<xsl:value-of select="Tax/Money"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block>
											<xsl:value-of select="GrossAmount/Money"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
					</fo:table>
					<fo:block id="end-of-document">	
				    </fo:block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>
