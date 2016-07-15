<customer>
	<id_default_group/>
	<id_lang format="isUnsignedId"/>
	<newsletter_date_add/>
	<ip_registration_newsletter/>
	<last_passwd_gen readOnly="true"/>
	<secure_key format="isMd5" readOnly="true"/>
	<deleted format="isBool"/>
	<passwd format="isPasswd" maxSize="32" required="true"/>
	<lastname format="isName" maxSize="32" required="true"/>
	<firstname format="isName" maxSize="32" required="true"/>
	<email format="isEmail" maxSize="128" required="true"/>
	<id_gender format="isUnsignedId"/>
	<birthday format="isBirthDate"/>
	<newsletter format="isBool"/>
	<optin format="isBool"/>
	<website format="isUrl"/>
	<company format="isGenericName"/>
	<siret format="isSiret"/>
	<ape format="isApe"/>
	<outstanding_allow_amount format="isFloat"/>
	<show_public_prices format="isBool"/>
	<id_risk format="isUnsignedInt"/>
	<max_payment_days format="isUnsignedInt"/>
	<active format="isBool"/>
	<note format="isCleanHtml" maxSize="65000"/>
	<is_guest format="isBool"/>
	<id_shop format="isUnsignedId"/>
	<id_shop_group format="isUnsignedId"/>
	<date_add format="isDate"/>
	<date_upd format="isDate"/>
<associations>
<groups api="groups" nodeType="group">
	<group>
	<id/>
	</group>
</groups>
</associations>
</customer>
</prestashop>

