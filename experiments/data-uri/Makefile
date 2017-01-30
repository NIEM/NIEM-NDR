

IMAGE_PNG := image.png

IMAGE_BASE64 := $(IMAGE_PNG:%.png=%.base64)

STRUCTURES_XSD := structures.xsd
STRUCTURES_BASE64 := $(STRUCTURES_XSD:%.xsd=%.base64)

TEST_HTML := test.html

TEST_XSL := test.xsl

default: $(TEST_HTML)

$(IMAGE_BASE64): $(IMAGE_PNG)
	base64 --wrap=0 $< > $@

$(STRUCTURES_BASE64): $(STRUCTURES_XSD)
	base64 --wrap=0 $< > $@

$(TEST_HTML): $(TEST_XSL) $(IMAGE_BASE64) $(STRUCTURES_BASE64)
	saxon -in empty.xml -xsl $< -out $@

clean:
	$(RM) $(IMAGE_BASE64) $(TEST_HTML) $(wildcard *~) $(STRUCTURES_BASE64)

