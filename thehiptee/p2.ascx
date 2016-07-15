<address>
	<id_customer format="isNullOrUnsignedId"/>
	<id_manufacturer format="isNullOrUnsignedId"/>
	<id_supplier format="isNullOrUnsignedId"/>
	<id_warehouse format="isNullOrUnsignedId"/>
	<id_country format="isUnsignedId" required="true"/> 6
	<id_state format="isNullOrUnsignedId"/>
	<alias format="isGenericName" maxSize="32" required="true"/>PRINCIPAL_WEB
	<company format="isGenericName" maxSize="64"/>
	<lastname format="isName" maxSize="32" required="true"/>
	<firstname format="isName" maxSize="32" required="true"/>
	<vat_number format="isGenericName"/>
	<address1 format="isAddress" maxSize="128" required="true"/>
	<address2 format="isAddress" maxSize="128"/>
	<postcode format="isPostCode" maxSize="12"/>
	<city format="isCityName" maxSize="64" required="true"/>
	<other format="isMessage" maxSize="300"/>
	<phone format="isPhoneNumber" maxSize="32"/>
	<phone_mobile format="isPhoneNumber" maxSize="32"/>
	<dni format="isDniLite" maxSize="16"/>
	<deleted format="isBool"/>
	<date_add format="isDate"/>
	<date_upd format="isDate"/>
</address>