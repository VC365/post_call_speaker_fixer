print_modname() {
  ui_print "*******************************"
  ui_print "  Post Call Speaker Fixer"
  ui_print "        by VC365"
  ui_print "*******************************"
}

on_install() {
  ui_print "- Extracting module"
  unzip -o "$ZIPFILE" -x 'META-INF/*' -d "$MODPATH" >&2
}

set_permissions() {
  set_perm_recursive "$MODPATH" 0 0 0755 0644

  set_perm "$MODPATH/service.sh" 0 0 0755
  set_perm "$MODPATH/pcsfd.sh" 0 0 0755
}
