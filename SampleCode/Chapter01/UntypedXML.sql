CREATE TABLE UntypedXML
(
	UntypedXML_ID int IDENTITY PRIMARY KEY,
	UntypedXMLData XML
)

INSERT UntypedXML
SELECT '<Category>
  <CategoryName>Accessories</CategoryName>
  <Subcategory>
    <SubcategoryName>Bike Racks</SubcategoryName>
    <Product>
      <Name>Hitch Rack - 4-Bike</Name>
      <Number>RA-H123</Number>
      <Price>120.0000</Price>
    </Product>
  </Subcategory>
  <Subcategory>
    <SubcategoryName>Bike Stands</SubcategoryName>
    <Product>
      <Name>All-Purpose Bike Stand</Name>
      <Number>ST-1401</Number>
      <Price>159.0000</Price>
    </Product>
  </Subcategory>
</Category>
'

DECLARE @xml XML = '<char>
  <ToXML Entity="Entity ampersand &amp;; in XML data." />
  <ToXML Entity="Entity less-than sign &lt;; in XML data." />
  <ToXML Entity="Entity greater-than sign &gt;; in XML data." />
  <ToXML Entity="Entity apostrophe &apos;; in XML data." />
  <ToXML Entity="Entity quotation mark &quot;; in XML data." />
</char>
'
INSERT UntypedXML
SELECT @xml


SELECT UntypedXML_ID, UntypedXMLData FROM [dbo].[UntypedXML]
GO

CREATE PROC usp_Insert_UntypedXML
	@UntypedXML XML
AS
INSERT UntypedXML
SELECT @UntypedXML
GO




