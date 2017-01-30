
rfc-3986.pdf: rfc-3986.ps2
	ps2pdf $< $@

rfc-3986.ps2: rfc-3986.dot
	dot -Tps2 $< > $@

clean:
	$(RM) rfc-3986.pdf rfc-3986.ps2

open: rfc-3986.pdf
	open $<
