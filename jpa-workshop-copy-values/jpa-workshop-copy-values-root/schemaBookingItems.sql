CREATE SEQUENCE SEQ_BO_BOOKING_ITEM START WITH 1;
CREATE SEQUENCE SEQ_BI_BILLING_ITEM START WITH 1;


CREATE TABLE bo_booking_item (
	bo_booking_itemid int GENERATED BY DEFAULT AS SEQUENCE SEQ_BO_BOOKING_ITEM PRIMARY KEY,
	booking_date datetime NOT NULL,
	cancel_date datetime NULL,
	gd_status varchar(20) NOT NULL,
	gd_statusflowtype varchar(20) NOT NULL,
	au_useridins int NULL,
	insertdate datetime NULL,
	au_useridupd int NULL,
	modifydate datetime NULL,
	version numeric(4) NULL,
	dbuserins varchar(30) NULL,
	dbuserupd varchar(30) NULL
);
CREATE TABLE bo_booking_product_item (
	bo_booking_product_itemid int PRIMARY KEY,
	od_productid int NOT NULL,
	booking_product_item_reference varchar(60) NOT NULL,
	total_amount_tcy int NULL,
	total_amount_lcy int NULL,
	total_amount_scy int NULL,
	total_commision_amount_tcy int NULL,
	total_commision_amount_lcy int NULL,
	total_commision_amount_scy int NULL,
	currency_code_system varchar(30) NULL,
	currency_code_local varchar(30) NULL,
	currency_code_transaction varchar(30) NULL,
	od_taxid int NULL,
	au_useridins int NULL,
	insertdate datetime NULL,
	au_useridupd int NULL,
	modifydate datetime NULL,
	version numeric(4) NULL,
	dbuserins varchar(30) NULL,
	dbuserupd varchar(30) NULL,
	invoice_date datetime NULL,
	commision_percentage int NULL,
	bo_bookingid int NULL,
	cancel_amount_tcy int NULL,
	od_cxl_policy_ruleid int NULL,
	send_user_notification numeric(1) NULL,
	product_name varchar(255) NULL,
	seller_companyid int NULL,
	FOREIGN KEY(bo_booking_product_itemid) REFERENCES bo_booking_item(bo_booking_itemid) 
);
CREATE TABLE bo_booking_commission_item (
	bo_booking_commission_itemid int PRIMARY KEY,
	bo_booking_product_itemid int NOT NULL,
	total_commision_amount_tcy int NULL,
	total_commision_amount_lcy int NULL,
	total_commision_amount_scy int NULL,
	currency_code_system varchar(30) NULL,
	currency_code_local varchar(30) NULL,
	currency_code_transaction varchar(30) NULL,
	au_useridins int NULL,
	insertdate datetime NULL,
	au_useridupd int NULL,
	modifydate datetime NULL,
	version numeric(4) NULL,
	dbuserins varchar(30) NULL,
	dbuserupd varchar(30) NULL,
	FOREIGN KEY(bo_booking_commission_itemid) REFERENCES bo_booking_item(bo_booking_itemid),
	FOREIGN KEY(bo_booking_product_itemid) REFERENCES bo_booking_product_item(bo_booking_product_itemid) 
);
CREATE TABLE bi_billing_item (
	bi_billing_itemid int GENERATED BY DEFAULT AS SEQUENCE SEQ_BI_BILLING_ITEM PRIMARY KEY,
	item_type varchar(15) NOT NULL,
	business_type varchar(25) NOT NULL,
	bo_bookingid numeric NULL,
	item_source varchar(25) NOT NULL,
	invoice_id numeric NULL,
	document_number varchar(55) NULL,
	od_companyid numeric NULL,
	od_vendorid numeric NULL,
	od_customerid numeric NULL,
	default_fee numeric NULL,
	billing_item_amount_tcy numeric NOT NULL,
	billing_item_amount_lcy numeric NOT NULL,
	billing_item_amount_scy numeric NOT NULL,
	invoiced_item_amount_tcy numeric NULL,
	invoiced_item_amount_lcy numeric NULL,
	invoiced_item_amount_scy numeric NULL,
	paid_item_amount_tcy numeric NULL,
	paid_item_amount_lcy numeric NULL,
	paid_item_amount_scy numeric NULL,
	currency_code_transaction varchar(5) NOT NULL,
	currency_code_local varchar(5) NOT NULL,
	currency_code_system varchar(5) NOT NULL,
	gd_status varchar(30) NOT NULL,
	gd_statusflowtype varchar(30) NOT NULL,
	au_useridins numeric NULL,
	insertdate timestamp NULL,
	au_useridupd numeric NULL,
	modifydate timestamp NULL,
	version numeric(4) NULL,
	dbuserins varchar(30) NULL,
	dbuserupd varchar(30) NULL,
	bo_booking_itemid numeric NOT NULL,
	od_feeid numeric NULL,
	FOREIGN KEY (bo_booking_itemid) REFERENCES bo_booking_item(bo_booking_itemid),
);
