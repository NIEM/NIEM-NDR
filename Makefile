
target_files = \
  v5.0/changes-since-v4.0.html \
  v5.0/changes-since-v5.0beta1.html \

default: ${target_files}

v5.0/changes-since-v4.0.html: from_href = https://niem.github.io/NIEM-NDR/v4.0/niem-ndr-doc.html
v5.0/changes-since-v4.0.html: to_href = https://niem.github.io/NIEM-NDR/v5.0/niem-ndr.html
v5.0/changes-since-v4.0.html: v4.0/niem-ndr-doc.txt v5.0/niem-ndr.txt
	diff-to-html --title="Changes to NDR v5.0 since v4.0" \
	  --output-file=$@ --file-1-href=${from_href} --file-2-href=${to_href} $^

v5.0/changes-since-v5.0beta1.html: from_href = https://niem.github.io/NIEM-NDR/v5.0beta1/niem-ndr-doc.html
v5.0/changes-since-v5.0beta1.html: to_href = https://niem.github.io/NIEM-NDR/v5.0/niem-ndr.html
v5.0/changes-since-v5.0beta1.html: v5.0beta1/niem-ndr.txt v5.0/niem-ndr.txt
	diff-to-html --title="Changes to NDR v5.0 since v5.0beta1" \
	  --output-file=$@ --file-1-href=${from_href} --file-2-href=${to_href} $^

.PHONY: clean
clean:
	${RM} ${target_files}

