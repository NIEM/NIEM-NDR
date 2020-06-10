# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([NIEM JSON Specification],[0],[wr@gatech.edu],[niem-json-spec],[wr@gatech.edu])
AC_CONFIG_SRCDIR([Makefile.in])

####  Checks for programs.

# Autoconf standards

AC_PROG_INSTALL
AC_PROG_MKDIR_P
AC_PROG_SED

# unix stuff

AC_PATH_PROG(aspell,aspell)
test "x$[]$aspell" = "x" && AC_MSG_ERROR([aspell not found])

AC_PATH_PROG(bash,bash)
test "x$[]$bash" = "x" && AC_MSG_ERROR([bash not found])

AC_PATH_PROGS(cat,gcat cat)
test "x$[]$cat" = "x" && AC_MSG_ERROR([cat not found])

AC_PATH_PROG(fgrep,gfgrep fgrep)
test "x$[]$fgrep" = "x" && AC_MSG_ERROR([fgrep not found])

AC_PATH_PROG(m4,gm4 m4)
test "x$[]$m4" = "x" && AC_MSG_ERROR([m4 not found])

AC_PATH_PROG(sort,gsort sort)
test "x$[]$sort" = "x" && AC_MSG_ERROR([sort not found])

# webb stuff

AC_PATH_PROG(check_doc,check-doc)
test "x$[]$check_doc" = "x" && AC_MSG_ERROR([check-doc not found])

AC_PATH_PROG(process_doc,process-doc)
test "x$[]$process_doc" = "x" && AC_MSG_ERROR([process-doc not found])

AC_PATH_PROG(doc_to_schematron,doc-to-schematron)
test "x$[]$doc_to_schematron" = "x" && AC_MSG_ERROR([doc-to-schematron not found])

AC_PATH_PROG(schematron,schematron)
test "x$[]$schematron" = "x" && AC_MSG_ERROR([schematron not found])

AC_PATH_PROG(schematron_compile,schematron-compile)
test "x$[]$schematron_compile" = "x" && AC_MSG_ERROR([schematron-compile not found])

AC_PATH_PROG(schematron_execute,schematron-execute)
test "x$[]$schematron_execute" = "x" && AC_MSG_ERROR([schematron-execute not found])

AC_PATH_PROG(check_xml,check-xml)
test "x$[]$check_xml" = "x" && AC_MSG_ERROR([check-xml not found])

# AC_PATH_PROG(var,cmd)
# test "x$[]$var" = "x" && AC_MSG_ERROR([cmd not found])


### output & quit

AC_CONFIG_FILES([Makefile], [chmod 444 Makefile])
AC_CONFIG_FILES([run], [chmod 555 run])
AC_SUBST([config_files],$ac_config_files)
AC_OUTPUT
