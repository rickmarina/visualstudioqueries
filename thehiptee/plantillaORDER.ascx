 <?xml version="1.0" encoding="UTF-8"?><prestashop xmlns:xlink="http://www.w3.org/1999/xlink">
<order>
	<id_address_delivery format="isUnsignedId" required="true"/>
	<id_address_invoice format="isUnsignedId" required="true"/>
	<id_cart format="isUnsignedId" required="true"/>
	<id_currency format="isUnsignedId" required="true"/>
	<id_lang format="isUnsignedId" required="true"/>
	<id_customer format="isUnsignedId" required="true"/>
	<id_carrier format="isUnsignedId" required="true"/>
	<current_state format="isUnsignedId" notFilterable="true"/>
	<module format="isModuleName" required="true"/>
	<invoice_number/>
	<invoice_date/>
	<delivery_number/>
	<delivery_date/>
	<valid/>
	<date_add format="isDate"/>
	<date_upd format="isDate"/>
	<shipping_number format="isTrackingNumber" notFilterable="true"/>
	<id_shop_group format="isUnsignedId"/>
	<id_shop format="isUnsignedId"/>
	<secure_key format="isMd5"/>
	<payment format="isGenericName" required="true"/>
	<recyclable format="isBool"/>
	<gift format="isBool"/>
	<gift_message format="isMessage"/>
	<mobile_theme format="isBool"/>
	<total_discounts format="isPrice"/>
	<total_discounts_tax_incl format="isPrice"/>
	<total_discounts_tax_excl format="isPrice"/>
	<total_paid format="isPrice" required="true"/>
	<total_paid_tax_incl format="isPrice"/>
	<total_paid_tax_excl format="isPrice"/>
	<total_paid_real format="isPrice" required="true"/>
	<total_products format="isPrice" required="true"/>
	<total_products_wt format="isPrice" required="true"/>
	<total_shipping format="isPrice"/>
	<total_shipping_tax_incl format="isPrice"/>
	<total_shipping_tax_excl format="isPrice"/>
	<carrier_tax_rate format="isFloat"/>
	<total_wrapping format="isPrice"/>
	<total_wrapping_tax_incl format="isPrice"/>
	<total_wrapping_tax_excl format="isPrice"/>
	<round_mode format="isUnsignedId"/>
	<round_type format="isUnsignedId"/>
	<conversion_rate format="isFloat" required="true"/>
	<reference/>
<associations>
<order_rows nodeType="order_row" virtualEntity="true">
	<order_row>
	<id/>
	<product_id required="true"/>
	<product_attribute_id required="true"/>
	<product_quantity required="true"/>
	<product_name readOnly="true" read_only="true"/>
	<product_reference readOnly="true" read_only="true"/>
	<product_ean13 readOnly="true" read_only="true"/>
	<product_upc readOnly="true" read_only="true"/>
	<product_price readOnly="true" read_only="true"/>
	<unit_price_tax_incl readOnly="true" read_only="true"/>
	<unit_price_tax_excl readOnly="true" read_only="true"/>
	</order_row>
</order_rows>
</associations>
</order>
</prestashop>