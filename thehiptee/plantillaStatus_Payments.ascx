STATUS HISTORY:

<?xml version="1.0" encoding="UTF-8"?><prestashop xmlns:xlink="http://www.w3.org/1999/xlink">
<order_history>
	<id_employee format="isUnsignedId"/>
	<id_order_state format="isUnsignedId" required="true"/>
	<id_order format="isUnsignedId" required="true"/>
	<date_add format="isDate"/>
</order_history>
</prestashop>


PAYMENTS :
<?xml version="1.0" encoding="UTF-8"?><prestashop xmlns:xlink="http://www.w3.org/1999/xlink">
<order_payment>
	<order_reference format="isAnything" maxSize="9"/>
	<id_currency format="isUnsignedId" required="true"/>
	<amount format="isNegativePrice" required="true"/>
	<payment_method format="isGenericName"/>
	<conversion_rate format="isFloat"/>
	<transaction_id format="isAnything" maxSize="254"/>
	<card_number format="isAnything" maxSize="254"/>
	<card_brand format="isAnything" maxSize="254"/>
	<card_expiration format="isAnything" maxSize="254"/>
	<card_holder format="isAnything" maxSize="254"/>
	<date_add format="isDate"/>
</order_payment>
</prestashop>