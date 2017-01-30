

TARGETS = lib/jing.jar

default: $(TARGETS)

lib/%: jing-20091111/bin/%
	mkdir -p $(dir $@)
	install -m 444 -T $< $@

clean:
	$(RM) -rf lib
	find . -type f -name '*~' -print0 | xargs -0 rm -f




