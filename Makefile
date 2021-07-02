DESTDIR=/

build:
	make -C po build

pot:
	xgettext -o power-manager.pot --from-code="utf-8" src/*.py res/*.ui
	make -C po merge

install:
	mkdir -p $(DESTDIR)/usr/bin || true
	mkdir -p $(DESTDIR)/usr/share/applications/ || true
	mkdir -p $(DESTDIR)/etc/xdg/autostart/ || true
	mkdir -p $(DESTDIR)/usr/share/polkit-1/actions || true
	mkdir -p $(DESTDIR)/usr/lib/pardus/power-manager/tlp || true
	for dir in data po res src tlp-conf ; do \
	    make -C $$dir install ;\
	done

clean:
	make -C po clean
